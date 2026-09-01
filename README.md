# RimScent Extended: Decay Expansion

Les morts, l'avarié, et la pièce où quelqu'un est malade. RimWorld 1.6.

## Les cadavres

RimScent parfume `Filth_CorpseBile`, la flaque — **mais pas le cadavre**. Dans un mod dont
le sujet est l'odeur, c'est le trou le plus voyant du jeu de base.

| Stade | Odeur | Humeur |
|---|---|---|
| frais | odeur de mort | −3 |
| en putréfaction | puanteur de charogne | −6 |
| desséché | restes desséchés | −1 |

Un cadavre enterré ne sent rien, et une carcasse de mécanoïde ne pourrit jamais : ni l'un ni
l'autre n'est touché. Un cadavre en chambre froide est atténué par la mécanique de
température du socle — réfrigérer un tas de corps sert donc réellement à quelque chose.

## La nourriture avariée

**Aucun def n'est patché.** Le scan lit `RottableUtility.GetRotStage()` sur tout objet
porteur d'un `CompRottable`, ce qui couvre les aliments de tous les mods installés — présents
et futurs, y compris ceux qui n'existaient pas quand ceci a été écrit.

## La chambre de malade

Dix saletés de germes de Communicable Diseases deviennent un air de chambre de malade, à −2.
Les germes ne sentent pas ; une pièce qui en est pleine, si.

**Six des dix n'existent pas toujours.** Communicable Diseases ne les crée que par un
`PatchOperationFindMod` conditionné à *Diseases Overhauled*. Les quatre qui existent
toujours sont patchées, les autres sont tolérées sans erreur grâce au motif à prédicats
disjoints.

## Pourquoi le socle est requis

Les cadavres et la pourriture sont lus **en C#**, pas par des defs. Les defs implicites
(`Corpse_Muffalo`, `Meat_Muffalo`…) sont générés *après* que toutes les opérations de patch
ont tourné : aucun xpath ne peut les atteindre. Le scan du socle fait déjà cette lecture — il
cherche ces pensées par leur nom, avec `GetNamedSilentFail`, et reste muet si elles sont
absentes. Ce mod les fournit.

Conséquence pratique : le socle seul sait *lire* la pourriture mais n'a rien à en dire ; ce
mod seul aurait le vocabulaire mais pas la lecture. Il faut les deux.

## Dépendances

- [RimScent](https://steamcommunity.com/sharedfiles/filedetails/?id=3645569466)
- RimScent Extended (le socle)

Communicable Diseases n'est pas requis. Rien n'est écrit dans la sauvegarde.

## Licence

MIT — voir [LICENSE](LICENSE) et [ATTRIBUTION.md](ATTRIBUTION.md).
