<!-- ENTETE -->
[![img](https://img.shields.io/badge/Lifecycle-Experimental-339999)](https://www.quebec.ca/gouv/politiques-orientations/vitrine-numeriqc/accompagnement-des-organismes-publics/demarche-conception-services-numeriques)
[![License](https://img.shields.io/badge/Licence-LiLiQ--R-blue)](LICENSE_FR)

---

<div>
    <img src="./images/mcn.png">
</div>
<!-- FIN ENTETE -->

# Expérimentations dans le cadre du processus d'innovation

Le Centre d'expertise appliqué en innovation rend disponible un laboratoire infonuagique d'expérimentation. Que ce soit pour appuyer la [phase découverte de la démarche de conception de services](https://www.quebec.ca/gouvernement/politiques-orientations/vitrine-numeriqc/accompagnement-des-organismes-publics/demarche-conception-services-numeriques/), pour mettre à l'essai des technologies appuyant l'innovation ou pour mettre en pratique les méthodes DevSecOps dans le contexte d'une organisation en processus de transformation numérique, l'expérimentation est la méthode privilégiée par le CEAI.

Le CEAI propose une méthode d'expérimentation basée sur le *[hypothesis driven development](https://www.ibm.com/garage/method/practices/learn/practice_hypothesis_driven_development)* qui consiste à élaborer une hypothèse décrivant l'effet recherché de l'application d'une technologie à un problème donné. Les projets d'expérimentation doivent être soumis au CEAI sous forme d'hypothèse. Celles-ci sont par la suite priorisées selon plusieurs critères allant du potentiel d'innovation à l'applicabilité de la solution.

Pour assurer le partage des connaissances acquises lors d'une expérimentation menée dans ses infrastructures, le CEAI exige que celles-ci soient documentées et partagées dans un dépôt de code public. En plus contenir toutes les ressources nécessaires à la reproduction de l'expérimentation, le dépôt devra contenir un ou plusieurs rapports d'expérimentation consignant les résultats de l'expérimentation.

## Hypothèse

L'hypothèse est un document d'une page énonçant une proposition d'application d'une technologie à un problème donné. On y décrit d'abord le contexte: soit le projet, le problème ou l'opportunité dans l'écosystème gouvernemental sur lequel l'hypothèse va s'appliquer. Puis, on énonce l'hypothèse via une formule définie:

> Nous croyons que ...
> Résultera en ...
> Ceci sera prouvé si : 

Finalement, on propose une méthode pour mener l'expérimentation en ne donnant que les grandes lignes de celle-ci. Les besoins en ressources et les échéanciers seront définis plus tard si l'on va de l'avant avec l'hypothèse.

Gabarit disponible [ici](gabarits/hypothese.md).

## Le dépôt de code

Le dépôt de code sert à consigner toutes les ressources nécessaires à la reproduction de l'expérimentation. Il peut contenir le code source complet d'une application qui aurait été développée dans le cadre de l'expérimentation ou simplement les scripts et la documentation permettant de déployer une application tierce.

Les bonnes pratiques concernant les dépôts de code public sont documentées dans ce [guide](../Guides/Github). 

## Le rapport d’expérimentation

Le rapport doit être présenté de façon claire, lisible et structurée. Il est publié dans un fichier de type *markdown* sauvegardé dans le dépôt Git du projet. On préconise la création d’un fichier par expérimentation (gabarit disponible [ici](gabarits/rapport.md)). Il débute par le titre de l'expérimentation suivi des sections suivantes:  

