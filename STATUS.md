---
settings_audit: not_applicable
localization:   complete
translation_en: complete
translation_fr: complete
mod:          RimScent Extended: Decay Expansion
packageId:    nelim.rimscent.extended.decay
repo:         Rimworld-RimScent-Extended-Decay-Expansion
visibility:   unverified
detached:     no
stage:        dansMonoRepo
licence:      open
licence_at:   the same MIT base as RimScent Extended
dependencies: declared
showcase:     complete
tested_on:
workshop:
remaining:
  - defect: README.md says the fresh-corpse thought is -3, but the delivered Def is -2
  - defect: no autonomous Git repository or repository-local release documentation (CHANGELOG.md) exists
  - unverified: no independent GitHub remote, pushed first commit or remote visibility could be verified from this monorepo checkout
  - unverified: never seen running; scent application, French display and logs remain unverified in RimWorld 1.6
session:      maj:        2026-09-22, AUDIT.md static audit
updated:      2026-09-22, AUDIT.md static audit
---

# RimScent Extended: Decay Expansion — status

Read by a sweep across every mod, rather than by asking each thread in turn. It lives at the
root, never inside `Mod/`, so Steam never receives it.

The status began as a 2026-09-12 sweep and was audited against `../AUDIT.md` on 2026-09-22.
`stage` uses the workflow names directly; `dansMonoRepo` is the last cumulative state established.

  - **`stage`** — one of `port`, `showcase`, `preTest`, `done`, `tested`, `published`. Filled in
  from the session group where one exists; confirm it.
- **`tested_on`** — the date of the last run in game. Empty means never.
- **`dependencies`** — `declared` when every mod this one needs is named in the About's
  `modDependencies`, `to check` when a non-vanilla `loadAfter` suggests a dependency that is not
  declared, `none` when the mod needs nothing. An undeclared dependency is not cosmetic: on
  2026-09-11 Reequilibrage animaux took 47 vanilla animals down with it, Muffalo included, because
  the class it injects belongs to a mod that was not declared and not loaded.
- **`remaining`** — what is left, in three kinds: `feature` for something missing from a first
  release, `defect` for a known fault left unfixed, `unverified` for what could not be checked.
  The line already there is true of nearly the whole repository; replace it once it stops being.

`licence` vocabulary: `open` an explicit licence, `silent` no licence and a dead source,
`alive` no licence but a living source, `forbidden` a written refusal, `original` owing nothing
to anyone — not a name, not an idea traceable to one mod, not a value derived from its assets.

## Settings audit

2026-09-22 — `not_applicable`. Inventory of all active folders from `Mod/LoadFolders.xml`
found only XML `ThoughtDef`s and `PatchOperation`s: no C# assembly/source, `ModSettings`,
configurable Def values, MainButtons definition, or player-editable behaviour. The mod's fixed
purpose is to supply scent thoughts and attach them to vanilla/DLC/optional target defs; exposing
their mood values or target list would add unsupported configuration rather than a useful choice.

The published tree contains no settings page and no `MainButtonDef`, so it cannot expose an empty
Mod options page or a visible/greyed-out shortcut. Per `AUDIT.md`, source/Def inspection is enough
to establish this result for `preOptions → options`; in-game interaction is not applicable because
there is no settings UI.

## Translation audit

2026-09-22 — static localization inventory complete for the active 1.6 root and conditional
`Diseases/` folder. The seven owned `ThoughtDef`s provide English source `label` and
`description` fields; French supplies all fourteen corresponding `DefInjected` entries (two per
thought), including `RimScentExtended_Scent_Sickroom` in the conditionally loaded folder. There
is no code-owned UI text or Keyed resource. `About.xml` metadata and repository documents are
outside the in-game translation gate.

Evidence: PowerShell XML parsing accepted all 12 XML files; referenced owned patch thoughts all
resolve to the seven declared thoughts; French inventory found 14 entries covering those seven
thoughts. English/French rendering, raw-key/fallback detection, conditional patch application and
logs remain runtime-unverified.

## AUDIT.md audit

2026-09-22, audited working tree at `e1b09c690a205d3b179d5263e9458d6b63fe7984` with local
modifications already present in `STATUS.md` and `Mod/About/About.xml`. `git rev-parse
--show-toplevel` resolves to the parent `rimworld` monorepo and this checkout has no `.git`;
therefore the autonomous-repository criterion for `dansMonoRepo → horsMonoRepo` is not met.
There is also no repository-local `CHANGELOG.md`, `.gitignore` or `.gitattributes`. The configured
`rimscent-decay` remote belongs to the parent repository, so it is not evidence of this checkout's
independent remote, pushed commit or visibility.

Independent evidence retained: root and distributed MIT licences have the same SHA-256;
`About.xml` declares the two hard dependencies and the optional Communicable Diseases integration
is only a conditional LoadFolders/loadAfter target; all owned patch thought references resolve.
Preview (896x504, 597,204 bytes) and ModIcon (128x128, 21,638 bytes) were directly opened: both
are readable, the Preview is a RimWorld-style overhead scene with distinct amber/blue accents, and
no concrete visual defect was observed. The Preview transition evidence is retained independently.

Confirmed documentation defect: README's corpse table promises fresh-corpse mood −3 while
`Mod/Defs/Scents_Corpses.xml` delivers −2. No feature, image, test, publication, repository or
runtime change was made by this audit.
