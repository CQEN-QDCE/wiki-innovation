<!-- ENTETE -->
[![img](https://img.shields.io/badge/Lifecycle-Experimental-339999)](https://www.quebec.ca/gouv/politiques-orientations/vitrine-numeriqc/accompagnement-des-organismes-publics/demarche-conception-services-numeriques)
[![License](https://img.shields.io/badge/Licence-LiLiQ--R-blue)](LICENSE_FR)

---

<div>
    <img src="./images/mcn.png">
</div>
<!-- FIN ENTETE -->

## GitHub Action

GitHub Action a été choisi dans le but de permetre les utilisateurs du CEAI d'automatiser son pipeline de construction, de test et de déploiement. En plus, en utilisant les fonctionnalités fournies par l'outil, ils peuvent créer des flux de travail qui construisent et testent chaque demande d'extraction vers votre dépôt ou qui déploient des demandes d'extraction fusionnées vers la production.


## AWS Codepipeline

AWS Codepipeline a été choisi dans le but de permetre les utilisateurs du CEAI d'automatiser leurs pipelines de publication pour des mises à jour rapides et fiables des applications et de l'infrastructure sur [AWS SEA](https://github.com/CQEN-QDCE/ceai-cqen-documentation/tree/main/ASEA#aws-secure-environement-accelerator-asea).

Le code source de l'application est conservé dans un référentiel configuré en tant qu'action source GitHub dans le pipeline. Lorsque les développeurs transmettent des validations au référentiel, CodePipeline détecte la modification transmise et une exécution du pipeline démarre à partir de l'interfaceÉtape source.

L'action source GitHub se termine avec succès (c'est-à-dire que les dernières modifications ont été téléchargées et stockées dans le compartiment d'artefact unique à cette exécution). Les artefacts de sortie produits par l'action source GitHub, qui sont les fichiers d'application du référentiel, sont ensuite utilisés comme artefacts d'entrée qui seront utilisés par les actions à l'étape suivante.

L'exécution du pipeline passe de l’étape source à l’étape de production. La première action de l'Étape de prodexécute un projet de build créé dans CodeBuild et configuré en tant qu'action de build dans le pipeline. La tâche de build extrait une image d'environnement de build et génère l'application Web dans un conteneur virtuel.

La prochaine action dans leÉtape de prodest un projet de test unitaire créé dans CodeBuild et configuré en tant qu'action de test dans le pipeline.

Le code testé est ensuite travaillé par une action de déploiement dans l’étape de production qui déploie l'application dans un environnement de production. Une fois l'action de déploiement terminée, l'action finale de l'étape est un projet de test d'intégration créé dans CodeBuild et configuré en tant qu'action de test dans le pipeline. L'action de test appelle les scripts shell qui installent et exécutent un outil de test, tel qu'un vérificateur de liens, sur l'application Web. Une fois ces étapes terminées, la sortie est une application Web générée et un ensemble de résultats de test.


## Table de matières

Voici les sujets de base qui peuvent vous aider à démarrer avec le CICD. 

* [L’approche CI/CD en DevOps](./devops_cicd.md)

* [La strecture git flow selon le type de projet au ceai](./ceai_git_workflow.md) 

* [Composants de Github Actions](./github_action.md)

* [L'utilisation de CICD au ceai](./ceai_cicd.md)


# Références 

- [Guide de GitHub Action](https://docs.github.com/en/actions/learn-github-actions)
- [L'utilisation de workflow](https://docs.github.com/en/actions/using-workflows/about-workflows)
- [GitHub Marketplace](https://github.com/marketplace)
- [AWS codepipline](https://docs.aws.amazon.com/codepipeline/latest/userguide/welcome.html)
