<!-- ENTETE -->
[![img](https://img.shields.io/badge/Lifecycle-Experimental-339999)](https://www.quebec.ca/gouv/politiques-orientations/vitrine-numeriqc/accompagnement-des-organismes-publics/demarche-conception-services-numeriques)
[![License](https://img.shields.io/badge/Licence-LiLiQ--R-blue)](LICENSE_FR)

---

<div>
    <img src="https://github.com/CQEN-QDCE/.github/blob/main/images/mcn.png">
</div>
<!-- FIN ENTETE -->

# Initialiser et préparer l'espace du travail avec les scripts terraform

## Brève description

Dans cette section, nous allons mettre en place l'infrastructure nécessaire pour le déploiement de l'application dans AWS avec l'aide des scripts terraform ([plus sur terraform](../../Outils/Terraform/README.md#quest-ce-que-cest-terraform)).

Comme mentionné dans la page principale de cet exemple, il y a des [prérequis](README.md#prérequis) avant de commencer le provisionnement des ressources dans AWS.

Entre les ressources à créer en première, on peut mentionner:
- ECR (Elastic Container Registry): Le conteneur de l'image de l'application.
- ECS (Elastic Container Service): Le cluster qui héberge l'application.
  - Service: Exécute et maintiens un nombre spécifique d'instances d'une définition de tâche en même temps.
  - Définition de Tâche: Nécessaire pour rouler le conteneur Docker dans ECS.
  - Équilibreurs de charge (Load Balancers):
    - D'application (alb): Utilisé pour acheminer le trafic HTTP/HTTPS (Hypertext Transfer Protocol / Secure).
    - De réseau (nlb): Utilisé pour acheminer le trafic TCP (Transmission Control Protocol) ou UDP (User Datagram Protocol).

## Fichiers terraform initiaux

### Explication

Pour l'initialisation de l'espace de travail avec terraform, nous allons créer trois fichiers terraform:

- terraform.tfvars: fichier que contient les paramètres nécessaires pour l'environnement de travail.
- data.tf: fichier que contient les informations des ressources déjà créées dans AWS comme prérequis de cet exercice.
- provider.tf: fichier qu'indique que le fournisseur de cloud est AWS et la région dans laquelle le compte AWS se trouve.

### Création et édition des fichiers terraform

Créez un dossier `deploiement` pour garder le code terraform et allez au dossier créé.
```bash
mkdir deploiement
cd deploiement
```
Dans votre éditeur de code (par exemple, Visual Studio Code):
- Créez un fichier `terraform.tfvars` avec le contenu du fichier template [terraform.tfvars](scripts/terraform.tfvars) et éditez les valeurs nécessaires:

    |  Variable | Description  |  Exemple de Valeur  |
    |---|---|---|
    | aws_region | La région du compte AWS  | ca-central-1  |
    | aws_profile | Le profile créé dans AWS pour gérer les ressources  | dev1  |
    | aws_application | Le nom de l'application  | mon-api-web  |
    | aws_environment | L'environnement de travail  | dev  |
    | aws_type_compte | Le type de compte AWS (utilisé pour étiqueter les ressources)  | Dev  |
    | aws_ecs_cpu | CPU utilisé pour la définition de tâche  | 1024  |
    | aws_ecs_memory | La mémoire utilisée pour la définition de tâche  | 2048  |
    | aws_ecs_app_port | Le port à être utilisé pour exposer l'application  | 3000 |
    | aws_ecs_ec2_tg_port | Le port à être utilisé par le groupe cible  | 80 |
    | aws_ecs_force_deploy | Flag pour forcer le déploiement  | true |
    | aws_ecs_health_check_path | Le path pour vérifier la santé de l'application  | / |
    | aws_ecs_image_app_tag | L'étiquette (tag) de l'image de l'application  | latest  |
    | aws_route53_zone_id | La zone de la route 53 d'AWS | XXXXXXXX  |

- Copiez les fichiers [data.tf](scripts/data.tf), [provider.tf](scripts/provider.tf), [variables.tf](scripts/variables.tf) et [ecr.tf](scripts/ecr.tf) dans votre dossier `deploiement`.

[<-- Page Principale](README.md)

[-> Page Précedente: Étape 1: Étape 1: Construire une image docker d'une application web simple](E1-image-docker-web-app.md)

[-> Page Suivante: Étape 3: Déployer les ressources du registre de conteneurs ECR](E3-deploy-aws-ecr.md)
