# Openshift Workshop: Déploiement d'une application à trois couches (frontend, backend et base de données) avec l'outil client de développement ODO

Cet atelier propose le déploiement d'une application à trois couches en utilisant l'outil client pour développeur d'Openshift: odo.

L'application est un kiosque de concession qui a trois composants: 
- frontend (nodejs): Placement de la commande de l'utilisateur, 
- backend (nodejs): Gestion de la sauvegarde de la commande et la génération d'un numéro de commande.
- une base de données (mongodb) où la commande sera sauvegardée.

Il est tiré des instructions détaillées dans l'atelier [openshiftv4-odo-workshop](https://github.com/RedHatWorkshops/openshiftv4-odo-workshop) de Red Hat.

## Prérequis
- Accès à la console web d'Openshift
- Outil client oc installé dans le poste de travail ([voir](../../Outils/OC/README.md#installation-de-openshift-cli-oc)).
- Outils client odo installé dans le poste de travail ([voir](../../Outils/ODO/README.md#installation-de-loutil-client-odo)).

## Table de matières
- Lab 1. [Déploiement du composant "backend" (nodejs)](1-Creation-backend-nodejs.md)
- Lab 2. [Déploiement du composant "frontend" (nodejs)](2-Creation-frontend-nodejs.md)
- Lab 3. [Lier les composants frontend et backend](3-Lier-frontend-backend.md)
- Lab 4. [Création du secret pour les paramètres de la base de données](4-Creation-secret-bd.md)
- Lab 5. [Déploiement du composant de la base de données (mongodb)](5-Ajout-du-service-mongodb.md)
- Lab 6. [Ajout des variables d'environnement aux composants de backend et de la base de données](6-Ajout-Variables-Env.md)
- Lab 7. [Tester l'ensemble](7-Tester-LEnsemble.md)
- Lab 8. [Nettoyage - effacer les ressources créées avec l'outil client oc](../../Outils/OC/README.md#nettoyage-effacer-les-ressources-créées)
- Lab 9. [Nettoyage - effacer les ressources créées avec l'outil client odo](../../Outils/ODO/README.md#effacer-tout)

