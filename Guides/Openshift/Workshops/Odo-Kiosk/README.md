# Openshift Workshop: Déploiement d'une application à trois couches (frontend, backend et base de données) avec l'outil client de développement ODO

Cet atelier propose le déploiement d'une application à trois couches en utilisant l'outil client pour développeur d'Openshift: odo.

L'application est un kiosque de concession qui a trois composants: 
- frontend (nodejs): Placement de la commande de l'utilisateur, 
- backend (nodejs): Gestion de la sauvegarde de la commande et la génération d'un numéro de commande.
- une base de données (mongodb) où la commande sera sauvegardée.

On s'inspire des instructions détaillées dans l'atelier "openshiftv4-odo-workshop" de Red Hat [voir](https://github.com/RedHatWorkshops/openshiftv4-odo-workshop)

## Prérequis
- Accès à la console web d'Openshift
- Outils client oc et odo installé dans le poste de travail (Lab 0 et 1), pour les Labs 2 et plus.

## Table de matières
- Lab 0. [Installation de l'outil client oc](../../Outils/OC/README.md#installation-de-openshift-cli-oc)
- Lab 1. [Installation de l'outil client odo](../../Outils/ODO/README.md#installation-de-loutil-client-odo)
- Lab 2. [Déploiement du composant "backend" (nodejs)](3-Creation-backend-nodejs.md)
- Lab 3. [Déploiement du composant "frontend" (nodejs)](4-Creation-frontend-nodejs.md)
- Lab 4. Lier les composants frontend et backend
- Lab 4. Déploiement du service de base de données (mongodb)

- Lab 2. [Création du secret pour les paramètres de la base de données](2-Creation-Secret-BD.md)
- Lab 3. [Ajouter le service de base de données - mongodb](3-Ajout-du-Service-MongoDB.md)
- Lab 4. [Ajout des variables d'environnement aux applications](4-Ajout-Variables-Env.md)
- Lab 4. [Tester l'ensemble](5-Tester-LEnsemble.md)
- Lab 5. [Nettoyage - effacer les ressources créées](../../Outils/OC/README.md#nettoyage-effacer-les-ressources-créées)

