# Ajouter le service de base de données - mongodb

Dans les étapes précédentes, vous avez:
- Déployé le composant du frontend
- Déployé le composant du backend
- Lié les composants frontend et backend
- Testé l'ensemble

Dans cette section, vous allez ajouter le service de base de données - MongoDB pour compléter l'ensemble. 
Vous allez créer le service avec la commande oc new-app en lui spécifiant une image MongoDB contenue dans DockerHub:

```bash
oc new-app quay.io/centos7/mongodb-36-centos7 --name mongodb-kiosk -l 'app.kubernetes.io/part-of=app,app.kubernetes.io/name=mongodb'
```
exemple de résultat:
```bash
--> Found container image dc18f52 (14 months old) from quay.io for "quay.io/centos7/mongodb-36-centos7"

    MongoDB 3.6 
    ----------- 
    MongoDB (from humongous) is a free and open-source cross-platform document-oriented database program. Classified as a NoSQL database program, MongoDB uses JSON-like documents with schemas. This container image contains programs to run mongod server.

    Tags: database, mongodb, rh-mongodb36

    * An image stream tag will be created as "mongodb-kiosk:latest" that will track this image

--> Creating resources with label app.kubernetes.io/name=mongodb,app.kubernetes.io/part-of=app ...
    imagestream.image.openshift.io "mongodb-kiosk" created
    deployment.apps "mongodb-kiosk" created
    service "mongodb-kiosk" created
--> Success
    Application is not exposed. You can expose services to the outside world by executing one or more of the commands below:
     'oc expose service/mongodb-kiosk' 
    Run 'oc status' to view your app.
```

Pour vérifier le déploiement de la base de données, utilisez la commande "oc status".
```bash
oc status      
```
Vous allez voir un résultat similaire:

```bash
In project ws2-kiosk on server https://api.exp.openshift.cqen.ca:6443

http://https-8080-4aa3073a-ws2-kiosk.apps.exp.openshift.cqen.ca to pod port 8080 (svc/backend-app)
  deployment/backend-app deploys registry.access.redhat.com/ubi8/nodejs-16:latest
    deployment #18 running for 3 weeks - 1 pod
    deployment #17 deployed 3 weeks ago
    deployment #16 deployed 3 weeks ago
    deployment #15 deployed 3 weeks ago
    deployment #14 deployed 3 weeks ago
    deployment #13 deployed 3 weeks ago
    deployment #12 deployed 3 weeks ago
    deployment #11 deployed 4 weeks ago
    deployment #10 deployed 4 weeks ago
    deployment #8 deployed 4 weeks ago
    deployment #7 deployed 4 weeks ago

https://https-8080-536407d2-ws2-kiosk.apps.exp.openshift.cqen.ca to pod port 8080 (svc/frontend-app)
  deployment/frontend-app deploys registry.access.redhat.com/ubi8/nodejs-16:latest
    deployment #4 running for 4 weeks - 1 pod
    deployment #3 deployed 4 weeks ago
    deployment #2 deployed 4 weeks ago
    deployment #1 deployed 4 weeks ago

svc/mongodb-kiosk - 172.30.133.181:27017
  deployment/mongodb-kiosk deploys istag/mongodb-kiosk:latest 
    deployment #5 running for 3 weeks - 1 pod
    deployment #4 deployed 3 weeks ago
    deployment #3 deployed 3 weeks ago
    deployment #1 deployed 3 weeks ago

3 infos identified, use 'oc status --suggest' to see details.
```

[Table de matières](README.md)