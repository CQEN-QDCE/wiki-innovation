---
Titre: Décision (MADR)
sous-titre: Gestion des accès dans Github   
Auteur: Centre d'expertise appliquée en innovation
Date: 2023-01-30
Statut: Accepté
---
# Sécurisation et gestion des accès aux projets et répertoires Github pour l'équipe et les contributeurs externes

## Contexte
Nous avons besoin d'un moyen pour gérer les accès de tous les utilisateurs aux différents projets et répertoires de notre organisation Github.

## Options
1. Utiliser les paramètres de sécurité de Github pour gérer les accès.

    Github propose trois types d'usagers dans une organisation dont: Owner, Member  et Outside Collaborator.

    ### Propritétaire (Owner)
    - Contrôle total de l'organisation
    - Ajoute les nouveaux usagers
    - Qui devrait être owner? Toute l'équipe innovation ou des admins nommés?

    ### Membres (members)
    - Seuls les employés du CQEN (l'organisation s'appelle CQEN) devrait être des membres?
    - En ce moment la permission de base des membres sur tous les dépôt est write. Devrait-elle être changée pour read?
    - Configurer les permissions par défaut des membres: https://github.com/organizations/CQEN-QDCE/settings/member_privileges

    ### Collaborateurs externes (Outside Collaborator)
    - Les collaborateurs externes doivent être associés manuellement à un dépôt avec un role précis.
    - Ils peuvent tenir n'importe quel rôle sur un dépôt si le propriétaire du dépôt lui assigne.
    - Ils ont souvent des noms bizarres et il est difficile de savoir qui est qui après un boût de temps. Peut-on exiger les "vrais noms" à nos collaborateurs?

    ### Équipes
    - Innovation
    - Intelligence Artificielle
    - RoC (Rest of CQEN) ?
    - Projets
    - CEAI Documentation privée


2. Utiliser un outil tiers pour gérer les accès à Github.
3. Gérer manuellement les accès en utilisant les fonctionnalités de Github.

## Décision
Nous avons décidé d'utiliser les paramètres de sécurité de Github pour gérer les accès. Cela nous permettra de définir des règles de sécurité granulaires pour chaque projet et répertoire. Nous pourrons ainsi donner aux utilisateurs uniquement les permissions dont ils ont besoin pour travailler sur les projets qui les concernent.

## Conséquences
En utilisant les paramètres de sécurité de Github, nous aurons un contrôle plus fin sur les accès de chaque membre de l'équipe. Nous pourrons également définir des règles de sécurité pour les contributeurs externes et les membres temporaires de l'équipe. Cependant, cela nécessitera une configuration initiale et un suivi régulier pour s'assurer que les règles de sécurité sont respectées.
