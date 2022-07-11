<!-- ENTETE -->
[![img](https://img.shields.io/badge/Lifecycle-Experimental-339999)](https://www.quebec.ca/gouv/politiques-orientations/vitrine-numeriqc/accompagnement-des-organismes-publics/demarche-conception-services-numeriques)
[![License](https://img.shields.io/badge/Licence-LiLiQ--R-blue)](LICENSE_FR)

---

<div>
    <img src="./images/mcn.png">
</div>
<!-- FIN ENTETE -->

# Documentation des expérimentations 

Le Centre d'expertise appliqué en innovation rend disponible un laboratoire infonuagique d'expérimentation. Que ce soit pour appuyer la [phase découverte de la démarche de conception de services](https://www.quebec.ca/gouvernement/politiques-orientations/vitrine-numeriqc/accompagnement-des-organismes-publics/demarche-conception-services-numeriques/), pour mettre à l'essai des technologies appuyants l'innovation ou pour mettre en pratique les méthodes DevDecOps dans le contexte d'une organisation en processus de transformation numérique, l'expérimentation est la méthode privilégiée par le CEAI.

Pour assurer le partage des connaisances acquises lors d'une expérimentation menée dans ses infrastructures, le CEAI exige que celles-ci soient documentées et partagées dans un dépôt de code public. En plus contenir toutes les ressources nécéssaires à la reproduction de l'expérimentation, le dépôt devra contenir un ou plusieurs rapports d'expérimentation consignants les résultats de l'expérimentation.

## Le dépot de code

Le dépôt de code sert à consigner toutes les ressources nécéssaires à la reproduction de l'expérimentation. Il peut contenir le code source complet d'une application qui aurait été developpée dans le cadre de l'expériementation ou simplement les scripts et la documentation permettant de déployer une application tierse.

Les bonnes pratiques concernant les dépôts de code public sont documentées dans ce [guide](../Guides/Github). 

## Le rapport d’expérimentation

Le rapport doit être présenté de façon claire, lisible et structurée. Il est publié dans un fichier de type markdown sauvegardé dans le dépôt Git du projet. On préconise la création d’un fichier par expérimentation. Il débute par le titre de l'expérimentation suivi des sections suivantes:  

### Objectif 

Cette section est la première du rapport d'expérimentation. Elle permet d'expliquer ce qui doit être accompli durant l'expérimentation. On y énonce le problème que l'ont tente de régler et les contraintes présentes. On peut mettre en contexte l'expérimentation si elle est menée dans le cadre d'un projet ou d'un laboratoire. L'objectif doit être clair et concis et se résume la plupart du temps à une question.

**Exemple d'objectif:**

> Dans le cadre du projet de refonte des systèmes de l'organisme public Exemple, l'organsime aimerait savoir si il peut contenuer à utiliser le langage de programmation X dans le développmenet d'applications concues pour l'infonuagique.

### Hypothèse(s)

L'hypothèse est un énoncé qui tente de prédire les résultats de l'expérimentation. Elle se base normalement sur une recherche faite sur le sujet de l'expérimentation.

**Exemple d'hypothèse:**

> Le langage de programmation X n'ayant de pas compilateur supporté pour les systèmes Unix, il ne sera pas possible de construire des conteneurs Linux stables pour déployer chez les fournisseurs infonuagiques approuvés.

> Le langage de programmation X supporte le déploiement en conteneurs Linux qui pourront être déployés sans problème chez les fournisseurs approuvés.

### Démarche  

Cette section présente, les étapes à suivre pour réaliser l'expérimentation. Idéalement, une personne qui lit la démarche ne devrait pas se poser de questions sur ce qu'elle doit faire pour reproduire l'expérimentation et valider les résultats obtenus. Chaque étape devrait être décrite par une seule phrase et débuter par un verbe d'action à l'infinitif. Les étapes sont numérotées et sont placées de manière chronologique. 

**Exemple de démarche:**

> 1. Créer une application de type "Hello World" dans le langage X
> 2. Construire un conteneur exécutant l'application "Hello World"
> 3. Déployer le conteneur dans le service ECS 
> 4. Tester le fonctionnement de l'application
> 5. Profit! 

### Résultats  

On rapporte d'abord si l'hypothèse s'est avérrée ou non. Puis, on rapporte les découvertes faites au cours de l'expérimentation qui viennent mettre en contexte le résultat par rapport à l'objectif.

**Exemple de résultat:**

> Nous avons pu déployer une application conçue pour le cloud programmée avec le langage X.
>
> Par contre, la démarche fut très complexe car le langage X n'est pas conçu à la base pour concevoir des applications web. Nous avons du utiliser un framwork Y, qui n'est supporté que par une très petite communauté. Des problèmes de stabilitée ont vite fait surface lors de test de fonctionnement.
> 
> Pour utiliser le langage X dans un contexte infonuagique, l'organisme devra supporter et entretenir lui-même le framework Y et corriger les bugs qu'il contient.

### Références

Énoncer ici les références qui ont servies à l'expérimentation. 
