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
dependency loading, and language selection are performed by RimScent or RimWorld. Its declarations
are covered by the offline contract test above.

`Tests/Pickle/Mod/Pickle/Features/01-minimal-load.feature` is the applicable process-level check:
it verifies every owned thought definition exists when the hard dependency set loads and rejects
errors. It is run through the shared WSL harness in English. The optional Communicable Diseases
pass remains unverified because its required Workshop item `3263015203` has been removed and is not
available locally. A future feature is required if this repository adds a player-facing interaction,
a custom callback, persistence, or a behavior not reducible to the XML contracts tested above.
