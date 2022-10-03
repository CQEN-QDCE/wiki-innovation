<!-- ENTETE -->
[![img](https://img.shields.io/badge/Lifecycle-Experimental-339999)](https://www.quebec.ca/gouv/politiques-orientations/vitrine-numeriqc/accompagnement-des-organismes-publics/demarche-conception-services-numeriques)
[![License](https://img.shields.io/badge/Licence-LiLiQ--R-blue)](LICENSE_FR)

---

<div>
    <img src="https://github.com/CQEN-QDCE/.github/blob/main/images/mcn.png">
</div>
<!-- FIN ENTETE -->

# Terraform

## Qu'est-ce que c'est terraform?
Terraform est un outil open source d'Infrastructure as Code (IaC) créé par HashiCorp.

Outil de codage déclaratif, Terraform permet aux développeurs d'utiliser un langage de configuration appelé HCL (HashiCorp Configuration Language), qui décrit l'infrastructure cloud ou sur site souhaité pour l'exécution d'une application avec son "état final". Terraform génère ensuite un plan permettant d'atteindre cet état final et exécute le plan pour mettre à disposition l'infrastructure.

Terraform possède de nombreux avantages : il utilise une syntaxe simple, il peut mettre à disposition une infrastructure dans plusieurs clouds et centres de données sur site, et il peut remettre à disposition des infrastructures de façon sécurisée et efficace en réponse aux changements de configuration. Toutes ces qualités en font actuellement l'un des outils d'automatisation d'infrastructure les plus populaires. Si votre entreprise a l'intention de déployer un environnement de cloud hybride ou multicloud, vous aurez probablement envie ou besoin de découvrir Terraform.

[Pour plus d'information](https://www.ibm.com/fr-fr/cloud/learn/terraform)

## Installation
Pour installer Terraform, la première chose à faire est de télécharger le package correspondant à votre système d'exploitation sur le [site d'HashiCorp](https://www.terraform.io/downloads). 

Évidemment, la procédure d'installation différera selon les OS. Sur son site, HashiCorp propose une série de tutoriels d'installation couvrant Windows, Linux et MacOS.

Pour le cas de cet exercice, nous allons choisir Linux - Ubuntu/Debian.
Dans un terminal, exécutez les commandes:
```bash
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

Pour finir, il convient de vérifier que le binaire terraform est disponible sur le PATH. Et surtout que l'installation a bien été réalisée en ouvrant une session via l'interface en ligne de commande pour faire le point sur les sous-commandes Terraform disponibles:
```bash
terraform -help
```

Résultat:
```bash
Usage: terraform [global options] <subcommand> [args]

The available commands for execution are listed below.
The primary workflow commands are given first, followed by
less common or more advanced commands.

Main commands:
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure

All other commands:
  console       Try Terraform expressions at an interactive command prompt
  fmt           Reformat your configuration in the standard style
  force-unlock  Release a stuck lock on the current workspace
  get           Install or upgrade remote Terraform modules
  graph         Generate a Graphviz graph of the steps in an operation
  import        Associate existing infrastructure with a Terraform resource
  login         Obtain and save credentials for a remote host
  logout        Remove locally-stored credentials for a remote host
  output        Show output values from your root module
  providers     Show the providers required for this configuration
  refresh       Update the state to match remote systems
  show          Show the current state or a saved plan
  state         Advanced state management
  taint         Mark a resource instance as not fully functional
  test          Experimental support for module integration testing
  untaint       Remove the 'tainted' state from a resource instance
  version       Show the current Terraform version
  workspace     Workspace management

Global options (use these before the subcommand, if any):
  -chdir=DIR    Switch to a different working directory before executing the
                given subcommand.
  -help         Show this help output, or the help for a specified subcommand.
  -version      An alias for the "version" subcommand.
```

## Commandes principales
- ***terraform init*** : Permet d'initialiser le répertoire contenant la configuration Terraform
- ***terraform validate*** : Permet de vérifier si la configuration est valide
- ***terraform plan*** : Permet d'afficher une vue des différences entre la configuration Terraform et la configuration effective
- ***terraform apply*** : Permet d'appliquer la configuration
- ***terraform import*** : Permet d'intégrer des ressources déployées à l'extérieur de Terraform dans sa configuration
- ***terraform state*** : Permet d'interagir avec le fichier d'état
- ***terraform destroy***: Permet de détruire les ressources créées. Utilisez plus pour des environnements temporaires comme de développement ou de test.

## Références
- [Terraform - IBM Cloud Education](https://www.ibm.com/fr-fr/cloud/learn/terraform)
- [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- [Terraform (gratuit) : maîtriser l'outil d'Infrastructure as Code](https://www.journaldunet.fr/web-tech/guide-de-l-entreprise-digitale/1443824-terraform-gratuit-maitriser-l-outil-d-infrastructure-as-code/)
- [Terraform (logiciel)](https://fr.wikipedia.org/wiki/Terraform_(logiciel))