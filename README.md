# RimScent Extended: Decay Expansion

The dead, the spoiled, the sick, and the room they are lying in. For RimWorld 1.6.

## Corpses

RimScent gives a scent to `Filth_CorpseBile`, the puddle — **but not to the corpse**. In a mod
whose subject is smell, that is the most conspicuous gap in the base game.

| Stage | Smell | Mood |
|---|---|---|
| fresh | smell of death | −3 |
| rotting | carrion stench | −6 |
| dessicated | dried-out remains | −1 |

A buried corpse smells of nothing, and a mechanoid hulk never rots: neither is touched. A corpse
in a freezer is damped by the socle's temperature mechanic — so refrigerating a pile of bodies
actually achieves something.

## Spoiled food

**No def is patched.** The scan reads `RottableUtility.GetRotStage()` on any thing carrying a
`CompRottable`, which covers food from every installed mod — present and future, including mods
that did not exist when this was written.

## The sickroom

Ten germ filth types from Communicable Diseases become sickroom air, at −2. Germs do not smell; a
room full of them does.

**Six of the ten do not always exist.** Communicable Diseases only creates them through a
`PatchOperationFindMod` gated on *Diseases Overhauled*. The four that always exist are patched;
the others are tolerated without error thanks to the disjoint-predicate pattern.

Germ filth and a sick body are complementary: one is the room, the other is the person. Both can
apply, and the dominance contest settles it.

## The sick, and the walking dead

This is the one block in this mod that **needs no code at all**. RimScent already reads the
`HediffDef`s of a neighbouring pawn — it is in fact the *only* thing it reads on a neighbour. A
`modExtensions` on the disease is enough.

| Target | Smell | Mood |
|---|---|---|
| flu, plague, malaria, sleeping sickness, infant illness | fever: sour sweat and hot breath | −2 |
| wound infection, lung rot, organ decay, blood rot | infection: pus, something turning under the dressing | −4 |
| food poisoning | **reuses** `RimScent_VomitScent` | |
| shambler, revenant body, awoken corpse (Anomaly) | **reuses** our carrion scent | |

The animal variants of flu and plague are included: RimScent reads the hediffs of **any**
neighbouring pawn, not only humans. A sick beast smells too.

A shambler is a corpse that walks. It therefore smells of exactly what it is, reusing the carrion
scent defined above rather than a new one written for the occasion.

### You never smell your own illness

RimScent tests `other != pawn`: a colonist only smells **other people's** disease. That is the
original behaviour, and it is right — you get used to your own smell before any other.

### What deliberately smells of nothing

Gut worms, muscle parasites and mechanites. None of that is detectable from outside, and inventing
a smell for them would be noise.

Blood loss either: spilled blood is already a filth type covered elsewhere, and adding the hediff
would count the same situation twice in the dominance contest.

## Why the socle is required

Corpses and rot are read **in C#**, not through defs. Implicit defs (`Corpse_Muffalo`,
`Meat_Muffalo`…) are generated *after* every patch operation has run: no xpath can reach them. The
socle's scan already does that reading — it looks these thoughts up by name, with
`GetNamedSilentFail`, and stays quiet if they are absent. This mod supplies them.

The practical consequence: the socle alone knows how to *read* rot but has nothing to say about
it; this mod alone would have the vocabulary but not the reading. You need both.

## Requirements

- [RimScent](https://steamcommunity.com/sharedfiles/filedetails/?id=3645569466)
- RimScent Extended (the socle)

Communicable Diseases is not required. Nothing is written to the save.

## Licence

MIT — see [LICENSE](LICENSE) and [ATTRIBUTION.md](ATTRIBUTION.md).
