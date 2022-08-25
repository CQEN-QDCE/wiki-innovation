<!-- ENTETE -->
[![img](https://img.shields.io/badge/Lifecycle-Experimental-339999)](https://www.quebec.ca/gouv/politiques-orientations/vitrine-numeriqc/accompagnement-des-organismes-publics/demarche-conception-services-numeriques)
[![License](https://img.shields.io/badge/Licence-LiLiQ--P-blue)](https://github.com/CQEN-QDCE/.github/blob/main/LICENCE.md)

---

<div>
    <img src="https://github.com/CQEN-QDCE/.github/blob/main/images/mcn.png" />
</div>
<!-- FIN ENTETE -->

## Introduction 

Ce document décrit la méthodologie de l'application douze facteurs et sa mise en œuvre lors du développement d'applications exécutées sur l'infrastruture au CEAI. Cette méthodologie permet de créer des applications évolutives et robustes qui peuvent être déployées en continu avec une agilité optimale.

Avant d'aborder le sujet des « 12 Factor app », il faut comprendre le Cloud Native.

Commençons par une définition simple fournit par [Microsoft](https://docs.microsoft.com/en-us/dotnet/architecture/cloud-native/definition):

`L’architecture et les technologies natives cloud sont une approche de la conception, de la construction et de l’exploitation des charges de travail intégrées au cloud et tirent pleinement parti du modèle de cloud computing.`

[Cloud Native Computing Foundation](https://www.cncf.io/) fournit la [définition officielle](https://github.com/cncf/foundation/blob/main/charter.md) :

`Les technologies natives cloud permettent aux organisations de créer et d’exécuter des applications évolutives dans des environnements modernes, dynamiques tels que des clouds publics, privés et hybrides. Les conteneurs, les maillages de service, les microservices, l’infrastructure immuable et les API déclaratives illustrent cette approche.`

`Ces techniques permettent des systèmes faiblement couplés qui sont résilients, gérables et observables. Combinés à une automatisation robuste, ils permettent aux ingénieurs d’apporter des modifications à fort impact fréquemment et prévisibles avec un minimum de peine.`

La vitesse et l’agilité du cloud natif dérivent de nombreux facteurs. Avant tout, l’infrastructure cloud. Mais il y en a plus : cinq autres piliers fondamentaux présentés dans la figure ci-apres fournissent également le fondement des systèmes natifs cloud.

![](./images/cloud_native_foundational_pillars.png) 

Une de ces pelier comme vous avez vu dans la figure au-desous est Conception moderne pour cela nous pourrons avoir plusieur question:

Comment concevez-vous une application native cloud ? À quoi ressemble votre architecture ? À quels principes, modèles et bonnes pratiques adhéreriez-vous ? Quelles sont les préoccupations liées à l’infrastructure et aux opérations ?

Et pour répondre à ces questions, nous allons vous montrer La méthodologie 15 facteurs peut être appliquée à des applications écrites dans tout langage de programmation et toutes les plateformes, et qui utilisent tout type de services externes (base de données, file, cache mémoire, etc.)

Le « 12 Factor app » est un manifeste qui propose 12 bonnes pratiques concernant le développement d’applications web. Ce manifeste, écrit par [Adam Wiggins](https://adamwiggins.com/) (co-fondateur d’Heroku), est né de ses observations et de son expérience dans le développement et le déploiement d’applications web.

Cependant, la conception d'applications cloud natives modernes exige que vous changiez de vision en termes d'ingénierie, de configuration et de déploiement logiciel, par rapport à la conception d'applications sur site. Ce document vous explique comment appliquer les quanze facteurs à votre conception d'applications.

Voici le tableau suivant met en évidence la méthodologie de douzes facteurs selon [Microsoft](https://docs.microsoft.com/fr-ca/dotnet/architecture/cloud-native/definition#the-twelve-factor-application):

## Les 12 facteurs

| Facteur   |      Explication  |
|----------|:-------------:|
| [1 - Base de code](./factors_app/base_code.md) | Base de code unique pour chaque microservice, stockée dans son propre référentiel. Suivi avec contrôle de version, il peut être déployé sur plusieurs environnements (qa, préproduction, production).  |
| [2 - Dépendances](./factors_app/dependances.md) |  Chaque microservice isole et empaquette ses propres dépendances, en adoptant les modifications sans avoir d’impact sur l’ensemble du système.    |
| [3 - Configurations](./factors_app/configurations.md)	 | Les informations de configuration sont déplacées hors du microservice et externalisées par le biais d’un outil de gestion de la configuration en dehors du code. Le même déploiement peut se propager entre les environnements avec la configuration appropriée appliquée. |
| [4 - Services de stockage](./factors_app/stockage.md) | Les ressources auxiliaires (magasins de données, caches, répartiteurs de messages) doivent être exposées via une URL adressable. Cela dissocie la ressource de l’application, ce qui lui permet d’être interchangeable. |
| [5 - Build, Release, Run](./factors_app/cicd.md) | Chaque version doit appliquer une séparation stricte entre les étapes de génération, de mise en œuvre et d’exécution. Chacun doit être étiqueté avec un ID unique et prendre en charge la possibilité de restaurer. Les systèmes CI/CD modernes permettent de répondre à ce principe. |
| [6 - Processus](./factors_app/processus.md) | Chaque microservice doit s’exécuter dans son propre processus, isolé des autres services en cours d’exécution. Externaliser l’état requis à un service de stockage tel qu’un cache distribué ou un magasin de données. |
| [7 - Liaison de port](../liaison_port.md) | Chaque microservice doit être autonome avec ses interfaces et ses fonctionnalités exposées sur son propre port. Cela permet d’isoler d’autres microservices. |
| [8 - Concurrence](./factors_app/concurrence.md) | Lorsque la capacité doit augmenter, scale-out services horizontalement sur plusieurs processus identiques (copies) par opposition au scale-up d’une seule instance volumineuse sur la machine la plus puissante disponible. Développez l’application de façon simultanée à effectuer un scale-out dans des environnements cloud transparents. |
| [9 - Disposabilité](./factors_app/disposabilite.md) | Les instances de service doivent être jetables. Favorisez le démarrage rapide pour augmenter les opportunités d’extensibilité et les arrêts gracieux pour laisser le système dans un état correct. Les conteneurs Docker ainsi qu’un orchestrateur répondent intrinsèquement à cette exigence. |
| [10 - Parité des environnements](./factors_app/parite_environnements.md) | Conservez les environnements dans le cycle de vie de l’application comme possible, ce qui évite les raccourcis coûteux. Ici, l’adoption des conteneurs peut considérablement contribuer en favorisant le même environnement d’exécution. |
| [11 - Journalisation](./factors_app/journalisation.md)  | Traitez les journaux générés par les microservices en tant que flux d’événements. Traitez-les avec un agrégateur d’événements. Propagez les données de journal aux outils d’exploration de données/de gestion des journaux tels qu’Azure Monitor ou Splunk et finalement à l’archivage à long terme. |
| [12 - Processus d’administration](./factors_app/processus_administration.md) | Exécutez des tâches d’administration/gestion, telles que le nettoyage des données ou l’analytique informatique, en tant que processus unique. Utilisez des outils indépendants pour appeler ces tâches à partir de l’environnement de production, mais séparément de l’application. |

## Les trois nouveaux facteurs

| Nouveau facteur   |      Explication  |
|----------|:-------------:|
| [13 - API First](./factors_app/api_first.md) | Faites tout un service. Supposons que votre code sera consommé par un client frontal, une passerelle ou un autre service. |
| [14 - Télémétrie](./factors_app/telemetrie.md) | Sur une station de travail, vous disposez d’une visibilité approfondie sur votre application et son comportement. Dans le cloud, vous ne le faites pas. Assurez-vous que votre conception inclut la collection de données de supervision, spécifiques au domaine et d’intégrité/système. |
| [15 - Authentification/autorisation](./factors_app/authentification.md) | Implémentez l’identité à partir du début. Envisagez les fonctionnalités RBAC (contrôle d’accès en fonction du rôle) disponibles dans les clouds publics. |


## Références

[Les 12 facteurs](https://12factor.net/fr/)

[12-factor applications par IBM](https://developer.ibm.com/articles/creating-a-12-factor-application-with-open-liberty/) IBM - Par Grace Jansen, Mis à jour le 20 mai 2022 | Publié le 12 novembre 2021

[Applications Java cloud natives à 15 facteurs par IBM](https://developer.ibm.com/articles/15-factor-applications) IBM - Par Grace Jansen, Mis à jour le 20 mai 2022 | Publié le 29 novembre 2021

[Les 12 facteurs par CQEN](https://gitlab.forge.gouv.qc.ca/cqen/12facteurs)

[Qu’est-ce que Cloud Native ?](https://docs.microsoft.com/fr-fr/dotnet/architecture/cloud-native/definition) Microsoft, Publié le 23 juin 2022

[Développement d'applications douze facteurs sur Google Cloud](https://cloud.google.com/architecture/twelve-factor-app-development-on-gcp?hl=fr)

[Un guide illustré des applications à 12 facteurs](https://www.redhat.com/architect/12-factor-app) RedHat - Par Bob Reselman, le 2 février 2021

[Adapter l'application des douze facteurs aux microservices](https://www.nginx.com/blog/microservices-reference-architecture-nginx-twelve-factor-app/) Par Ben Horowitz de NGINX, Inc., le 28 juillet 2016

[12-factor App : une excellente base de développement applicatif](https://scient.fr/12-factor-app-une-excellente-base-de-developpement-applicatif/) Le 14 février 2022

[The 12-factor app : sont-ils toujours d’actualité ?](https://www.softfluent.fr/blog/the-12-factor-app-sont-ils-toujours-dactualite/) Par Christine Moronval

