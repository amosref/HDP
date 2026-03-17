# Resource Encounter Stage Context Extension
Extension to tag resources with encounter stage and optional child encounter reference. This extension is being retired; use `ext-resource-role-context` instead.

## Canonical
[http://fhir.health.gov.il/StructureDefinition/ext-resource-encounter-stage-context](http://fhir.health.gov.il/StructureDefinition/ext-resource-encounter-stage-context)

## Guidance
- `extension[role]` uses `resource-role-context` codes (AD, HO, DS) and may be extended with organization-specific codes via the extensible binding.
- `extension[sheetEncounter]` may reference ILCore or ILHDP encounter profiles.
- Use when a resource points to an aggregated encounter but needs stage context. New implementations SHOULD use `ext-resource-role-context`.
