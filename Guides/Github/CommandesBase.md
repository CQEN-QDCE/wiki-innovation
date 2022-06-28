<!-- ENTETE -->
[![img](https://img.shields.io/badge/Lifecycle-Experimental-339999)](https://www.quebec.ca/gouv/politiques-orientations/vitrine-numeriqc/accompagnement-des-organismes-publics/demarche-conception-services-numeriques)
[![License](https://img.shields.io/badge/Licence-LiLiQ--R-blue)](LICENSE_FR)

---

<div>
    <img src="./images/mcn.png">
</div>
<!-- FIN ENTETE -->

# Commandes Git de base pour tout développeur

## Configurez git 

Si vous n'avez jamais utilisé git auparavant, vous avez besoin de faire quelques configurations tout d'abord. 

Exécutez les commandes suivantes, pour que git connaisse votre nom et courriel. 

```sh
git config --global user.name "Votre nom "
git config --global user.email "vous@email.com"
```

Configurez les préférences de fin de ligne: 

```sh 
# Pour usagers de Mac/Unix
git config --global core.autocrlf input
git config --global core.safecrlf true

# Pour usagers de Windows
git config --global core.autocrlf true
git config --global core.safecrlf true
```

## Git pull 
Fetch from and integrate with another repository or a local branch.

Git pull permet de récupérer tous les changements sur la branche distant.

Elle prend en paramètre la branche source et la branche ciblé.

Exemple:
La commande  `git pull wpk preprod:master`  nous permet de récupérer les changements de la branche `preprod` du remote `wpk` dans la branche `master` du remote `origin`.

## Git fetch
Download objects and refs from another repository.

Récupérer les dernières informations du serveur git 

```bash
$ git fetch <nom-du-remote>
```

Git fetch permet de rechercher et afficher les changements sur un remote passé en argument, qui ne sont pas présent en local, sans aucun transfert de fichiers.

Exemple: 
La commande  `git fetch wpk`  permet de chercher les nouveaux changements sur le remote `wpk` qui ne sont pas présents en `local`.

## Git rebase 
Reapply commits on top of another base tip.

Git rebase permet de transférer les changements d’une branche à une autre, elle prend en argument la branche avec laquelle nous voulons rebaser.

Exemple:
La commande  `git rebase -i wpk/preprod`  permet de rebaser les commits de notre branche courante avec la branche `preprod` de remote `wpk`.

## Git checkout 
Switch branches or restore working tree files.
Changement de branche 

```bash 
$ git checkout <nom de la branche> 
```

Git checkout permet de déplacer d’une branche à une autre, elle prend en argument la branche cible et aussi de supprimer les modifications qui ne sont pas ajoutées.

Exemples:
```sh
$ git checkout branch-A         # nous permet de nous déplacer vers la branche branch-A s’elle existe
$ git checkout -b branch-B      # nous permet de créer et déplacer vers la branche branch-B s’elle n’existe pas déjà
$ git checkout path/file.php    # permet de supprimer tous les changements non ajoutés (unstaged) sur le fichier path/file.php
$ git checkout .                # permet de supprimer tous les changements non ajoutés (unstaged) sur tous les fichiers
```

## Git add 
Add file contents to the index.

Git add permet d’ajouter les changements que nous avons fait dans nos fichiers sur la branche courante.

Exemples:
```sh
 git add .     # permet d’ajouter tous les changements que nous avons fait
 git add -u    # permet d’ajouter les modifications sur les fichiers déjà connus par git (les nouveaux fichiers ne seront pas ajoutés)
```

## Git commit 
Record changes to the repository.

Git commit permet commiter les modifications que nous avons en local sur la branche courante.

Exemples:
```sh
$ git commit -m “Message de commit”    # permet de commiter les changements sur la branche courante, avec un message “Message de commit”
$ git commit –amend                    # permet de commiter les nouveaux changements sur la branche courante dans la dernière commit que nous avons créé sur la branche
```

## Git reset 
Reset current HEAD to the specified state.

Git reset permet de supprimer tous les changements que nous avons faits sur la branche courante.

Exemples:
```sh 
$ git reset –hard HEAD    # permet de retourner vers la version que nous avons sur la branche master.
$ git commit –amend       # permet de commiter les nouveaux changements sur la branche courante dans la dernière commit que nous avons créé sur la branche.
```

## Git push 
Update remote refs along with associated objects.

Git push permet d’envoyer les modifications sur un remote.

Exemples:
```sh
$ git push origin branch-A    # permet d’envoyer les modifications que nous avons faites sur la branche branch-A vers notre repos origin.
```

## Git status 
Show the working tree status.

```sh
$ git status    # permet d’afficher toutes les modifications non commités sur la branche courante.
```

## Git merge 
Join two or more development histories together.

## Git history 

Afficher l'arbre des modifications 

```sh
$ git hist 
``` 


## Git branch 
Information sur les branches locales 

```bash 
$ git branch
```

Information sur les branches de tous les remotes 

```bash
$ git branch -r
```

Création d'une nouvelle branche 

```bash 
$ git branch <nom de la nouvelle branche>
```

Renommer une branche 

```bash 
$ git branch -m <nom actuel> <nouveau nom de la branche>
```

# Workflows 

## Identifiez-vous à git

Lors de vos commits, il est obligatoire de faire la soumission signée par vous(`signoff`), aux fins de validation auprès de la plateforme. Alors, il faut vous identifier dans la configuration de `git` pour que le signoff soit généré correctement. 

D'abord, identifiez-vous en ajoutant votre nom et votre courriel à la configuration de git: 

```
$ git config --global user.name "Votre nom"
$ git config --global user.email "votre@adresseemail.com"
``` 

Ensuite, lors de vos commits, utilisez la flag `-s` ou `--signoff` pour signer votre commit. 

``` 
$ git commit -m "[tag] votre message" --signoff
```

## Création d'un répositoire github 

- Créez un répertoire pour le projet 
- Allez au nouveau répertoire 
- Saisissez `git init` 
- Écrivez du code 
- Saisissez `git add` pour ajouter du code au projet 
- Saisissez `git commit` pour faire un commit à votre repo local. 
- Saisissez `git branch -M master` pour créer la branche principale. 
- Allez sur github
- Cliquez sur `new repository`, et ensuite `Create repository`


Maintenant, on va pusher le repo. Saisissez les commandes suivantes: 

```bash
# $ git remote add origin git@github.com:username/new_repo
$ git remote add origin https://github.com/username/new_repo 
$ git push -u origin master
```

## Corriger une branche qui est derrière la branche master 

Admettons que maintenait vous êtes dans votre branche `maBranche`. 

Faites le suivant: 

```
$ git status
```
Si les changements ne sont pas commités, faites-le d'abord: 

```
$ git add .
$ git commit -m"commit changes"
```

Ensuite, faites un `pull` du contenu du `master`:

```
$ git pull origin master
```

Vérifiez s'il y a des conflits qui résultent de ce `pull`, corrigez-les et commitez-les: 

```
$ git add .
$ git commit -m"resolved conflicts message"
```

Ensuite, poussez les changements: 

```
$ git push origin maBranche
```

## Références 

- [Page man de git](https://git.github.io/htmldocs/git.html)

- [Git guide Start a new git repository ](https://kbroman.org/github_tutorial/pages/init.html)