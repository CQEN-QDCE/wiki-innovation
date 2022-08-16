# Ajout des variables d'environnement aux applications

Vous avez maintenant les trois composants déployés dans Openshift, frontend, backend et la base de données. Maintenant nous allons nous servir des variables d'environnement pour:
- Configurer les valeurs des paramètres de connexion à la base de données.
- Configurer les valeurs des paramètres de connexion du composant de backend à la base de données.

## Ajout des variables d'environnement au composant de la base de données avec l'outil client `oc`
Pour être capable d'accèder à la BD, il faut créer, entre autres, un utilisateur (nom d'utilisateur et son mot de pase), le mot de passe pour l'utilisateur administrateur et le nom de la base de données.

Dans l'étape [4](4-Creation-secret-bd.md) de cet atelier, le secret "kiosk-mongodb-parameters", contenant ces paramètres de connexion à la BD a été créé.

Lier le secret "kiosk-mongodb-parameters" au déploiement de la BD:
- Obtenir le nom du déploiement
  ```bash
  oc get deployments
  ```
  résultat:
  ```bash
  NAME            READY   UP-TO-DATE   AVAILABLE   AGE
  backend-app     1/1     1            1           3d17h
  frontend-app    1/1     1            1           3d17h
  mongodb-kiosk   1/1     1            1           2d19h
  ```
- Ajouter les variables au déploiement de la BD
  ```bash
  oc set env --from=secret/kiosk-mongodb-parameters deploy/mongodb-kiosk
  ```
  résultat:
  ```bash
  deployment.apps/mongodb-kiosk updated
  ```

## Ajout des variables d'environnement au composant du backend pour se connecter à la base de données avec l'outil client `odo`
Comme le composant du backend a été déployé avec l'outil client `odo`, nous allons ajouter les variables d'environnement de connexion à la base de données aussi avec l'outil client `odo`, pour que le composant puisse redémarrer dans Openshift.

Les paramètres utilisés dans le composant du backend sont:
|  Clé | Valeur  |
|---|---|
|  MONGODB_DBNAME | mongodb  |
|  MONGODB_URL | **format**: mongodb://[nomutilisateur:motdepasse@]host[:port][/[authdbdefaut]]. **Valeur**: mongodb://mongodb:mongodb@mongodb-kiosk:27017/mongodb  |

Allez au répertoire du backend et ajoutez les variables d'environnement:
* Pour aller du répertoire du frontend au backend par exemple, exécutez:
```bash
cd ../openshiftv4-odo-workshop-backend/
```
* Pour configurer les variables d'environnement:
```bash
odo config set --env MONGODB_DBNAME=mongodb --env MONGODB_URL=mongodb://mongodb:mongodb@mongodb-kiosk:27017/mongodb
```
Les variables d'environnement seront ajoutés au fichier devfile.yaml
résultat:
```bash
 ✓  Environment variables were successfully updated

Run `odo push` command to apply changes to the cluster
```
* Poussez les changements au cluster d'Openshift avec `odo push`:
```bash
odo push
```
Résultat:
```bash
Validation
 ✓  Validating the devfile [84763ns]

Creating Services for component backend
 ✓  Services are in sync with the cluster, no changes are required

Creating Kubernetes resources for component backend
 ✓  Waiting for component to start [6s]                                           
 ✓  Links are in sync with the cluster, no changes are required
 ✓  Waiting for component to start [9ms]

Applying URL changes
 ✓  URLs are synced with the cluster, no changes are required.

Syncing to component backend
 ✓  Checking file changes for pushing [521326ns]
 ✓  Syncing files to the component [305ms]

Executing devfile commands for component backend
 ✓  Executing install command "npm install" [5s]
 ✓  Executing run command "npm start" [1s]

Pushing devfile component "backend"
 ✓  Changes successfully pushed to component
```

[Table de matières](README.md)