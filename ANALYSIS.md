# Analyse d'AJ_Math (avant migration 4D 21 R4)

Composant 4D d'AJAR SA (Maurice Inzirillo). Dépôt `AJARProject/AJ_Math_source`. Licence MIT, fichier `LICENSE` (copyright 2022 Ajar SA). Dernier état sur `master` : `2.0.1+Build47`, message de commit « Build for 19 R8 ». `AJ_Math_info` annonçait `AJ_Math (v19 R8) : 2.0.1+Build47` (commentaire `Fri, 13 Jan 2023 06:59:52 GMT`).

Cette analyse décrit le dépôt **tel qu'il était sur `master`**. Les changements de la migration sont dans `Documentation/AJ_Math.fr.md`.

## Ce que fait le composant

AJ_Math expose un objet de formules calqué sur `Math` en JavaScript (constantes, trigonométrie, logarithmes, arrondis, distance sur une sphère). [AJUI Animate](https://github.com/AJARProject/AJUI_Animate_source) s'en sert pour les courbes élastiques : `easing` fait `$math:=Math()` puis `$math.sin(...)` et `$math.asin(...)`.

Il y a **deux implémentations** du même catalogue, déjà présentes sur `master` :

1. La méthode projet `Math`. Elle renvoie un objet dont les membres sont des `Formula` qui se rappellent `Math` avec un nom de fonction et un objet d'arguments. C'est l'API historique (« avant v18 R3 », fiche `Documentation/Methods/Math.md`). C'est celle qu'appelle AJUI Animate. Attributs : `shared`, `invisible`, `preemptive: capable`.
2. La classe `Math` (`Project/Sources/Classes/Math.4dm`). La méthode partagée `AJ_Math` renvoie `cs.Math`. L'hôte fait `AJ_Math.new()`. Fiche d'origine : « Replace Math since V18R3 ». Le fichier classe n'a pas d'attribut `shared`.

Les deux ne sont pas identiques. La classe renvoie `This.NaN` (`Log(-1)`) quand le nombre d'arguments est mauvais, et déclare `POSITIVE_INFINITY` / `NEGATIVE_INFINITY`. La méthode met `success` à faux et laisse souvent `value` à 0. Le second `sqrt` de la méthode (dans le `Case of`) recopie le calcul de `sinh`, mais le `Case of` s'arrête au premier `sqrt` : cette branche n'est pas atteinte. `atan2` écrit `$o.succes` (sans le second s) dans le `Else`.

## Structure

**Déjà en mode projet.** Il n'y a pas de structure binaire `.4DB`, pas de composant compilé `.4DC`, pas de `.4DZ`. Rien à exporter par « Fichier > Exporter > Structure vers le projet ». Aucun binaire à conserver : le dépôt n'en contient pas.

| Emplacement | Rôle |
| --- | --- |
| `Project/AJ_Math.4DProject` | Projet. Avant migration : seulement le commentaire 4D, sans `compatibilityVersion`. |
| `Project/Sources/Methods` | Sept méthodes `.4dm`, jetons `:C` / `:K`. |
| `Project/Sources/Classes/Math.4dm` | Classe. Déjà en `var`, mais encore jetonisée, et les paramètres sont déclarés avec `var $1` / `var $0`. |
| `Project/Sources/catalog.4DCatalog` | Schéma vide, pas de tables. |
| `Project/Sources/menus.json` | Menus 4D par défaut (fichier, édition, mode). |
| `Project/Sources/folders.json` | Groupes Explorer vides, dont `Unit-test` et `trash`. Pas une base hôte. |
| `Project/Sources/settings.4DSettings` | Uniquement `<compiler><typage default_for_numeric="1"/>`. Pas de `<database><misc>`. |
| `Documentation/Methods` | Trois fiches Explorer d'origine (`Math`, `AJ_Math`, `AJ_Math_info`). |
| Pas de `Components/`, `Plugins/`, `Forms/`, `Resources/`, `Settings/` | Rien de tout cela n'était versionné. |

Version visée avant migration : **4D 19 R8**, écrite dans `AJ_Math_info`. Le `.gitignore` ignorait `*.4DSettings` (le fichier déjà suivi restait dans git).

## API partagée

Méthodes avec `"shared":true` (et `"invisible":true`) :

| Méthode | Rôle |
| --- | --- |
| `Math` | Objet de formules. `preemptive: capable`. Point d'entrée utilisé par AJUI Animate. |
| `AJ_Math` | Retourne la classe `cs.Math`. L'hôte fait `AJ_Math.new()`. |
| `AJ_Math_info` | Texte de version. `"lang":"en"`. |
| `LongInt2BinaryString` | Entier long vers une chaîne de 32 bits. `preemptive: capable`. Appelée par `clz32` (méthode et classe). |

Membres posés par `Math()` (formules, plus les constantes `E`, `LN2`, `LN10`, `LOG10E`, `LOG2E`, `PI`, `SQRT2`, `SQRT1_2`, `Degree`, `Radian`) : `toRadians`, `toDegrees`, `abs`, `cos`, `cosh`, `acos`, `acosh`, `sin`, `asin`, `asinh`, `tan`, `atan`, `atan2`, `atanh`, `floor`, `ceil`, `log`, `log10`, `log2`, `sqrt` (écrit deux fois dans le `New object`, la seconde écriture remplace la première), `cbrt`, `clz32`, `exp`, `expm1`, `hypot`, `imul`, `log1p`, `max`, `min`, `pow`, `random`, `round`, `sign`, `sinh`, `tanh`, `trunc`, `spherodistance`, `roundDecimal`.

Fonctions de la classe `Math` : les mêmes noms, plus les propriétés `NaN`, `POSITIVE_INFINITY`, `NEGATIVE_INFINITY`. `hypot` était déclaré `var ${1}` avec le commentaire « not sure if 4D is able to handle this ».

Non partagées : `AJ_Math_BuildComponent` (appelle `AJUI_BuildComponent("AJ_Math_info")`), `AJUI_BuildComponent` (incrémente le build puis `BUILD APPLICATION`), `zero_fill_right_shift` (efface les bits 31 et 30, aucun appel dans le dépôt).

## Dépendances

- Aucun composant, aucun plugin, aucune table.
- Pas de base hôte, pas de `dependencies.json`, pas de formulaire de test. Le groupe Explorer `Unit-test` est vide.
- Le consommateur connu est AJUI Animate : `easing` appelle `Math()` pour `sin` et `asin`. Le binaire 19 R8 livré dans `AJUI_Animate/Components/AJ_Math.4dbase` ne vient pas de ce dépôt.

## Commandes et syntaxe face à 4D 21 R4

Aucune commande préfixée `_o_`. Les commandes contrôlées sur la doc 21 R4 sont toujours publiées, sans mention « deprecated » dans leur page :

- [`Formula`](https://developer.4d.com/docs/21-R4/commands/formula) (renommée depuis `New formula` en 17 R6 ; le code utilise déjà `Formula`)
- [`GET SYSTEM FORMAT`](https://developer.4d.com/docs/21-R4/commands/get-system-format) et la constante `Decimal separator` (`trunc`)
- [`Choose`](https://developer.4d.com/docs/21-R4/commands/choose), [`Count parameters`](https://developer.4d.com/docs/21-R4/commands/count-parameters), [`Value type`](https://developer.4d.com/docs/21-R4/commands/value-type)
- [`Num`](https://developer.4d.com/docs/21-R4/commands/num), [`Square root`](https://developer.4d.com/docs/21-R4/commands/square-root), [`Arctan`](https://developer.4d.com/docs/21-R4/commands/arctan), [`Round`](https://developer.4d.com/docs/21-R4/commands/round), [`Random`](https://developer.4d.com/docs/21-R4/commands/random)
- Thème [Math](https://developer.4d.com/docs/21-R4/commands/theme/Math) : `Abs`, `Cos`, `Sin`, `Tan`, `Exp`, `Log`, `Int` sont dans la liste
- Opérateurs de bits `??` et `?-` ([nombres](https://developer.4d.com/docs/21-R4/Concepts/number)). La constante `MAXINT` est dans la [liste des constantes](https://developer.4d.com/docs/21-R4/commands/constant-list)
- [`METHOD GET CODE`](https://developer.4d.com/docs/21-R4/commands/method-get-code) (la page décrit aussi le couple avec `METHOD SET CODE`), `METHOD Get path`, `Get 4D folder`, [`BUILD APPLICATION`](https://developer.4d.com/docs/21-R4/commands/build-application), [`BEEP`](https://developer.4d.com/docs/21-R4/commands/beep)
- `New object`, `New collection`, `Position`, `Substring`, `String`, `Replace string`, `Current date`, `Current time`, `Application type`, `ALERT`, `ASSERT`, `This`, `cs`

Ce qui est déprécié, c'est la **syntaxe** :

- Les directives `C_TEXT`, `C_LONGINT`, `C_OBJECT`, etc. : « The legacy syntax using `C_XXX` commands is deprecated as of 4D 20 R7 » ([Variables](https://developer.4d.com/docs/21-R4/Concepts/variables)). `var … : Integer` est un entier long, équivalent de `C_LONGINT`.
- Les paramètres `$1`, `$2` déclarés par `C_TEXT($1)` ou par `var $1` : dépréciés en 20 R7, et « Using the `var` keyword with parameters will generate errors » ([Paramètres](https://developer.4d.com/docs/21-R4/Concepts/parameters)). Le remplacement est `#DECLARE` pour une méthode, et la ligne `Function` pour une fonction de classe. La même page montre que `$1` reste utilisable dans le corps après un `#DECLARE` nommé, et que `Count parameters` compte les paramètres réellement passés. La forme variadique `C_TEXT(${4})` est dépréciée ; le remplacement documenté est `... : Real`.

Les sources étaient jetonisées (`:C`, `:K`). Le fichier projet ne fixait pas `tokenizedText`. La page [architecture](https://developer.4d.com/docs/21-R4/Project/architecture) cite la clé `"tokenizedText": false`.

La page [Compatibilité](https://developer.4d.com/docs/21-R4/settings/compatibility) ne liste plus « Enregistrer les méthodes en Unicode » ni « Utiliser la notation objet ». Le compilateur 21 R4 refuse pourtant de compiler tant que `accept_dot_syntax` et `store_unicode_tokens` ne sont pas vrais dans `<database><misc>` (constaté sur la migration AJUI Animate, mêmes clés).

`compatibilityVersion` **2140** est le code court de 4D 21 R4 : caractères 1-2 = version, 3 = numéro R, 4 = révision ([`Application version`](https://developer.4d.com/docs/21-R4/commands/application-version), exemples `"1420"` = 14 R2, `"1430"` = 14 R3). La migration AJUI Animate l'a confirmé sur un export réel 21 R4.

## Risques (état d'origine)

1. **Deux API.** Changer le corps de `Math()` casse les courbes elastic d'AJUI Animate. Changer les noms de fonctions de la classe casse `AJ_Math.new()`.
2. **`var $1` / `var ${1}` dans la classe.** La page Paramètres dit que `var` sur un paramètre produit une erreur. `hypot` était déjà marqué comme douteux par l'auteur.
3. **Écarts de comportement** entre la méthode et la classe (`NaN`, `imul` qui teste `Count parameters=1`, `log2` de la classe qui réécrit le résultat avec `$result` non affecté dans la branche normale, `random` de la classe déclaré `Integer`). Ce ne sont pas des régressions de la migration : c'était déjà le code.
4. **`AJUI_BuildComponent`** cherche `GMT` suivi d'un CR. Les `.4dm` du dépôt sont en LF.
5. **`BUILD APPLICATION`** ne fonctionne qu'avec 4D Developer monoposte ([page de la commande](https://developer.4d.com/docs/21-R4/commands/build-application)). Le code ne saute la construction qu'en `4D Remote mode`. Il n'y avait pas de `Settings/buildApp.4DSettings` versionné.
6. Variables non déclarées (`$vtype`, `$count`, `$sum`, `$str`, `$vDecSep`, `$num`, `$i`, `$test`, `$y`, `$a`, `$b` dans la classe, etc.).
7. Pas de 4D sur la machine d'analyse : ni ouverture, ni compilation, ni exécution.
