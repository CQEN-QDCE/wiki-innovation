<!-- ENTETE -->
[![img](https://img.shields.io/badge/Lifecycle-Experimental-339999)](https://www.quebec.ca/gouv/politiques-orientations/vitrine-numeriqc/accompagnement-des-organismes-publics/demarche-conception-services-numeriques)
[![License](https://img.shields.io/badge/Licence-LiLiQ--R-blue)](LICENSE_FR)

---

<div>
    <img src="https://github.com/CQEN-QDCE/.github/blob/main/images/mcn.png">
</div>
<!-- FIN ENTETE -->

# Interface de Ligne de Commande AWS (AWS CLI)

L'interface de la ligne de commande AWS (AWS CLI) est un outil unifié qui permet de gérer vos services AWS. Avec un seul outil à télécharger et à configurer, vous pouvez contrôler plusieurs services AWS à partir de la ligne de commande et les automatiser au moyen de scripts.

## Installation
Nous allons décrire l'installation pour le système d'exploitation Linux.

Dans votre terminal, utilisez la commande `curl` ou allez directement au [site web](https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip) pour télécharger le fichier d'installation:
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
```
Décompressez le fichier téléchargé:
```bash
unzip awscliv2.zip
```
Exécutez le programme d'installation:
```bash
sudo ./aws/install
```
Vérifiez l'installation:
```bash
aws --version
```
Exemple de résultat:
```bash
aws-cli/2.4.16 Python/3.8.8 Linux/5.15.0-46-generic exe/x86_64.ubuntu.22 prompt/off
```

## Configuration d'AWS SSO (Single Sign-On)
- Créer un profil que vous permettra d'accèder au compte AWS à partir de la ligne de commandes:
  ```bash
  aws configure sso
  ```
  Il y aura des valeurs à spécifier comme:
  - L'URL du début d'AWS
  - La région AWS
  - Le compte AWS
  - Le nom du profil à être créé

## Login au compte aws
- Pour ouvrir une session de connexion au compte AWS:
    ```bash
    aws sso login --profile dev1
    ```
    Dans cette commande, `dev1` est le profil utilisé pour se connecter au compte AWS.

## Références
- [Installing or updating the latest version of the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions)
- [Interface de ligne de commande AWS](https://aws.amazon.com/fr/cli/#:~:text=L'interface%20de%20la%20ligne,automatiser%20au%20moyen%20de%20scripts.)