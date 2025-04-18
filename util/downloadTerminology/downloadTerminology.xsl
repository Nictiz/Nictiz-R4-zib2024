<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:f="http://hl7.org/fhir"
    xmlns:nf="http://nictiz.nl/xsl/functions"
    exclude-result-prefixes="#all"
    version="2.0">
    <xsl:output omit-xml-declaration="yes"/>
    <xsl:include href="rewriteTerminologyResource.xsl"/>

    <xsl:param name="sourceDir" as="xs:string">../../</xsl:param>
    
    <!-- If set to true, resources are downloaded and saved even if they are already present on disk. Useful after
         updates of ART-DECOR. -->
    <xsl:param name="overwrite" as="xs:boolean" select="false()"/>
    
    <xsl:template name="main">
        <xsl:call-template name="handleReferences">
            <xsl:with-param name="type" select="'ValueSet'" tunnel="yes"/>
        </xsl:call-template>
        
        <xsl:call-template name="handleReferences">
            <xsl:with-param name="type" select="'CodeSystem'" tunnel="yes"/>
        </xsl:call-template>
    </xsl:template>

    <!--
        Main template to download ValueSet and CodeSystem resources based on the bindings/references in other
        resources.
        This template can be called recursively because freshly added ValueSets might include references to other
        ValueSets, so we need to keep on processing until no new bindings appear anymore. This is not relevant
        for CodeSystems.
        Parameters:
        - type: either 'ValueSet' or 'CodeSystem', based on what needs to be processed.
        - alreadyHandled: a list of references that already has been processed. See fn:findValueSetReferences() for
                          documentation on the format.
    -->
    <xsl:template name="handleReferences">
        <xsl:param name="type" required="yes" tunnel="yes"/>
        <xsl:param name="alreadyHandled" as="element(reference)*" select="()"/>

        <xsl:variable name="present" select="if ($type = 'ValueSet') then 
            collection(concat($sourceDir, '?select=*.xml;recurse=yes'))/f:ValueSet else
            collection(concat($sourceDir, '?select=*.xml;recurse=yes'))/f:CodeSystem"/>
        <xsl:variable name="references" select="if ($type = 'ValueSet') then
            nf:findValueSetReferences($sourceDir, $alreadyHandled) else 
            nf:findCodeSystemReferences($sourceDir)"/>
        <xsl:for-each select="$references">
            <xsl:variable name="url" select="string(@url)"/>
            <xsl:variable name="present" select="$present[f:url/@value = $url]"/>
            <xsl:choose>
                <xsl:when test="count($present) = 1">
                    <xsl:if test="$overwrite = true()">
                        <xsl:call-template name="downloadResource">
                            <xsl:with-param name="url" select="$url" tunnel="yes"/>
                            <xsl:with-param name="outputDir" select="@outputDir" tunnel="yes"/>
                            <xsl:with-param name="oldFilePath" select="base-uri($present)" tunnel="yes"/>
                        </xsl:call-template>
                    </xsl:if>
                </xsl:when>
                <xsl:when test="count($present) = 0">
                    <xsl:call-template name="downloadResource">
                        <xsl:with-param name="url" select="$url" tunnel="yes"/>
                        <xsl:with-param name="outputDir" select="@outputDir" tunnel="yes"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:message>====================</xsl:message>
                    <xsl:message select="concat('Duplicate found for resource with url ', ./@url, ':')"/>
                    <xsl:for-each select="$present">
                        <xsl:message select="concat('- ', base-uri())"/>
                    </xsl:for-each>
                    <xsl:message>Resource will not be downloaded. Please resolve the conflict first!</xsl:message>
                    <xsl:message>====================</xsl:message>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>

        <!--
            If we have processed new ValueSets, we should check the (possibly) added ValueSets again for ValueSet
            bindings. So we call this template again.
        -->
        <xsl:if test="$type = 'ValueSet' and count($references) &gt; 0">
            <xsl:call-template name="handleReferences">
                <xsl:with-param name="alreadyHandled" select="($alreadyHandled | $references)"/>
            </xsl:call-template>           
        </xsl:if>
    </xsl:template>

    <!--
        Scan the source dir for all ValueSet bindings that have not been processed so far.
        Both the output and the alreadyHandled parameters are a list of elements called 'reference' with two attributes:
        - uri: the canonical uri of the ValueSet to handle
        - outputDir: the dir where the resulting file should be placed (based on the location of the files that
                     reference the ValueSet, and determined by fn:getOutputDir()
    -->
    <xsl:function name="nf:findValueSetReferences" as="element(reference)*">
        <xsl:param name="sourceDir"/>
        <xsl:param name="alreadyHandled" as="element(reference)*"/>

        <xsl:variable name="urls"
            select="collection(concat($sourceDir, '?select=*.xml;recurse=yes'))/(f:StructureDefinition//f:binding/f:valueSet | f:StructureDefinition//f:binding/f:extension[@url = 'http://hl7.org/fhir/tools/StructureDefinition/additional-binding']/f:extension[@url = 'valueSet']/f:valueCanonical | f:ValueSet//f:include/f:valueSet | f:ConceptMap/f:sourceCanonical | f:ConceptMap/f:targetCanonical)/@value[starts-with(., 'http://decor.nictiz.nl/fhir/')]" as="attribute()*"/>

        <xsl:variable name="references" as="element(reference)*">
            <xsl:for-each-group select="$urls" group-by="string(.)">
                <xsl:if test="not($alreadyHandled[string(@url) = current-grouping-key()])">
                    <reference>
                        <xsl:attribute name="url" select="current-grouping-key()"/>
                        <xsl:attribute name="outputDir" select="nf:getOutputDir(current-group())"/>
                    </reference>       
                </xsl:if>
            </xsl:for-each-group>
        </xsl:variable>
        <xsl:copy-of select="$references"/>
    </xsl:function>

    <!--
        Scan the source dir for all CodeSystem references that we need to include.
        The output is the same as for nf:findValueSetReferences().
    -->
    <xsl:function name="nf:findCodeSystemReferences" as="element(reference)*">
        <xsl:param name="sourceDir"/>

        <xsl:variable name="urls" select="collection(concat($sourceDir, '?select=*.xml;recurse=yes'))//(f:StructureDefinition|f:ValueSet)//f:system[starts-with(@value, 'http') or starts-with(@value, 'urn:')][not(parent::f:identifier or parent::f:patternIdentifier or contains(@value, 'urn:iso') or contains(@value, 'loinc.org') or contains(@value, 'snomed.info') or contains(@value, 'terminology.hl7.org') or @value = 'http://hl7.org/fhir/contact-point-system' or @value = 'http://hl7.org/fhir/contact-point-use' or @value = 'http://hl7.org/fhir/FHIR-version' or @value = 'http://www.nanda.org/' or @value = 'https://nursing.uiowa.edu/cncce/nursing-interventions-classification-overview')]/@value" as="attribute()*"/>
        <!-- contact-point-system, contact-point-use and FHIR-version are added as hardcoded exemptions, because we do reference them from ValueSets, but there is no need to include them in our package since they are already included in the core package. Including 'starts-with('http://hl7.org/fhir/')' would result in too much being excluded
        Nanda and NIC are added as hardcoded exemptions, because their URLs have changed in the latest release of HL7 Terminology to not start with 'terminology.hl7.org' anymore, but we still do not have to include them-->

        <xsl:variable name="references" as="element(reference)*">
            <xsl:for-each-group select="$urls" group-by="string(.)">
                <reference>
                    <xsl:attribute name="url" select="current-grouping-key()"/>
                    <xsl:attribute name="outputDir" select="nf:getOutputDir(current-group())"/>
                </reference>       
            </xsl:for-each-group>
        </xsl:variable>
        <xsl:copy-of select="$references"/>
    </xsl:function>

    <!-- Wrapper to call the templates to download either a ValueSet or a CodeSystem resource, based on the type parameter. -->
    <xsl:template name="downloadResource">
        <xsl:param name="type" required="yes" as="xs:string" tunnel="yes"/>

        <xsl:choose>
            <xsl:when test="$type = 'ValueSet'">
                <xsl:call-template name="downloadValueSet"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="downloadCodeSystem"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="downloadValueSet">
        <xsl:param name="url" as="xs:string" tunnel="yes"/>
        <xsl:param name="outputDir" as="xs:string" tunnel="yes"/>
        <xsl:param name="oldFilePath" required="no" tunnel="yes"/>

        <!-- Get and rewrite ValueSet -->
        <xsl:variable name="downloadURI" select="replace($url, '^http(s?)://decor.nictiz.nl/fhir/ValueSet', 'https://acceptance.art-decor.org/fhir/ValueSet')"/>
        <xsl:variable name="valueSet" as="element()?">
            <xsl:apply-templates mode="rewrite" select="doc($downloadURI)/*"/>
        </xsl:variable>
        
        <!-- Construct output location -->
        <xsl:variable name="name" select="$valueSet/descendant-or-self::f:ValueSet/f:name/@value"/>
        <xsl:variable name="idVersion" select="tokenize($url, '/')[last()]"/>
        <xsl:variable name="fileName" select="concat('ValueSet-', $name, '-', $idVersion, '.xml')"/>
        <xsl:variable name="outputURL" select="string(resolve-uri(concat($outputDir, $fileName)))"/>

        <!-- Write out the file -->
        <xsl:message select="concat('Writing ', $outputURL)"/>
        <xsl:result-document href="{$outputURL}" indent="yes" method="xml" omit-xml-declaration="yes">
            <xsl:copy-of select="$valueSet"/>
        </xsl:result-document>

        <xsl:call-template name="checkForChangedPath">
            <xsl:with-param name="oldURL" select="$oldFilePath"/>
            <xsl:with-param name="newURL" select="$outputURL"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="downloadCodeSystem">
        <xsl:param name="url" required="yes" as="xs:string" tunnel="yes"/>
        <xsl:param name="outputDir" required="yes" as="xs:string" tunnel="yes"/>
        <xsl:param name="oldFilePath" required="no" tunnel="yes"/>

        <!-- Get and rewrite CodeSystem -->
        <xsl:variable name="downloadURL">
            <xsl:choose>
                <xsl:when test="starts-with($url, 'urn:oid:')">
                    <xsl:value-of select="concat('https://acceptance.art-decor.org/fhir/CodeSystem/', substring-after($url, 'urn:oid:'))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat('https://acceptance.art-decor.org/fhir/CodeSystem?url=', encode-for-uri($url))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="codeSystem" as="element()?">
            <xsl:apply-templates select="doc($downloadURL)//f:CodeSystem" mode="rewrite"/>
        </xsl:variable> 
        
        <!-- Construct file name -->
        <xsl:variable name="name" select="$codeSystem/descendant-or-self::f:CodeSystem/f:name/@value"/>
        <xsl:variable name="idVersion" select="tokenize(tokenize($url, '/')[last()], ':')[last()]"/>
        <xsl:variable name="fileName">
            <xsl:choose>
                <xsl:when test="$codeSystem">
                    <xsl:value-of select="concat('CodeSystem-', $name, '-', $idVersion, '.xml')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat('unknown-codesystem-', $idVersion, '.xml')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="outputURL" select="string(resolve-uri(concat($outputDir, $fileName)))"/>

        <!-- Write out the file -->
        <xsl:message select="concat('Writing ', resolve-uri(concat($outputDir, $fileName)))"/>
        <xsl:choose>
            <xsl:when test="$codeSystem">
                <xsl:result-document href="{concat($outputDir, $fileName)}" indent="yes" method="xml" omit-xml-declaration="yes">
                    <xsl:copy-of select="$codeSystem"/>
                </xsl:result-document>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message>====================</xsl:message>
                <xsl:message>Could not retrieve CodeSystem with id <xsl:value-of select="$idVersion"/>.</xsl:message>
                <xsl:message>An empty CodeSystem resource is created as placeholder instead</xsl:message>
                <xsl:message>====================</xsl:message>
                <xsl:result-document href="{concat($outputDir, $fileName)}" indent="yes" method="xml" omit-xml-declaration="yes">
                    <CodeSystem xmlns="http://hl7.org/fhir">
                        <id value="{$idVersion}"/>
                        <meta>
                            <profile value="http://hl7.org/fhir/StructureDefinition/shareablecodesystem"/>
                            <!--<profile value="http://hl7.org/fhir/4.0/StructureDefinition/CodeSystem"/>-->
                        </meta>
                        <url value="{$url}"/>
                        <name value="{$idVersion}"/>
                        <title value="{$idVersion}"/>
                        <status value="unknown"/>
                        <content value="not-present"/>
                    </CodeSystem>
                </xsl:result-document>
            </xsl:otherwise>
        </xsl:choose>

        <xsl:call-template name="checkForChangedPath">
            <xsl:with-param name="oldURL" select="$oldFilePath"/>
            <xsl:with-param name="newURL" select="$outputURL"/>
        </xsl:call-template>
    </xsl:template>

    <!--
        Get the desired output dir for the downloaded resource, based on the location of the files that require it.
        This is determined by passing a list of all the attributes extracted from the input files that contain a 
        reference for the specified resource. If there's is one attribute coming from a file in the zib folder, the
        output will be placed in zibs/terminology, otherwise it will be placed in zibs/nl-core.
    -->
    <xsl:function name="nf:getOutputDir" as="xs:string">
        <xsl:param name="uriAttributes" as="attribute()*"/>

        <xsl:choose>
            <xsl:when test="(for $uri in $uriAttributes return contains(base-uri($uri), '/zib/')) != false()">
                <xsl:value-of>../../zib/vocabulary/generated/</xsl:value-of>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of>../../nl-core/vocabulary/generated/</xsl:value-of>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <!-- Check if a newly downloaded file is saved under a different name, and emit a warning if this is the case. -->
    <xsl:template name="checkForChangedPath">
        <xsl:param name="type" tunnel="yes"/>
        <xsl:param name="oldURL" as="xs:string"/>
        <xsl:param name="newURL" as="xs:string"/>

        <xsl:if test="(string-length($oldURL) &gt; 0) and ($oldURL != $newURL)">
            <xsl:message>====================</xsl:message>
            <xsl:message select="concat($type, ' is re-downloaded, but saved under a different name!')"/>
            <xsl:message select="concat('- Old name: ', $oldURL)"/>
            <xsl:message select="concat('- New name: ', $newURL)"/>
            <xsl:message>You should manually remove the old file!</xsl:message>
            <xsl:message>====================</xsl:message>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>