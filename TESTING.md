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
available locally.

## `tested` admission record

The repository has no manual scenario: it exposes no player-operated UI, setting, save state or
custom callback. Therefore the manual-validation record is explicitly `not_applicable`, not a
pending informal check.

Before `STATUS.md` can move from `done` to `tested`, retain a compact text summary in `docs/runs/`
for the relevant terminal passes and establish all of the following:

- no selected Pickle scenario is tagged `@wip`;
- every selected conditional scenario has completed successfully in the condition it declares;
- every applicable automated scenario has a terminal green result; and
- no manual validation remains pending (all applicable ones are green, or the record is explicitly
  `not_applicable`).

`Tests/Pickle/Evidence/` is intentionally local and ignored. Keep only the current, relevant
machine evidence until its result has been summarized; then delete it. Do not commit captures,
`Player.log`, reports, or DDS assets. The tracked `docs/runs/` summary must name the ticket, tested
commit, terminal outcome, selected dependency map/language, and any reason the pass was not valid.
A future feature is required if this repository adds a player-facing interaction, a custom callback,
persistence, or a behavior not reducible to the XML contracts tested above.
