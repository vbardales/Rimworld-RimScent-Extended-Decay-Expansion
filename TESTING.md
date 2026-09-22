# Testing

## Offline XML contract test

Run from the repository root:

```powershell
powershell -ExecutionPolicy Bypass -File Tests/Test-Xml.ps1
```

The test parses every distributed XML file and verifies the seven owned thought definitions,
their patch references, all fourteen French `DefInjected` entries, the two hard dependencies,
the optional Communicable Diseases LoadFolders condition, and the distributed repository link.

## Functional and Pickle scope

This mod owns XML definitions and `PatchOperation` declarations only. It has no assembly, settings,
UI, save data, custom callbacks, or code path of its own. Scent scanning, thought resolution,
dependency loading, and language selection are performed by RimScent or RimWorld. Per `AUDIT.md`,
testing those engine/dependency behaviours would not test this mod; its declarations are covered by
the offline contract test above.

No Pickle feature is applicable. A future feature is required if this repository adds a player-facing
interaction, a custom callback, persistence, or a behavior not reducible to the XML contracts tested
above. Runtime play remains useful integration evidence for `done → tested`, but is not a prerequisite
for `done` and must use the shared WSL harness if requested.
