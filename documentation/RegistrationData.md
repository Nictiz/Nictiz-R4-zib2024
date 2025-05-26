# RegistrationData

## Mapping RegistrationData "events" to Provenance
The zib RegistrationData is represented by one or more FHIR Provenance resources. This one-to-many mapping approach is necessary due to a fundamental difference in granularity between the source model and the FHIR standard.

The zib RegistrationData consolidates information about multiple, distinct events that occur during a registration's lifecycle (e.g., its initial acquisition, registration to the patient record, and final closure) into a single logical record. In contrast, the FHIR Provenance resource is designed to describe a single, specific event or activity. For example, if a single RegistrationData record contains both AcquisitionDateTime and a DatTimeOfClosure, it will result in at least two separate Provenance resources:

1. One Provenance resource for the "acquisition event", where `Provenance.occurredDateTime` is populated from AcquisitionDateTime.
2. Another Provenance resource for the "closure event", where `Provenance.occurredDateTime` is populated from DatTimeOfClosure.


## RegistrationData concepts mapped to all resources
The IdentificationNumber (NL-CM:22.1.12) and CopyIndicator (NL-CM:22.1.11) concepts are not mapped to the Provenance resource but rather to elements present on all resources.

The IdentificationNumber is mapped to a slice of all resource's `.identifier` element. The CopyIndicator is mapped to the resources' `.meta.tag` element. The presence of a specific coding in the `.meta.tag` list signifies that the CopyIndicator is `true`. The absence of this tag signifies `false`.
	

## Overlapping Provenance information
Many FHIR resources include elements that capture information about the resource's origin and handling, which can overlap with the purpose of the Provenance resource. For instance, `AllergyIntolerance.recordedDate` mirrors the function of `Provenance.recorded`, and `DeviceUseStatement.source` is analogous to an agent in `Provenance.agent`.

When creating a FHIR resource, prioritize populating its own specific elements for tracking origin and handling. For example, use `AllergyIntolerance.recordedDate` rather than relying solely on the Provenance resource. The Provenance resource may then be used to provide a more comprehensive audit trail.