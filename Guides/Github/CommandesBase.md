[![img](https://img.shields.io/badge/Lifecycle-Experimental-339999)](https://www.quebec.ca/gouv/politiques-orientations/vitrine-numeriqc/accompagnement-des-organismes-publics/demarche-conception-services-numeriques)
[![License](https://img.shields.io/badge/Licence-LiLiQ--R-blue)](LICENSE_FR)

---

# Commandes Git de base pour tout développeur

## Git pull 
Fetch from and integrate with another repository or a local branch.

## Git fetch
Download objects and refs from another repository.

Récuperer les dernières informations du serveur git 

```bash
$ git fetch <nom-du-remote>
```

## Git rebase 
Reapply commits on top of another base tip.

## Git checkout 
Switch branches or restore working tree files.
Changement de branche 

```bash 
$ git checkout <nom de la branche> 
```

## Git add 
Add file contents to the index.

## Git commit 
Record changes to the repository.

## Git reset 
Reset current HEAD to the specified state.

## Git push 
Update remote refs along with associated objects.

## Git status 
Show the working tree status.

## Git merge 
Join two or more development histories together.

## Git history 

Afficher l'arbre des modifications 

```bash
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
$ git branch <nom nouvelle branche>
```

Renomer une branche 

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

## Création d'un repositoire github 

- Crééz un répertoire pour le projet 
- Allez au nouveau répertoire 
- Saisisez `git init` 
- Écrivez du code 
- Saisisez `git add` pour ajouter du code au projet 
- Saisissez `git commit` pour faire un commit à votre repo local. 

- Allez à github 
- Cliquez sur `new repository`, et ensuite `Create repository`

- Maintenant, on va pusher le repo 
- Saisissez les commandes suivantes: 

```bash
# $ git remote add origin git@github.com:username/new_repo
$ git remote add https://github.com/username/new_repo 
$ git push -u origin master
```

## Corriger une branche qui est derrière la branche master 

Admetons que maintenait vous êtes dans votre branche `maBranche`. 

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

Ensuite poussez les changements: 

```
$ git push origin maBranche
```

## Références 

- [Page man de git](https://git.github.io/htmldocs/git.html)

- [Git guide Start a new git repository ](https://kbroman.org/github_tutorial/pages/init.html)