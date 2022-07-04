# Ajouter le service de base de données - mongodb

Dans les étapes précédentes, vous avez créé l'application web et testé l'accès à sa page web.
Si vous observez la page web, vous allez voir la section "Request information" avec un champ "Page view count" que pour le moment affiche le message: "No database configured" (il n'y a pas de base de données configurée). 

![ocp-nodejs-deploye-page-compteur-vues](images/ocp-deployed-nodejs-ui-page-view-count.png)

On va régler cela en ajoutant un service de base de données - MongoDB. On va créer le service avec la commande "oc new-app" et à partir de l'image dans DockerHub:

```bash
oc new-app centos/mongodb-26-centos7 \
      -e MONGODB_USER=admin \
  -e MONGODB_DATABASE=mongo_db \
  -e MONGODB_PASSWORD=secret \
  -e MONGODB_ADMIN_PASSWORD=super-secret
```

L'option "-e" de la commande configure les variables d'environnement qu'on veut utiliser pour notre application.

Pour vérifier le déploiement de la base de données, utilisez la commande "oc status".
```bash
oc status      
```
Vous allez voir un résultat similaire:

```bash
In project ws1-nodejs on server https://api.exp.openshift.cqen.ca:6443

svc/mongodb-26-centos7 - 172.30.245.220:27017
  deployment/mongodb-26-centos7 deploys istag/mongodb-26-centos7:latest 
    deployment #2 running for 3 minutes - 1 pod
    deployment #1 deployed 3 minutes ago

https://nodejs-ex-ws1-nodejs.apps.exp.openshift.cqen.ca to pod port 8080-tcp (svc/nodejs-ex)
  deployment/nodejs-ex deploys istag/nodejs-ex:latest <-
    bc/nodejs-ex source builds https://github.com/sclorg/nodejs-ex on openshift/nodejs:16-ubi8 
    deployment #2 running for 2 days - 1 pod
    deployment #1 deployed 2 days ago
```

**Configurer les variables d'environnement**
Pour vérifier les variables d'environnement de tous les pods, utilisez la commande "oc set env pods --all --list".

Pour la base de données, vous allez voir un résultat similaire à:
```bash
# pods/mongodb-26-centos7-7677cf4d75-mzflw, container mongodb-26-centos7
MONGODB_ADMIN_PASSWORD=super-secret
MONGODB_DATABASE=mongo_db
MONGODB_PASSWORD=secret
MONGODB_USER=admin
```

On a besoin d'ajouter la variable d'environnement "MONGODB_URL" à notre application web pour qu'elle puisse se connecter à la base de données MongoDB, et habiliter la section "Page view count" de la page web.

On utilise la commande "oc set env ..."

```bash
oc set env deployment/nodejs-ex MONGO_URL='mongodb://admin:secret@172.30.245.220:27017/mongo_db'
```

Pour vérifier qu'un nouveau déploiement a été déclanché, utilisez la commande "oc status":

```bash
oc status
```
résultat:
```bash
In project ws1-nodejs on server https://api.exp.openshift.cqen.ca:6443

svc/mongodb-26-centos7 - 172.30.245.220:27017
  deployment/mongodb-26-centos7 deploys istag/mongodb-26-centos7:latest 
    deployment #2 running for 4 hours - 1 pod
    deployment #1 deployed 4 hours ago

https://nodejs-ex-ws1-nodejs.apps.exp.openshift.cqen.ca to pod port 8080-tcp (svc/nodejs-ex)
  deployment/nodejs-ex deploys istag/nodejs-ex:latest <-
    bc/nodejs-ex source builds https://github.com/sclorg/nodejs-ex on openshift/nodejs:16-ubi8 
    deployment #3 running for 3 minutes - 1 pod
    deployment #2 deployed 2 days ago
    deployment #1 deployed 2 days ago
```
On constate qu'il y a un déploiement #3 qui a roulé récemment.

Vous avez maintenant la partie "frontend" (nodejs) et la base de données déployées et opérationnel dans Openshift.

**Vérification du changement de la section "Request information" dans la page web**
Si vous rafraichissez la page web de l'application dans le navigateur, ou si vous accédez avec le lien dans la route (dans la console web, "Project" -> "Route"), vous allez voir que la section "Request information" montre maintenant certaines informations relatives à la base de données:

![ocp-nodejs-ui-avec-base-de-donnees](images/ocp-deployed-nodejs-ui-page-view-count-with-db-cropped.png)

On peut observer ici:
- Que le compteur de visites à la page indique le nombre de visites (1 dans ce cas-ci).
- Qu'il y a une section "DB Connection Info" qui montre les information de la base de données MongoDB.

[Table de matières](README.md)