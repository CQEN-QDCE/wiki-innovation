---
Titre: Décision (MADR)
sous-titre: Gestion des accès dans Github   
Auteur: Centre d'expertise appliquée en innovation
Date: 2023-01-30
Statut: Accepté
---
# Sécurisation et gestion des accès aux projets et répertoires Github pour l'équipe et les contributeurs externes

## Contexte
Nous avons besoin d'un moyen pour gérer les accès de tous les collaborateurs externes aux différents projets et répertoires de notre organisation Github, car ceux-ci ne peuvent pas être ajoutés à des groupes comme les membres de l'organisation

## Options
1. Convertir les collaborateurs externes en membres de l'organisation afin de pouvoir utiliser les paramètres de sécurité de Github et mieux gérer les accès.

2. Utiliser un outil tiers pour gérer les accès à Github. Cette option supplémentaire d'utiliser un outil de gestion des accès, tel que github-ldap-authentication, Authelia,  ou git-access-manager, pour gérer les accès des collaborateurs externes. Ces outils offrent des fonctionnalités de gestion des accès granulaires, telles que la gestion des groupes et des rôles, qui peuvent être utilisées pour gérer les accès aux différents projets et répertoires de l'organisation Github

3. Gérer manuellement les accès en utilisant les fonctionnalités de Github.

4. Mise en place d'une politique d'accès : Une autre option est de mettre en place une politique d'accès claire pour les collaborateurs externes, en définissant les règles et les autorisations spécifiques pour chaque projet et répertoire. Cette politique peut être communiquée aux collaborateurs externes pour leur donner des informations sur les règles de sécurité en place.

5. Audit et suivi réguliers des accès : Quelle que soit l'option choisie, il est important de mettre en place un système d'audit et de suivi régulier des accès aux différents projets et répertoires de notre organisation Github. Cela permet de détecter rapidement les problèmes de sécurité potentiels et de prendre les mesures nécessaires pour les résoudre.

## Décision
Nous avons choisi l'option 1: Convertir les collaborateurs externes en membres.  Cela nous permettra d'utiliser les groupes pour définir des règles de sécurité granulaires pour chaque projets. Nous pourrons ainsi donner aux utilisateurs uniquement les permissions dont ils ont besoin pour travailler sur les projets qui les concernent.

### Conséquences
1. La permission de base des membres de l'organisation doit être réduite à "none".

2. Tous les collaborateurs externes doivent être convertis en membres de l'organisation.

3. Tous les membre de l'équipe innovation doivent être owner de l'organisation.

4. Des groupes (lecture, écriture, maintainer) doivent être créés pour tout les dépôts ou groupe de dépôts devant être accédés par des membres que ne font pas partie de l'équipe.

5. Le script de création de dépôt doit être mis à jour pour créer ces groupes.

6. Les collaborateurs externes doivent être avertis du changement.