<!-- ENTETE -->
[![img](https://img.shields.io/badge/Lifecycle-Experimental-339999)](https://www.quebec.ca/gouv/politiques-orientations/vitrine-numeriqc/accompagnement-des-organismes-publics/demarche-conception-services-numeriques)
[![License](https://img.shields.io/badge/Licence-LiLiQ--P-blue)](https://github.com/CQEN-QDCE/.github/blob/main/LICENCE.md)

---

<div>
    <img src="https://github.com/CQEN-QDCE/.github/blob/main/images/mcn.png" />
</div>
<!-- FIN ENTETE -->

# Création et configuration d'une clé GPG

### 0. Effacer des clés GPG installées sur votre poste
Suivre ces étapes si besoin d'effacer des clés configurées sur le poste. exécuter les commandes suivantes:
- `gpg --list-keys` pour lister toutes les clés existantes sur le poste
- `gpg --delete-key <ID de la clé à effacer>`
- Si un message d'erreur s'affiche lors de l'exécution de la commande, c'est qu'il y a une clé privé d'associée à la clé à effacer. Il faut l'effacer en premier en exécutant la commande `gpg --delete-secret-key <ID de la clé à effacer>`
- Ré-exécuter la commande `gpg --delete-key <ID de la clé à effacer>`

### 1. Générer la Clé GPG
#### 1.1. Exécuter: `gpg --full-generate-key`
Si dans les options vous avez *ECC (sign and encrypt)* choisir cette option, puis *Curve 25519* par la suite. Pour utiliser cette option, il faut avoir installé gpg v2. Dans un mac, il peut être installé en exécutant les commandes `brew install gnupg` et `brew link gnupg`

Si vous ne voulez pas utiliser gpg v2, voici les choix à faire pendant la génération de la clé:
- Choisir RSA
- Choisir 4096
- Utiliser le nom complet et l'adresse courriel configurés dans votre profil GitHub
- Entrer une passphrase

*Pour les utilisateurs de mac, vous pouvez ajouter la passphrase dans l'application `GPG Keychain`*
#### 1.2. Executér: `gpg --list-secret-keys --keyid-format=long`

Copier l'Id de la clé GPG. Dans le cas de l'exemple plus bas, ce serait: `3AA5C34371567BD2`

    $ gpg --list-secret-keys --keyid-format=long
    /Users/hubot/.gnupg/secring.gpg
    ------------------------------------
    sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
    uid                          Hubot
    ssb   4096R/42B317FD4BA89E7A 2016-03-10

#### 1.3. Exécuter `gpg --armor --export <ID de la clé GPG>`
- Copier la clé à partir de `-----BEGIN PGP PUBLIC KEY BLOCK-----` jusqu'à `-----END PGP PUBLIC KEY BLOCK-----`. Il faut inclure ces deux blocs de text.
- Ajouter cette clé dans votre profil Github (https://github.com/settings/keys) dans New GPG key

#### 1.4. Définir git config: 
- Configurer nom complet: `git config --global user.name "<nom complet>"`
- Configurer adresse courriel: `git config --global user.email  <l'adresse courriel>`
- Configurer clé à être utilisée pour la signature des commits: `git config --global user.signingkey <ID de la clé GPG>`
- D'autres configurations peuvent être ajoutées en cas de besoin:
  - Configurer la signature des commits par défaut: `git config --global commit.gpgsign true`

#### 1.5. Pour les commits, il faut ajouter les options -S et -s pour les signer.
    $ git commit -S -s -m "your commit message"

- L'option `-s` ajoute le message `Signed-off-by:`
- L'option `-S` signe le commit. Elle est nécessaire seulement si vous n'avez pas configuré votre compte git pour signer tous les commits par défaut (commande `git config --global commit.gpgsign true` du point précédant).

Vous devez voir le message comme dans l'exemple:

    Signed-off-by: Random J Developer <random@developer.example.org>

Le `nom complet` et `l'adresse courriel` doivent être ceux configurés dans votre profil GitHub. La validation faite par le bot DCO va planter si ce n'est pas le cas.

*Quelques utilisateurs ont besoin de configurer une clé SSH pour pouvoir s'authentifier à git à partir du cli (utilisateurs ubuntu notamment) Suivre ces étapes si c'est votre cas.*
#### 3. Ajouter la clé SSH

#### 3.1. Terminal: Générer la clé SSH
ssh-keygen -t rsa -b 4096 -C "your_email@domain.com"

Sis le répertoire .ssh dans le home n'existe pas, il sera créé avec les fichiers liés à la clé générée id_rsa et id_rsa.pub

#### 3.2. Ajouter la clé publique au compte github
Ajouter cette clé dans votre profil Github (https://github.com/settings/keys) dans New SSH key
<Copier ici la clé publique celle qui se trouve dans le fichier id_rsa.pub>

#### 4. Troubleshoot
- Message d'erreur: 
```
gpg failed to sign the data
fatal: failed to write commit object
```
Exécuter commande `gpgconfig --kill gpg-agent` pour arrêter l'agent qui roule et ré-essayer de rouler la commande git commit.