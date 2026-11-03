# Testing

## Offline XML contract test

Run from the repository root:

```powershell
powershell -ExecutionPolicy Bypass -File Tests/Test-Xml.ps1
```

The test verifies exact values only: the seven owned thought definitions and their mood effects,
the `RimScent_VomitScent` reuse, the two hard dependencies, the optional Communicable Diseases
LoadFolders condition, and the distributed repository link. XML parsing, def references and French
coverage are checked by the shared `Check-ModBasics.ps1` and `Check-Translations.ps1`.

## Offline test count and run

`Tests/Test-Xml.ps1` is the only local script: one pass or fail result, exit code 0 on success. It makes
7 mood-value assertions (one per owned thought) and 7 structural ones (thought inventory, reuse of
`RimScent_VomitScent`, the two hard dependencies, the repository URL, the source link, the conditional
`Diseases` folder). There is no unit-test project, since the mod ships no C#. XML parsing, def
references and French coverage are checked by the shared `Check-ModBasics.ps1` and
`Check-Translations.ps1`, and Pickle step resolution by `Check-Steps.ps1`.

## Functional scenarios

One scenario per promised behaviour of `PUBLICATION.md`. The scent scan itself (corpses, spoiled food) is
RimScent Extended's code; this mod owns the thought definitions and the patches. "Offline" values are
asserted by `Test-Xml.ps1`; "in game" is played at `playTests`.

| # | Behaviour | Preconditions | Action | Expected |
|---|---|---|---|---|
| S1 | Corpse grades | RimScent, RimScent Extended and this mod active, a non-immune colonist next to a corpse | Let the corpse go through fresh, rotting and dessicated | Mood effects -2, -6, -1 (`CorpseFresh`, `CorpseRotting`, `CorpseDessicated`); only the dominant scent applies |
| S2 | Immune traits | Same, colonist with a trait in `nullifyingTraits` (psychopath, cannibal, bloodlust) | Stand next to a rotting corpse | No thought |
| S3 | Spoiled food | Same, a food item that reached its rotting stage | Stand next to it | `RottenFood` thought, -4, for the food of any mod |
| S4 | Fever | A neighbouring pawn with Flu, Plague, Malaria, SleepingSickness, Animal_Flu, Animal_Plague or InfantIllness | Stand next to it | `Fever` thought, -2; the pawn never smells its own illness |
| S5 | Infection | A neighbouring pawn with WoundInfection, LungRot, OrganDecay or BloodRot | Stand next to it | `Infection` thought, -4 |
| S6 | Food poisoning | A neighbouring pawn with FoodPoisoning | Stand next to it | Reuses `RimScent_VomitScent`, no thought of this mod |
| S7 | Revenants | A neighbouring shambler (Anomaly) | Stand next to it | `CorpseRotting` thought, -6; mod still loads without the DLC |
| S8 | Sickroom | Communicable Diseases active, one of the ten germ filth types in the room | Stand in the room | `Sickroom` thought, -2; without that mod the `Diseases` folder is not loaded and nothing is logged |
| S9 | French | Game language French | Open each of the 7 thoughts | 14 French texts shown, no raw key |

Offline coverage: S1 to S5 and S8 values, S6 patch reuse, loading conditions (`Test-Xml.ps1`), S9 key
coverage (`Check-Translations.ps1`). In game coverage: the minimal load scenario below, played with
`Tests/Pickle/Mod/Pickle/Features/01-minimal-load.feature`; S1 to S9 behaviour itself is not scripted
(it needs the RimScent Extended scan and pawn states no Pickle step builds) and is recorded at `playTests`.

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
