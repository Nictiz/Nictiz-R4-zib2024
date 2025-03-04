<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:loc="urn:local:urn"
    xmlns:f="http://hl7.org/fhir"
    xmlns="http://hl7.org/fhir"
    exclude-result-prefixes="#all"
    version="2.0">
    
    <xsl:output indent="yes"/>
    
    <!-- Show (optional) warnings to 'validate' content of profile -->
    <xsl:param name="showWarnings" select="true()"/>

    <!-- If metadata are present, overwrite them with values from the DECOR definitions file -->
    <xsl:param name="overwrite" select="true()"/>

    <!-- Zib decor project file -->
    <xsl:param name="allDatasets" select="document('zib2024bbr-decor.xml')/decor/datasets"/>
    
    <!-- Unique identification string for when mappings are implicit, as described in the profiling guidelines -->
    <xsl:param name="implicitIdentifier" select="' (implicit, main mapping is on '"/>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="f:StructureDefinition">
        <xsl:copy>
            <xsl:variable name="id" select="f:id/@value"/>
            <xsl:apply-templates select="f:id | f:meta | f:implicitRules | f:language"/>

            <!-- Add or modify empty narrative -->
            <xsl:choose>
                <xsl:when test="f:text">
                    <xsl:copy-of select="f:text"/>
                </xsl:when>
                <xsl:otherwise>
                    <text>
                        <status value="empty"/>
                        <div xmlns="http://www.w3.org/1999/xhtml">No narrative is provided for definitional resources. A human-readable rendering can be found in the implementation guide(s) where this resource is used.</div>
                    </text>
                </xsl:otherwise>
            </xsl:choose>

            <xsl:apply-templates select="f:contained | f:extension | f:modifierExtension"/>
            
            <!-- Add or modify URL -->
            <xsl:choose>
                <xsl:when test="(not(f:url) or starts-with(f:url/@value, 'http://example.org/')  or starts-with(f:url/@value, 'https://example.org/')) and (starts-with($id, 'zib-') or starts-with($id, 'nl-core-'))">
                    <url value="http://nictiz.nl/fhir/StructureDefinition/{$id}"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="f:url"/>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:apply-templates select="f:identifier | f:version"/>
            
            <!-- Add or modify name, title, status -->
            <xsl:choose>
                <xsl:when test="not(f:url) or starts-with(f:name/@value, 'My')">
                    <name value="{replace(concat(upper-case(substring($id,1,1)), substring($id, 2)),'-','')}"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="f:name"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="not(f:title)">
                    <title value="{replace($id,'-',' ')}"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="f:title"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="not(f:status)">
                    <status value="draft"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="f:status"/>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:apply-templates select="f:experimental | f:date"/>
            
            <!-- Add publisher, contact, description-->
            <xsl:choose>
                <xsl:when test="not(f:publisher)">
                    <publisher value="Nictiz"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="f:publisher"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="not(f:contact)">
                    <contact>
                        <name value="Nictiz" />
                        <telecom>
                            <system value="url" />
                            <value value="https://www.nictiz.nl" />
                            <use value="work" />
                        </telecom>
                    </contact>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="f:contact"/>
                </xsl:otherwise>
            </xsl:choose>
            <!-- Automagical description takes too much time atm. -->
            <xsl:apply-templates select="f:description"/>
            
            <xsl:apply-templates select="f:useContext | f:jurisdiction"/>
            
            <!-- Add purpose, copyright -->
            <xsl:choose>
                <xsl:when test="not(f:purpose) and starts-with($id, 'zib-')">
                    <xsl:variable name="mapping" select="f:mapping[f:identity/starts-with(@value, 'zib-')][1]"/>
                    <purpose value="This {f:type/@value} resource represents the Dutch [zib ('Zorginformatiebouwsteen', i.e. Health and Care Information Model) {replace($mapping/f:name/@value, 'zib ','')}]({$mapping/f:uri/@value})."/>
                </xsl:when>
                <xsl:when test="not(f:purpose) and starts-with($id, 'nl-core-')">
                    <purpose value="A derived profile from [{replace($id, 'nl-core-','zib-')}](http://nictiz.nl/fhir/StructureDefinition/{replace($id, 'nl-core-','zib-')}) to provide a version better suited for implementation purposes. This profile augments the base profile with elements found in the various use cases that have adopted the zib."/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="f:purpose"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="not(f:copyright)">
                    <copyright value="Copyright and related rights waived via CC0, https://creativecommons.org/publicdomain/zero/1.0/. This does not apply to information from third parties, for example a medical terminology system. The implementer alone is responsible for identifying and obtaining any necessary licenses or authorizations to utilize third party IP in connection with the specification or otherwise."/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="f:copyright"/>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:apply-templates select="f:keyword | f:fhirVersion | f:mapping | f:kind"/>
            
            <!-- Modify abstract -->
            <xsl:choose>
                <xsl:when test="f:abstract/@value = 'false' and starts-with($id, 'zib-')">
                    <abstract value="true"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="f:abstract"/>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:apply-templates select="f:context | f:contextInvariant | f:type"/>
            
            <!-- Edits the baseDefinition from core to zib if an nl-core profile was not created using the 'Derive' button in Forge -->
            <xsl:choose>
                <xsl:when test="starts-with($id, 'nl-core-') and (not(f:baseDefinition) or starts-with(f:baseDefinition/@value, 'http://hl7.org'))">
                    <baseDefinition value="http://nictiz.nl/fhir/StructureDefinition/{replace($id, 'nl-core-','zib-')}"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="f:baseDefinition"/>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:apply-templates select="f:derivation"/>
            
            <!-- Add id as alias to root of nl-core profile if no differential or snapshot is found -->
            <xsl:choose>
                <xsl:when test="not(f:differential) and not(f:snapshot) and starts-with($id, 'nl-core-')">
                    <differential>
                        <element id="{f:type/@value}">
                            <path value="{f:type/@value}" />
                            <alias value="{$id}" />
                        </element>
                    </differential>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="f:differential | f:snapshot"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    
    <!-- Remove unused mappings -->
    <xsl:template match="f:StructureDefinition/f:mapping">
        <xsl:choose>
            <xsl:when test="f:identity/@value = ('workflow','sct-concept','v2','rim','w5','sct-attr')"/>
            <!-- Remove zib mapping element in nl-core profiles if it is not used -->
            <xsl:when test="starts-with(parent::f:StructureDefinition/f:id/@value, 'nl-core-') and f:identity/@value[starts-with(., 'zib-')][not(. = parent::f:StructureDefinition//f:element/f:mapping/f:identity/@value)]"/>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="node()|@*"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="f:element[f:mapping/f:map[starts-with(@value,'NL-CM:')]]">
        <xsl:variable name="maps" select="f:mapping/f:map[starts-with(@value,'NL-CM:') and not(contains(../f:comment/@value, $implicitIdentifier))]" as="element()*"/>
        <xsl:variable name="valuesOid" as="element()*">
            <xsl:for-each select="$maps">
                <map value="{replace(@value,'NL-CM:','2.16.840.1.113883.2.4.3.11.60.40.1.')}"/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="concepts" as="element()*">
            <xsl:for-each select="$valuesOid">
                <xsl:variable name="value" select="@value"/>
                <xsl:copy-of select="$allDatasets//concept[@id = $value]"/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="count($maps) = 0">
                <!-- When all maps turn out to be implicit, $maps is empty and we shouldn't do anything, just copy -->
                <xsl:copy>
                    <xsl:apply-templates select="node()|@*"/>
                </xsl:copy>
            </xsl:when> 
            <xsl:when test="not($concepts)">
                <xsl:message>Could not find a concept with map '<xsl:value-of select="$maps[1]/@value"/>'</xsl:message>
                <xsl:copy>
                    <xsl:apply-templates select="node()|@*"/>
                </xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="originalConcepts" as="element()*">
                    <xsl:for-each select="$concepts">
                        <xsl:copy-of select="loc:getOriginalConcept(.)"/>
                    </xsl:for-each>
                </xsl:variable>
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:apply-templates select="f:path | f:representation | f:sliceName | f:sliceIsConstraining | f:label | f:code | f:slicing"/>
                    <xsl:variable name="calculatedShort" select="string-join(distinct-values($originalConcepts/name[@language='en-US'][text() != '']/text()), ' / ')"/>
                    
                    <xsl:choose>
                        <xsl:when test="f:short and not($overwrite)">
                            <xsl:apply-templates select="f:short"/>
                            <xsl:if test="$showWarnings and not(f:short/@value = $calculatedShort)">
                                <xsl:message>Element with id '<xsl:value-of select="@id"/>' has short '<xsl:value-of select="f:short/@value"/>' which does not correspond with zib value '<xsl:value-of select="$calculatedShort"/>'.</xsl:message>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="$calculatedShort">
                            <short value="{$calculatedShort}"/>
                        </xsl:when>
                    </xsl:choose>
                    
                    <xsl:variable name="definitions" select="$originalConcepts/desc[@language='en-US'][text() != '' and not(starts-with(text()[1], 'Root concept of the '))]"/><!-- Do not add definition of 'Root concept'. Because root concepts do not always have to be mapped to the root of a profile, we match on the definition text. -->
                    <xsl:variable name="calculatedDefinition">
                        <xsl:choose>
                            <xsl:when test="count($definitions) &gt; 1">
                                <xsl:copy-of select="concat('* ', string-join($definitions/text(), '&#xD;&#xA;* '))"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates select="$definitions[1]" mode="HTML2Markdown"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable> 
                    <xsl:choose>
                        <xsl:when test="f:definition and not($overwrite)">
                            <xsl:apply-templates select="f:definition"/>
                            <xsl:if test="$showWarnings and not(f:definition/@value = $calculatedDefinition)">
                                <xsl:message>Element with id '<xsl:value-of select="@id"/>' has definition '<xsl:value-of select="f:definition/@value"/>' which does not correspond with zib value '<xsl:value-of select="$calculatedDefinition"/>'.</xsl:message>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="count($definitions) &gt; 0">
                            <definition value="{$calculatedDefinition}"/>
                        </xsl:when>
                    </xsl:choose>
                    
                    <xsl:apply-templates select="f:comment | f:requirements"/>
                    
                    <xsl:variable name="aliases" select="distinct-values($originalConcepts/name[@language='nl-NL']/text())"/>
                    <xsl:choose>
                        <xsl:when test="f:alias and not($overwrite)">
                            <xsl:apply-templates select="f:alias"/>
                            <xsl:if test="$showWarnings and count($aliases) &gt; 0 and not(f:alias/@value = $aliases)">
                                <xsl:message>Element with id '<xsl:value-of select="@id"/>' has alias '<xsl:value-of select="f:alias/@value"/>' which does not correspond with Zib value '<xsl:value-of select="$aliases"/>'.</xsl:message>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="count($aliases) &gt; 0">
                            <xsl:for-each select="$aliases">
                                <alias value="{.}"/>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:apply-templates select="f:*[not(local-name() = ('path','representation','sliceName','sliceIsConstraining','label','code','slicing','short','definition','comment','requirements','alias'))]">
                    </xsl:apply-templates>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="f:mapping[f:map[starts-with(@value,'NL-CM:')] and not(contains(f:comment/@value, $implicitIdentifier))]">
        <xsl:variable name="map" select="f:map[starts-with(@value,'NL-CM:')]" as="element()"/>
        <xsl:variable name="valueOid" as="element()">
            <map value="{replace($map/@value,'NL-CM:','2.16.840.1.113883.2.4.3.11.60.40.1.')}"/>
        </xsl:variable>
        <xsl:variable name="concept" as="element()">
            <xsl:copy-of select="$allDatasets//concept[@id = $valueOid/@value]"/>
        </xsl:variable>
        <xsl:variable name="originalConcept" as="element()">
            <xsl:copy-of select="loc:getOriginalConcept($concept)"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$originalConcept">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:apply-templates select="f:identity | f:language | f:map"/>
                    <xsl:choose>
                        <xsl:when test="f:comment and not($overwrite)">
                            <xsl:apply-templates select="f:comment"/>
                            <xsl:if test="$showWarnings and $originalConcept/name[@language='en-US']/text() and not(f:comment/@value = $originalConcept/name[@language='en-US']/text())">
                                <xsl:message>Element with id '<xsl:value-of select="parent::f:element/@id"/>' has mapping.comment '<xsl:value-of select="f:comment/@value"/>' which does not correspond with zib0 value '<xsl:value-of select="$originalConcept/name[@language='en-US']/text()"/>'.</xsl:message>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="$originalConcept/name[@language='en-US']/text()">
                            <comment value="{$originalConcept/name[@language='en-US']/text()}"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="node()|@*"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:function name="loc:getOriginalConcept" as="element()">
        <xsl:param name="elem" as="element()"/>
        <xsl:choose>
            <xsl:when test="$elem/inherit">
                <xsl:variable name="cid" select="$elem/inherit/@ref"/>
                <xsl:variable name="ced" select="$elem/inherit/@effectiveDate"/>
                <xsl:variable name="theConcept" select="$allDatasets//concept[not(ancestor::history)][@id=$cid][@effectiveDate=$ced]" as="element()*"/>
                <xsl:copy-of select="loc:getOriginalConcept($theConcept)"/>
            </xsl:when>
            <xsl:when test="$elem/contains">
                <xsl:variable name="cid" select="$elem/contains/@ref"/>
                <xsl:variable name="ced" select="$elem/contains/@flexibility"/>
                <xsl:variable name="theConcept" select="$allDatasets//concept[not(ancestor::history)][@id=$cid][@effectiveDate=$ced]" as="element()*"/>
                <xsl:copy-of select="loc:getOriginalConcept($theConcept)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="$elem"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <!--
        Rewrite the HTML input to Markdown. Supported here are line breaks and bullet lists. Line breaks are
        interpreted as new paragraphs (represented in Markdown as two newlines). Extra line breaks will be
        removed.

        Since we're in an indenting stylesheet, output of this process will be indented as well, so whitespace cannot
        be trusted during the formatting process. To handle this, the pipe symbol is used to indicate a newline. In the
        final step, these pipe symbols will be used to properly format the output.
    -->
    <xsl:template match="desc" mode="HTML2Markdown">
        <xsl:variable name="processed">
            <xsl:apply-templates mode="HTML2Markdown"/>
        </xsl:variable>
        <xsl:variable name="normalized" select="replace(normalize-space($processed), '\s*\|\s*', '|')"/> <!-- Turn output into a single string -->
        <xsl:variable name="deduplicated" select="replace($normalized, '\|\|\|*', '||')"/> <!-- Remove extra pipes if there are more then two -->
        <xsl:variable name="renormalized" select="replace($deduplicated, '^\|*(.+?)\|*$', '$1')"/> <!-- Remove pipes at beginning and end -->
        <xsl:value-of select="replace($renormalized, '\|', '&#xD;&#xA;')"/> <!-- Turn pipes into newlines -->
    </xsl:template>

    <xsl:template match="br" mode="HTML2Markdown">
        <xsl:text>||</xsl:text>
    </xsl:template>
    
    <xsl:template match="ul" mode="HTML2Markdown">
        <xsl:text>||</xsl:text>
        <xsl:apply-templates mode="HTML2Markdown"/>
    </xsl:template>

    <xsl:template match="li" mode="HTML2Markdown">
        <xsl:message select="text()"/>
        <xsl:value-of select="concat('|* ', text())"/>
    </xsl:template>

    <xsl:template match="@*|node()" mode="HTML2Markdown">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" mode="HTML2Markdown"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>