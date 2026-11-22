# AJ_Math

Composant 4D d'AJAR SA : constantes et fonctions mathématiques (style `Math` JavaScript), utilisé par [AJUI Animate](https://github.com/AJARProject/AJUI_Animate_source) pour les courbes élastiques (`Math().sin`, `Math().asin`).

Sources du composant [AJ_Math](https://github.com/AJARProject/AJ_Math). Le wiki d'origine reste [ici](https://github.com/AJARProject/AJ_Math/wiki). Ce dépôt n'est pas maintenu activement ; une proposition de correction peut passer par une [pull request](https://github.com/AJARProject/AJ_Math_source/pulls).

**4D 21 R4**, mode projet, `compatibilityVersion` 2140. Licence MIT (`LICENSE`).

Cette nouvelle version a été réalisée avec l'aide de Cursor et de Grok Bot.

Documentation : [français](Documentation/AJ_Math.fr.md), [English](Documentation/AJ_Math.en.md). Analyse du dépôt d'origine : [ANALYSIS.md](ANALYSIS.md).

## Installation rapide

**Interprété.** Ouvrir `Project/AJ_Math.4DProject` avec 4D 21 R4, ou déclarer ce dossier comme dépendance d'un hôte ([composants](https://developer.4d.com/docs/21-R4/Project/components)). Ce dépôt n'a pas de base hôte. Une dépendance vers les sources ne fonctionne qu'en interprété.

**Compilé.** Construire le composant (Développement > Générer l'application, ou `BUILD APPLICATION` sur `Settings/buildApp.4DSettings`) et placer le `.4dbase` produit dans le dossier `Components` de l'hôte. Un hôte compilé ne charge pas un composant interprété. Pour AJUI Animate, ce build 21 R4 remplace le binaire 19 R8 de `Components/AJ_Math.4dbase` (le dossier Components a la priorité).

---

# AJ_Math

4D component by AJAR SA: JavaScript-style `Math` constants and functions, used by [AJUI Animate](https://github.com/AJARProject/AJUI_Animate_source) for the elastic curves (`Math().sin`, `Math().asin`).

Sources of the [AJ_Math](https://github.com/AJARProject/AJ_Math) component. The original wiki is [here](https://github.com/AJARProject/AJ_Math/wiki). This repository is not actively maintained; fixes can be proposed with a [pull request](https://github.com/AJARProject/AJ_Math_source/pulls).

**4D 21 R4**, project mode, `compatibilityVersion` 2140. MIT licence (`LICENSE`).

This new version was built with the help of Cursor and Grok Bot.

Documentation: [English](Documentation/AJ_Math.en.md), [français](Documentation/AJ_Math.fr.md). Analysis of the original tree: [ANALYSIS.md](ANALYSIS.md).

## Short install

**Interpreted.** Open `Project/AJ_Math.4DProject` with 4D 21 R4, or declare this folder as a host dependency ([components](https://developer.4d.com/docs/21-R4/Project/components)). This repository has no host database. A dependency on sources works in interpreted mode only.

**Compiled.** Build the component (Design > Build Application, or `BUILD APPLICATION` on `Settings/buildApp.4DSettings`) and put the resulting `.4dbase` in the host `Components` folder. A compiled host does not load an interpreted component. For AJUI Animate, this 21 R4 build replaces the 19 R8 binary in `Components/AJ_Math.4dbase` (the Components folder wins).
