<!-- ENTETE -->
[![img](https://img.shields.io/badge/Lifecycle-Experimental-339999)](https://www.quebec.ca/gouv/politiques-orientations/vitrine-numeriqc/accompagnement-des-organismes-publics/demarche-conception-services-numeriques)
[![License](https://img.shields.io/badge/Licence-LiLiQ--R-blue)](LICENSE_FR)

---

<div>
    <img src="https://github.com/CQEN-QDCE/.github/blob/main/images/mcn.png">
</div>
<!-- FIN ENTETE -->

# Déploiement d'une application web dans AWS avec terraform

## Description
Cet exercice vous montre comment déployer une application web simple dans AWS d'une manière fiable.

Il s'agit d'une application Node.js qui, dans une première étape, sera déployée dans le service ECS (*Elastic Container Service*), à partir du service de registre d'images de conteneur ECR (*Elastic Container Registry*).

Ensuite, dans les étapes suivantes, l'application sera exposée publiquement via le service *API Gateway*.

![infrastructure-aws-web-app](../../images/Infra-Web-App-AWS.png)

L'infrastructure nécessaire pour cet exercice sera montée en utilisant l'outil d'infrastructure en tant que code (IaC): `terraform`.
Terraform aide à la mise en place des ressources nécessaires dans AWS pour le déploiement de l'application. À travers des scripts il offre la flexibilité et le montage/démontage de toute l'architecture utilisé dans l'exercice.

Plus sur terraform: [ici](../../Outils/Terraform/README.md#quest-ce-que-cest-terraform)

## Instructions

### Prérequis
- Un compte AWS avec
  - Un réseau virtuel (Virtual Private Cloud - VPC)
  - Des sous-réseaux d'application et de web
  - Des groupes de sécurité d'application et de web
  - Un service web de système de noms de domaine (DNS) - Route 53
- Accès au compte AWS
- Terraform installé dans le poste de travail ([voir](../../Outils/Terraform/README.md#installation))
- AWS cli installé dans le poste de travail ([voir](../../Outils/AWS-Command-Line-Interface/README.md#installation))

### Exécution

- [Étape 1: Construire une image docker d'une application web simple](E1-image-docker-web-app.md)
- [Étape 2: Préparation et initialisation de l'espace du travail avec les scripts terraform](E2-preps-and-init-workspace-tf.md)
- [Étape 3: Déployer les ressources du registre de conteneurs ECR](E3-deploy-aws-ecr.md)
- [Étape 4: Déployer les ressources du cluster ECS](E4-deploy-aws-ecs.md)
- [Étape 5: Déployer les ressources de l'Api Gateway pour tester l'application](E5-deploy-api-gateway-aws.md)
- [Étape 6: (optionnel) Déployer les ressources pour avoir un lien public de l'application (DNS)](E6-opt-deploy-domain-name-aws.md)

### Nettoyage
Il est important de nettoyer nos espaces de travail de développement une fois finie l'expérience, pour deux raisons:
- Parce que c'est une bonne pratique.
- Parce que les services infonuagiques sont facturés à l'utilisation.

Quand vous avez fini de travailler dans cet environnement, vous pouvez effacer les ressources créées en utilisant la commande `destroy` de terraform.
```bash
terraform destroy
```

## Références
- [Deploy NodeJs App on AWS Using Terraform and Docker](https://codelabs.transcend.io/codelabs/node-terraform/index.html?index=../..index#6)