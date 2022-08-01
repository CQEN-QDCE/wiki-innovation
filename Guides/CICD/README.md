<!-- ENTETE -->
[![img](https://img.shields.io/badge/Lifecycle-Experimental-339999)](https://www.quebec.ca/gouv/politiques-orientations/vitrine-numeriqc/accompagnement-des-organismes-publics/demarche-conception-services-numeriques)
[![License](https://img.shields.io/badge/Licence-LiLiQ--R-blue)](LICENSE_FR)

---

<div>
    <img src="../images/mcn.png">
</div>
<!-- FIN ENTETE -->

## GitHub Action

GitHub Action a été choisi dans le but de permetre les utilisateurs du laboratoire du Centre d'expertise appliquée en innovation du CQEN (CEAI) d'automatiser son pipeline de construction, de test et de déploiement. En plus, en utilisant les fonctionnalités fournies par l'outil, ils peuvent créer des flux de travail qui construisent et testent chaque demande d'extraction vers votre dépôt ou qui déploient des demandes d'extraction fusionnées vers la production.


## AWS Codepipeline

AWS Codepipeline a été choisi dans le but de permetre les utilisateurs du CEAI d'automatiser leurs pipelines de publication pour des mises à jour rapides et fiables des applications et de l'infrastructure sur [AWS SEA](https://github.com/CQEN-QDCE/ceai-cqen-documentation/tree/main/ASEA#aws-secure-environement-accelerator-asea).

AWS CodePipeline est l’orchestrateur de tous les services de CICD et permet de mettre en place une chaîne de Continuous Delivery entièrement automatisée.

Il peut intégrer des outils tiers comme GitHub, Jenkins, des outils de Load Testing et des services AWS comme Elastic Beanstalk, CloudFormation, ECS,…


## Table de matières

Voici les sujets de base qui peuvent vous aider à démarrer avec le CICD. 

* [L’approche CI/CD en DevOps](./devops_cicd.md)

* [La strecture git flow selon le type de projet au ceai et l'utilisation de CICD](./ceai_cicd_workflow.md) 

* [Composants de Github Actions](./github_action.md)

* [Composants de AWS Pipeline](./aws_pipeline.md)

* [GitHub Action Demo]()


# Références 

- [Guide de GitHub Action](https://docs.github.com/en/actions/learn-github-actions)
- [L'utilisation de workflow](https://docs.github.com/en/actions/using-workflows/about-workflows)
- [GitHub Marketplace](https://github.com/marketplace)
- [AWS codepipline](https://docs.aws.amazon.com/codepipeline/latest/userguide/welcome.html)