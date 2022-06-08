# Meilleures pratiques de Github

## Principes Fondamentaux 

Selon la [Poly de Montréal](https://cours.polymtl.ca/inf1900/logiciel/qualiteCode/guides/BonnesPratiquesGit.pdf), les cinq principes fondamentaux d'usage de Github sont les suivants: 

1. **Faites des commits propres qui ne concernent qu'une seule chose**.    
Très souvent, on fait plusieurs changements de natures différentes dans une session de travail. Il ne faut pas les regrouper en un seul commit, mais plutôt répartir en plusieurs
commits distincts. On saura ainsi plus facilement ce qui a été fait, puisque la description associée à chaque commit sera simple (et ne concernera qu'une chose), et si on a besoin
de revenir en arrière, on pourra choisir de défaire le commit qui concerne le problème spécifique, plutôt que de tout défaire ce qu'on a fait dans la session de travail.
Cela vous aidera sur plusieurs points. Ceux-ci seront plus compréhensibles, ils contiendront peu de modifications, ce que vous aidera à revenir sur un point ou changer quelques fichiers, différement si l'on a un gros commit. Cela aidera aussi lors des merge et des pull requests - vous aurez moins de code à réviser et donc moins de conflits potentiels à gérer. 

2. **Pour chaque commit, écrivez une description concise qui décrit exactement les changements apportés**.  
Ce principe est très important et souvent négligé par le développeur trop pressé ou insouciant. Comment pensez-vous qu'on peut se retrouver en cas de problème si la 
description du commit est quelque chose comme "du ménage pour corriger les conneries de Paul"? Décrivez la fonctionnalité que vous avez créé, le bug que vous avez corrigé... 
à proscrire les descriptions génériques (correction de bogue, grande mise-à-jour de code, etc), ou des commentaires qui n'ont pas rapport avec les changements apportés.  
Il est suggéré d'écrire une description de la forme suivante: 

```
type: description du changement apporté
```

On pourrait adopter un système de types au début du message pour signifier imediatement le type de changement le fichier a subi. Par example:  
`[func]` Ajout d'une nouvelle fonctionnalité;  
`[edit]` Modification d'une fonctionnalité existente;  
`[del]` Suppréssion d'une fonctionnalité ou d'un fichier;  
`[fix]` Correction d'un bogue;  
`[refac]` Refactoring d'un code, amélioration du code sans changement de fonctionnalité;   
`[doc]` Ajout de documentation (commentaires y compris);  
`[style]` Modifications cosmetiques au code;  
`[misc]` lorsque la tâche ne correspond à aucune des types précédantes.   


3. **Faites des commits très frequemment**.  
Git est un excellent système de gestion des versions, profitez-en! N'attendez pas d'avoir écrit beaucoup de code avant de faire un commit. Dès que vous avez quelque chose qui fonctionne raisonnablement (mais pas nécessairement complètement), faites un commit. 
Décomposez votre session de travail en très petites étapes significatives, et faites un commit après chacune. Par exemple, chaque fois qu'on avance un peu dans le développement d'une fonctionnalité, on s'assure qu'un nouveau test passe, et on fait un commit.

4. **Ne modifiez pas l'historique des commits qui ont été publiés**.  
Ce principe vous évitera de gros maux de tête. Si vous changez l'historique des commits qui sont visibles par tous, vous risquez de causer des problèmes lorsqu'un développeur voudra faire une fusion avec son entrepôt local. Donc, pensez-y bien avant d'utiliser une commande qui change l'historique des commits (comme rebase), et si vous le faites, faites-le seulement sur une branche locale.

5. **Ne faites pas de commit d'un fichier qui est généré automatiquement**.  
Nous disposons aujourd'hui de beaucoup d'espace mémoire, mais il ne faut pas exagérer!
On veut conserver ce qui demande beaucoup d'effort à produire (le code tout particulièrement). Il n'y a absolument aucun intérêt à stocker un fichier qui est généré automatiquement par l'exécution d'un programme. Cela occupe inutilement de l'espace (surtout que ces fichiers sont parfois très gros).

## Autres principes et bonnes pratiques 

1. Tous les fichiers de code source doivent être encodés en utf-8. 
1. Corriger um fichier ou un bout de code qui ne respecte pas les conventions n'est jamais une perte de temps.
1. Ne faites pas de commit de fichiers d'environnement, comme `.env` ou `.envprod`. 
1. Si vous déplacez ou renommez un fichier, assurez-vous de faire un commit avant de recommencer à modifier ce fichier. 
1. Ne faites pas de commit d'un fichier de configuration.
1. Ne faites pas de commit d'un gros fichier binaire.
1. Soyez très prudent avec la commande reset, qui peut détruire des fichiers de manière definitive. 
1. Ne pushez pas directement vers la branche master: (webpick)
[Protect branches](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/defining-the-mergeability-of-pull-requests/about-protected-branches),
[Mergeability](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/defining-the-mergeability-of-pull-requests)
1. Ne pas commiter le code en tant qu'auteur non reconnu
1. Définissez les propriétaires de code pour des révisions de code plus rapides: [CodeOwners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)
1. Ne digulguez pas de secrets dans le contrôle de code source  
Tout ce que peut donner accès ou entraîner une authentification ou authorisation y est compris: mots de passe, clés secrètes, les clés d'API, les jetons privés, les clés SSH, etc. Il est recommendé d'utiliser un magasin externe sécurisé pour l'injection sécuritaire de secrets, tel que AWS Secrets Manager, Openshift Secrets, Github Secrets ou Hashicorp Vault. 
1. Ne pas commiter les dépendances dans le contrôle de code source 
1. Ne pas commiter les fichiers de configuration locaux dans le contrôle de code source.  
Ces fichiers de configuration privés contiennent souvent des secrets, des préférences personnelles, historiques ou des informations générales concernant votre environnement local qui ne doivent pas être divulgés.

## Les sept règles d'or d'un commit message réussi

1. Séparez le sujet du texte du message avec une ligne à blanc 
2. Limitez le sujet à 50 caractères 
3. Mettez en majuscule la ligne de sujet 
4. Ne terminez pas la ligne de sujet avec point 
5. Utilisez le mode impératif dans la ligne du sujet 
6. Gardez le corps du message à 72 caractères
7. Utilisez le corps pour expliquer quoi et pourquoi au lieu de comment

Voici un exemple de message de commit bien réussi: 

```
Summarize changes in around 50 characters or less

More detailed explanatory text, if necessary. Wrap it to about 72
characters or so. In some contexts, the first line is treated as the
subject of the commit and the rest of the text as the body. The
blank line separating the summary from the body is critical (unless
you omit the body entirely); various tools like `log`, `shortlog`
and `rebase` can get confused if you run the two together.

Explain the problem that this commit is solving. Focus on why you
are making this change as opposed to how (the code explains that).
Are there side effects or other unintuitive consequences of this
change? Here's the place to explain them.

Further paragraphs come after blank lines.

 - Bullet points are okay, too

 - Typically a hyphen or asterisk is used for the bullet, preceded
   by a single space, with blank lines in between, but conventions
   vary here

If you use an issue tracker, put references to them at the bottom,
like this:

Resolves: #123
See also: #456, #789
```

# Branching models 

## Git Flow

Git Flow est un ... 


![Git Flow](./images/GitFlow.png)


**Références**   
[A successful Git branching model](https://nvie.com/posts/a-successful-git-branching-model/) Article seminal sur git-flow, par Vicent Driessen  

[HubFlow: GitFlow For GitHub](https://datasift.github.io/gitflow/index.html) git-flow usage case  



## Github Flow

La façon dont l'équipe chez Github fait la gestion de leur flow interne est l'utilisation de `Github Flow`. 

En fait, ils travaillent avec un environnement de déploiement en continu où il n'y a pas le concept de `« release »` car chaque fois qu'ils finissent de préparer une nouvelle fonctionnalité, ils poussent en direct immédiatement (après toute la chaîne d'automatisation créée dans l'environnement). C'est le moyen le plus complet et le plus direct de gérer le flux d'applications Web ou de projets qui ne traitent pas exactement avec le concept de versions.

Les applications Web sont généralement livrées en continu, et vous n'avez pas à prendre en charge plusieurs versions du logiciel déploiées. 

Les concepts principaux de Github Flow sont: 

- Tout ce qui se trouve dans la branche `master` est déployable 
- Pour travailler sur quelque chose de nouveau, créez une branche nommée de manière descriptive hors de `master` (par example: `new-oauth2-scopes`) 
- Commitez(`commit`) dans cette branche localement et poussez (`push`) régulièrement votre travail vers la même branche nommée sur le serveur 
- Lorsque vous avez besoin de commentaires ou d'aide, ou que vous pensez que la branche est prête pour la fusion (`merge`), ouvrez une `pull request`
- Une fois que quelqu'un d'autre a examiné et approuvé la fonctionnalité, vous pouvez la fusionner (`merge`) dans `master` 
- Une fois qu'il est fusionné (`merge`) et poussé(`push`) à `master`, vous pouvez et devez déployer immédiatement.

Ceci est le flux complèt. 


It is very simple, very effective and works for fairly large teams - GitHub is 35 employees now, maybe 15-20 of whom work on the same project (github.com) at the same time.

I think that most development teams - groups that work on the same logical code at the same time which could produce conflicts - are around this size or smaller. Especially those that are progressive enough to be doing rapid and consistent deployments.

![Github Flow](./images/GithubFlow.png)

**Références**  
[Github Flow Page](https://githubflow.github.io/) La page principale de Github Flow   
[Github Flow Quickstart](https://docs.github.com/en/get-started/quickstart/github-flow) La page de démarrage rápide pour utilisation de Github Flow



# Diverses 



# Références

[Git, les bonnes pratiques](https://medium.com/@pilloud.anthony/git-les-bonnes-pratiques-b0f19c3eef47), par Anthony Pilloud. 

[How to Write a Git Commit Message](https://cbea.ms/git-commit/), par CBEAMS

