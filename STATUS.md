---
settings_audit: not_applicable
localization:   complete
translation_en: complete
translation_fr: complete
mod:          RimScent Extended: Decay Expansion
packageId:    nelim.rimscent.extended.decay
repo:         Rimworld-RimScent-Extended-Decay-Expansion
visibility:   unverified
detached:     yes
stage:        done
licence:      open
licence_at:   the same MIT base as RimScent Extended
dependencies: declared
showcase:     complete
tested_on:
workshop:
remaining:
  - unverified: a fresh correctly staged English Pickle pass; the 2026-09-26 ticket ran Joy Rescue instead and is invalid for this mod
  - unverified: French display and optional Communicable Diseases integration
  - unverified: claimed Workshop prepublication; no PublishedFileId.txt is present in this checkout
session:      audit:      2026-09-26, runtime evidence and prepublication rechecked
updated:      2026-09-26, runtime evidence and prepublication rechecked
---

# RimScent Extended: Decay Expansion — status

Read by a sweep across every mod, rather than by asking each thread in turn. It lives at the
root, never inside `Mod/`, so Steam never receives it.

The status began as a 2026-09-12 sweep and was audited against `../AUDIT.md` on 2026-09-22.
`stage` uses the workflow names directly; `horsMonoRepo` is the last cumulative state established.

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
modifications already present in `STATUS.md` and `Mod/About/About.xml`. This initial finding was
superseded the same day: the checkout is now an autonomous Git repository on `master`, with its
own `.git`, `.gitignore`, `.gitattributes`, `CHANGELOG.md`, and `origin` set to
`https://github.com/vbardales/Rimworld-RimScent-Extended-Decay-Expansion.git`. Root commit
`09a63d7` was pushed to `origin/master`. Remote visibility itself was not independently inspected.

Independent evidence retained: root and distributed MIT licences have the same SHA-256;
`About.xml` declares the two hard dependencies and the optional Communicable Diseases integration
is only a conditional LoadFolders/loadAfter target; all owned patch thought references resolve.
Preview (896x504, 597,204 bytes) and ModIcon (128x128, 21,638 bytes) were directly opened: both
are readable, the Preview is a RimWorld-style overhead scene with distinct amber/blue accents, and
no concrete visual defect was observed. The Preview transition evidence is retained independently.

Confirmed documentation defect: README's corpse table promises fresh-corpse mood −3 while
`Mod/Defs/Scents_Corpses.xml` delivers −2. Corrected on 2026-09-22; `Tests/Test-Xml.ps1` now
asserts every owned mood effect. No feature, image, publication, repository or runtime change was
made by this audit.

## preTest gate

2026-09-22 — the cumulative `horsMonoRepo → ModIcon generated → Preview generated → preOptions
→ options → l10n → preTest` transitions are established from direct artifacts and static checks.
The icon and Preview were opened; the Preview has distinct amber and blue accents, English
description, and a final source-code link. The name is semantically styled as `Extended` plus its
`Decay Expansion` title, without an inapplicable unofficial/prohibited marker. Settings are
`not_applicable`; all owned player-facing thought text has English source and French coverage.
The two hard dependencies are declared in `About.xml`; Communicable Diseases is optional and its
folder is `IfModActive`-gated. This did not certify runtime behaviour; the following `done` gate
records the applicable offline proof.

## done gate

2026-09-22 — `Tests/Test-Xml.ps1` passed: 12 distributed XML files parsed, the seven owned scent
thoughts and their patch references resolved, 14 French entries covered all owned thought text,
the two hard dependencies and optional Communicable Diseases condition were asserted, and the
distributed source link was checked. `TESTING.md` records the functional scope and explains why no
Pickle scenario applies: this repository owns no executable callback, UI, settings, persistence or
game-side behaviour beyond its XML declarations. Runtime integration evidence remains explicitly
unverified for `done → tested`.

## Runtime test preparation

2026-09-22 — added a development-only Pickle companion with a minimal English scenario covering
all seven owned `ThoughtDef`s and a clean log under the hard dependency set. The optional
Communicable Diseases Workshop item is `3263015203`, but it has been removed from Steam and is not
available in this workspace; that pass remains unverified. The shared WSL launcher and queue are
used for the minimal pass.

2026-09-26 — ticket `20260926-115016-908-ba88`, labelled for commit `b59e326`, returned launcher
exit code 1 without a current Pickle report. Its retained `Player.log` showed the unrelated Joy
Rescue `28-f11-addition-read.feature`, so it proves nothing about this mod and is recorded only in
`docs/runs/2026-09-26-minimal-english-b59e326.md`. The raw evidence was removed after the compact
summary. The `tested` admission requirements are now recorded in `TESTING.md`: no selected `@wip`,
every selected conditional scenario completed successfully, all applicable automated scenarios
green, and no applicable manual validation pending.

## Prepublication preparation

2026-09-22 — `PUBLICATION.md` records the declared dependency/DLC split and the publication facts
that remain unresolved without inventing them: artwork provenance, optional integration Workshop
identifier, final screenshot order, Steam adult-content answers and collection-wide comment status.
It is preparation only; the current stage remains `done` pending runtime validation.

2026-09-26 — no `Mod/About/PublishedFileId.txt` exists in the working tree or Git history, so a
possible Workshop upload cannot be established from this checkout. `CHANGELOG.md` now reserves
the requested 0.1.0 prepublication entry, but the stage remains `done` until the publication
identifier and the runtime gate are evidenced.
