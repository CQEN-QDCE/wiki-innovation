<!-- ENTETE -->
[![img](https://img.shields.io/badge/Lifecycle-Experimental-339999)](https://www.quebec.ca/gouv/politiques-orientations/vitrine-numeriqc/accompagnement-des-organismes-publics/demarche-conception-services-numeriques)
[![License](https://img.shields.io/badge/Licence-LiLiQ--R-blue)](LICENSE_FR)

---

<div>
    <img src="./images/mcn.png">
</div>
<!-- FIN ENTETE -->

Il y a deux façons principales de structurer vos pipelines, chacune ayant ses propres avantages. Ces méthodes peuvent être mélangées et assorties selon les besoins :

1. Exprémentation : Il est les projets simples où toute la configuration se trouve à un seul endroit facile à trouver.
Production : Idéal pour les projets complexes et de grande envergure qui nécessitent une exécution efficace.
2. Production : Idéal pour les projets en cours de production ou dont vous pensez qu'ils peuvent passer à la phase de production.

## Eprémentation:
Le flux Github Flow fonctionne avec différentes branches pour gérer facilement chaque phase du développement du logiciel, il est suggéré de l'utiliser lorsque votre logiciel a le concept de "Expérimentation" car, comme vous pouvez le voir dans le schéma ci-dessus

Les branches principales de ce flux sont :

- Prod (master)
- fonctionnalités(features)

Lorsque vous clonez un dépôt GIT dans votre dossier local, vous devez immédiatement créer une branche du master appelée au nom de votre fonctionnalité par exemple (features/nom), cette branche sera la branche pour votre développement et où vous pourriez implémenter votre  fonctionnalité ou corriger des bogues avant le déploiment. Chaque fois qu'un développeur a besoin d'ajouter une nouvelle fonctionnalité, il crée une nouvelle branche à partir de master qui lui permet de travailler correctement sur cette fonctionnalité sans compromettre le code des autres membres de l'équipe dans la branche develop.
Lorsque la fonctionnalité est prête et testée, et vous êtes prêt à déployer votre projet, Vous pourriez ouvrir une demande "Pull-request" et une fois la réviseur et approuvé la fonctionnalité, vous pouvez la fusionner avec master afin de faire le déploiement final. 
Notre objectif est d'avoir toujours une version stable de la branche de production car nous ne fusionnons le code que lorsque la nouvelle fonctionnalité est terminée et qu'elle fonctionne.
Évidemment pour accomplir toutes ces tâches, vous pouvez trouver en ligne un grand nombre de scripts ..


## Production
Le flux Git fonctionne avec différentes branches pour gérer facilement chaque phase du développement du logiciel, il est suggéré de l'utiliser lorsque votre logiciel a le concept de "Prduction" car, comme vous pouvez le voir dans le schéma ci-dessus, ce n'est pas la meilleure décision lorsque vous travaillez dans un environnement de livraison continue ou de déploiement continu où ce concept est absent.
Un autre point positif de ce flux est qu'il convient parfaitement lorsque vous travaillez en équipe et qu'un ou plusieurs développeurs doivent collaborer à la même fonctionnalité.
Mais regardons de plus près ce modèle.

Les branches principales de ce flux sont :

- Prod (master)
- pre-prod(release)
- développer(develop)
- fonctionnalités(features)

Lorsque vous clonez un dépôt GIT dans votre dossier local, vous devez immédiatement créer une branche du master appelée develop (Si s'applique), cette branche sera la branche principale pour le développement et où tous les développeurs d'une équipe travailleront pour implémenter de nouvelles fonctionnalités ou corriger des bogues avant la publication.
Chaque fois qu'un développeur a besoin d'ajouter une nouvelle fonctionnalité, il crée une nouvelle branche à partir de develop qui lui permet de travailler correctement sur cette fonctionnalité sans compromettre le code des autres membres de l'équipe dans la branche develop.
Lorsque la fonctionnalité est prête et testée, elle peut être réintégrée dans la branche de développement. Notre objectif est d'avoir toujours une version stable de la branche de développement car nous ne fusionnons le code que lorsque la nouvelle fonctionnalité est terminée et qu'elle fonctionne.
Lorsque toutes les fonctionnalités liées à une nouvelle version sont implémentées dans la branche de développement, il est temps de brancher le code sur la branche de pre-prod où vous commencerez à tester correctement avant le déploiement final et où votre client pourra également tester l'application et voir si tout répond à ses besoins.
Lorsque vous faites passer votre code de la branche de développement à la branche de pre-prod, vous devez éviter d'ajouter de nouvelles fonctionnalités, mais vous devez uniquement corriger les bogues dans le code de la branche de pre-prod jusqu'à ce que vous créiez une branche de pre-prod stable.
À la fin, lorsque vous êtes prêt à déployer votre projet en direct, vous marquerez la version (Mettre un tag) dans la branche principale afin d'avoir toutes les différentes versions que vous publiez semaine après semaine.
Apparemment, cela peut sembler beaucoup d'étapes, mais il est certain que c'est assez sûr et vous aide à éviter les erreurs ou les problèmes lors de la publication.