# Nictiz-R4-Zib2024

Note: _Resources in this repository should be considered unstable and not suited for immediate implementation._

This repository contains HL7 FHIR R4 compliant profiles and related conformance materials for release 2024 of the Dutch [zibs](https://zibs.nl/wiki/Zorginformatiebouwstenen) (_Zorginformatiebouwstenen_, i.e. Clinical Information Models, also known as Clinical Building Blocks or Health and Care Information Models). This zib release is slated for October 2024.

This repository is maintained by the Dutch National Institute for ICT in Healthcare (Nictiz).

## Organization of profiles

The profiles are split in two layers:
* zib: Profiles and other conformance resources that are a faithful representation of the zib data models. These should _not_ be used for actual implementations; profiles are marked `abstract`.
* nl-core: This is the package that should be used for actual implementations. It contains profiles and other conformance resources derived from their zib counterparts, enriched with the additions needed for implementations. For example, these profiles make the Patient reference explicit and implement all known additions from various use cases.

## Releases

At the moment, the package and release strategy are not finalized and Nictiz doesn't officially publish any packages.

### Validation by HL7 Netherlands

All of the conformance resources representing the zibs are vetted by HL7 Netherlands before formal publication.

## Changes in this repository

Bugs and other issues are tracked using the [ZIBFHIR project](https://bits.nictiz.nl/projects/ZIBFHIR/). New issues can be raised using the [Nictiz Service Desk](https://nictiz.atlassian.net/servicedesk).

Note: Changes affecting the published packages are guaranteed to be tracked using a change request in this issue tracker. Unpublished materials might change for a variety of reasons.

## Profiling guidelines

The profiling guidelines for this project can be found at the [informatiestandaarden wiki](http://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_Profiling_Guidelines_R4).
