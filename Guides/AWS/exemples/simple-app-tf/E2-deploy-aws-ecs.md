<!-- ENTETE -->
[![img](https://img.shields.io/badge/Lifecycle-Experimental-339999)](https://www.quebec.ca/gouv/politiques-orientations/vitrine-numeriqc/accompagnement-des-organismes-publics/demarche-conception-services-numeriques)
[![License](https://img.shields.io/badge/Licence-LiLiQ--R-blue)](LICENSE_FR)

---

<div>
    <img src="https://github.com/CQEN-QDCE/.github/blob/main/images/mcn.png">
</div>
<!-- FIN ENTETE -->

# Déploiement des ressources du cluster AWS ECS (Elastic Container Service)

Dans cette partie des instructions nous allons mettre en place l'infrastructure nécessaire pour le déploiement de l'application dans AWS avec l'aide des scripts terraform ([plus sur terraform](../../Outils/Terraform/README.md#quest-ce-que-cest-terraform)).

Comme mentionné dans la page principale de cet exemple, il y a des [prérequis](README.md#prérequis) avant de commencer le provisionnement des ressources dans AWS.

Entre les les ressources à créer, on peut mentionner:
- ECS (Elastic Container Service): Le cluster qui héberge l'application.
- ECR (Elastic Container Registry): Le conteneur de l'image de l'application.
- Équilibreurs de charge (Load Balancers)

## Initialiser et préparer l'espace du travail avec les scripts terraform

Dans cette partie initiale, nous allons créer trois fichiers terraform:

- terraform.tfvars: fichier que contient les paramètres nécessaires pour l'environnement de travail.
- data.tf: fichier que contient les informations des ressources déjà créées dans AWS comme prérequis de cette exercice.
- provider.tf: fichier qu'indique que le fournisseur de cloud est AWS et la région dans laquelle le compte AWS se trouve.

Créez un dossier `deploiement`pour garder le code terraform et allez au dossier créé.
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
    | aws_type_compte | Le type de compte AWS (utilisé pour étiquetter les ressources)  | Dev  |
    | aws_ecs_cpu | CPU utilisé pour la définition de tâche  | 1024  |
    | aws_ecs_memory | La mémoire utilisé pour la définition de tâche  | 2048  |
    | aws_ecs_app_port | Le port a être utilisé pour exposer l'application  | 3000 |
    | aws_ecs_ec2_tg_port | Le port à être utilisé par le group cible  | 80 |
    | aws_ecs_force_deploy | Flag pour forcer le déploiement  | true |
    | aws_ecs_health_check_path | Le path pour vérifier la santé de l'application  | / |
    | aws_ecs_image_app_tag | L'étiquette (tag) de l'image de l'application  | latest  |
    | aws_route53_zone_id | La zone de la route 53 d'AWS | XXXXXXXX  |

- Copiez les fichiers [data.tf](scripts/data.tf), [provider.tf](scripts/provider.tf), [variables.tf](scripts/variables.tf) et [ecr.tf](scripts/ecr.tf) dans votre dossier deploiement.


## Créer la ressource AWS ECR (Elastic Container Registry), que contiendra l'image de l'application
Pour commencer à créer les ressources dans AWS, il faut que le profile de connexion au compte AWS [soit créé](../../Outils/AWS-Command-Line-Interface/README.md#configuration-daws-sso-single-sign-on) et ensuite, ouvrir une session de connexion avec ce profile créé ([voir](../../Outils/AWS-Command-Line-Interface/README.md#login-au-compte-aws)).

- Exécutez la commande `init` pour initialiser le répertoire comme un conteneur du code terraform:
  ```bash
  terraform init
  ```
  La commande va télécharger les plugins disponibles pour le fournisseur AWS listé dans le fichier `provider.tf`

- Exécutez la commande `plan` pour visualiser les ressources à créer:
  ```bash
  terraform plan
  ```
  Vous devriez voir un résultat similaire:
  ```bash
  Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

    Terraform will perform the following actions:

    # aws_ecr_repository.ecr_repo will be created
    + resource "aws_ecr_repository" "ecr_repo" {
        + arn                  = (known after apply)
        + id                   = (known after apply)
        + image_tag_mutability = "MUTABLE"
        + name                 = "web-api-sample1-dev-ecr"
        + registry_id          = (known after apply)
        + repository_url       = (known after apply)
        + tags_all             = (known after apply)
        }

    Plan: 1 to add, 0 to change, 0 to destroy.
  ```
  Vous pouvez constater que la ressource ecr_repo sera créée.

- Exécutez la commande `apply` pour appliquer les modifications.
  ```bash
  terraform apply
  ```
  Vous confirmez l'action et la ressource sera créée dans AWS.
  Dans votre navigateur, vous pouvez aller au compte AWS et confirmer que le registre a été bien créé.

  ![aws-ecr](images/aws-web-ecr.png)

  Si vous cliquez sur le registre créé, vous allez voir qu'il est vide. À continuation, vous allez ajouter l'image de l'application.
## Déposer l'image docker de l'application dans la ressource ECR

Toujours, dans votre navigateur, cliquez sur le registre créé dans AWS, si vous n'êtes pas déjà à l'intérieur.

Vous allez voir en haut à droit, le bouton "Afficher les commandes Push". Cliquez sur lui pour voir les instructions à suivre pour le téléchargement de l'image docker de l'application.

Dans votre terminal:
1. Ouvrez une session de connexion au registre créé en exécutant la première instruction. Par exemple:
    ```bash
    aws ecr get-login-password --region ca-central-1 | docker login --username AWS --password-stdin 123456789012.dkr.ecr.ca-central-1.amazonaws.com
    ```
2. Comme vous avez déjà l'image de votre application en local, vous n'avez pas besoin de la construire, donc pas besoin de la deuxième instruction.
   Vous pouvez voir vos images locales avec la commande `docker images`
   ```bash
   docker images
   ```
3. Étiquettez l'image locale avant de la transférer au registre:
   ```bash
   docker tag web-api-sample1-dev-ecr:latest 123456789012.dkr.ecr.ca-central-1.amazonaws.com/web-api-sample1-dev-ecr:latest
   ```
   * `web-api-sample1-dev-ecr:latest` correspondent au nom de l'image (web-api-sample1-dev-ecr), et la version de l'image (latest).
  
4. Poussez l'image dans le registre créé dans AWS:
   ```bash
   docker push 123456789012.dkr.ecr.ca-central-1.amazonaws.com/web-api-sample1-dev-ecr:latest
   ```
5. Vérifiez que l'image a été bien poussez dans le registre. Dans votre navigateur, dans la console web de votre compte AWS (vue ECR), vous allez voir que l'image a été transférée:

    ![aws-ecr-app-image](images/aws-web-ecr-app-image.png)

