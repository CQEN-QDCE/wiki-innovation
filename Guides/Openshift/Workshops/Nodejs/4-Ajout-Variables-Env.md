# Ajout des variables d'environnement aux applications

Vous avez maintenant la partie "frontend" (nodejs) et la base de données (mongodb) déployées dans Openshift, mais il n'existe pas encore de lien entre les deux composants.

## Configurer les variables d'environnement pour la base de données (BD)
Pour être capable d'accéder à la base de donné MongoDB, il faut initialiser quelques paramètres dont: le nom de la base de données, un utilisateur qui y aura accès ainsi qu'un mot de passe administrateur.

Dans l'étape 2 de cet atelier, le secret "mongodb-parameters", contenant ces paramètres de connexion à la BD ont été crées.

Ajouter les variables d'environnement avec le secret au déploiement de la BD:
- Obtenir le nom du déploiement
  ```bash
  oc get deployments
  ```
  résultat:
  ```bash
  NAME                 READY   UP-TO-DATE   AVAILABLE   AGE
    mongodb-26-centos7   1/1     1            1           1d
    nodejs-ex            1/1     1            1           1d
  ```
- Ajouter les variables au déploiement
  ```bash
  oc set env --from=secret/mongodb-parameters deploy/mongodb-26-centos7
  ```
  résultat:
  ```bash
  deployment.apps/mongodb-26-centos7 updated
  ```

## Création du secret de l'application
L'application nodejs-ex a besoin du paramètre "MONGO_URL" pour se connecter à la BD.
Pour créer le secret qui contiendra la valeur pour ce paramètre, il faut l'adresse IP du service de la BD.

Vérification de l'adresse IP du service:
```bash
oc get svc
```
résultat:
```bash
NAME                 TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)     AGE
mongodb-26-centos7   ClusterIP   172.30.245.220   <none>        27017/TCP   1d
nodejs-ex            ClusterIP   172.30.204.90    <none>        8080/TCP    1d
```
Créer le secret pour l'application nodejs-ex:
```bash
oc create secret generic nodejs-ex-parameters --from-literal=MONGO_URL=mongodb://admin:secret@172.30.245.220:27017/mongo_db
```
Ajouter la variable d'environnement au déploiement de nodejs-ex:
```bash
oc set env --from=secret/nodejs-ex-parameters deploy/nodejs-ex
```
résultat:
```bash
deployment.apps/nodejs-ex updated
```

[Table de matières](README.md)