---
Titre: Décision (MADR)
sous-titre: Gestion des accès dans Github   
Auteur: Centre d'expertise appliquée en innovation
Date: 2023-01-30
Statut: Accepté
---
# Sécurisation et gestion des accès aux projets et répertoires Github pour l'équipe et les contributeurs externes

## Contexte
Nous avons besoin d'un moyen pour gérer les accès de tous les collaborateurs externes aux différents projets et répertoires de notre organisation Github.

## Options
1. Trouver une manière éfficace pour convertir les collaborateurs externes en membres de l'organisation afin de pouvoir utiliser les paramètres de sécurité de Github et mieux gérer les accès.

2. Utiliser un outil tiers pour gérer les accès à Github. Cette option supplémentaire d'utiliser un outil de gestion des accès, tel que github-ldap-authentication, Authelia,  ou git-access-manager, pour gérer les accès des collaborateurs externes. Ces outils offrent des fonctionnalités de gestion des accès granulaires, telles que la gestion des groupes et des rôles, qui peuvent être utilisées pour gérer les accès aux différents projets et répertoires de l'organisation Github

3. Gérer manuellement les accès en utilisant les fonctionnalités de Github.

4. Mise en place d'une politique d'accès : Une autre option est de mettre en place une politique d'accès claire pour les collaborateurs externes, en définissant les règles et les autorisations spécifiques pour chaque projet et répertoire. Cette politique peut être communiquée aux collaborateurs externes pour leur donner des informations sur les règles de sécurité en place.

5. Audit et suivi réguliers des accès : Quelle que soit l'option choisie, il est important de mettre en place un système d'audit et de suivi régulier des accès aux différents projets et répertoires de notre organisation Github. Cela permet de détecter rapidement les problèmes de sécurité potentiels et de prendre les mesures nécessaires pour les résoudre.

## Décision
Nous avons décidé d'utiliser les paramètres de sécurité de Github pour gérer les accès. Cela nous permettra de définir des règles de sécurité granulaires pour chaque projet et répertoire. Nous pourrons ainsi donner aux utilisateurs uniquement les permissions dont ils ont besoin pour travailler sur les projets qui les concernent.

## Conséquences
1. En utilisant les paramètres de sécurité de Github, nous allons limiter l'accès des collaborateurs externes uniquement aux projets et répertoires qui les concernent. Cela peut réduire les risques de violation de sécurité et protéger les données sensibles de notre organisation Github s'il y a lieu.

2. Le fait de donner aux collaborateurs externes uniquement les permissions dont ils ont besoin pour travailler sur les projets qui les concernent peut faciliter la collaboration entre les équipes internes et externes en évitant les conflits d'accès inutiles.

3. Amélioration de la productivité : En utilisant les paramètres de sécurité de Github, nous pourrions automatiser la gestion des autorisations des collaborateurs externes. Cela peut réduire la charge de travail administrative pour notre équipe, ce qui peut améliorer notre productivité globale.