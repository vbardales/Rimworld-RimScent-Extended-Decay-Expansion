# Publication preparation

**Status: not ready to publish.** The repository is at `done`, not `tested`; this file prepares
the information that must be settled before a first Workshop upload and does not authorize one.

## Dependencies and DLC

| Kind | Project | Package ID | Reference | Status |
| --- | --- | --- | --- | --- |
| Hard | RimScent | `reo.RimScent` | [Workshop 3645569466](https://steamcommunity.com/sharedfiles/filedetails/?id=3645569466) | declared in `About.xml` |
| Hard | RimScent Extended | `nelim.rimscent.extended` | [GitHub](https://github.com/vbardales/Rimworld-RimScent-Extended) | declared in `About.xml` |
| Optional | Communicable Diseases | `onegative.communicablediseases` | Workshop ID not yet recorded | `Diseases/` is `IfModActive`-gated |

No DLC is a hard dependency. Vanilla/DLC hediff targets are reached only through conditional
patches: an absent target produces no operation rather than a required expansion.

## Workshop description audit

The distributed description is English and ends with the exact source-code link. Before first
upload it still needs a final, evidence-based review and these sections in order after the feature
description:

1. `IF I GO QUIET` with the adoption clause from `AUDIT.md`, verbatim.
2. `AI-GENERATED`, naming the actual tools and their actual contributions. Codex (OpenAI) has
   contributed audit documentation and the XML test; the provenance of the existing Preview and
   ModIcon artwork has not been recorded here and must not be guessed.
3. `THANKS`, covering RimScent and any other source/integration actually credited, with Workshop
   links where those IDs are established.
4. A reference to `ATTRIBUTION.md` and the MIT licence.
5. The existing final source-code link.

## Screenshots, adult-content form, and Workshop comments

No Workshop captures have been made. Their order must be decided only after runtime validation;
the first image should demonstrate an actual scent outcome, not merely reuse the header Preview.

The directly reviewed Preview contains stylized corpses, blood and spoiled food. The exact Steam
adult-content responses have not been selected and must be answered from the final uploads, not
from filenames or this note.

No Workshop thank-you comment is drafted or posted. Before drafting one, consult the collection
`WORKSHOP_COMMENTS.md` registry so an existing collection-wide comment is not duplicated.
