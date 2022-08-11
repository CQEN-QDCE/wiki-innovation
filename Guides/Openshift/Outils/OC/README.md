# Openshift CLI (oc)

Openshift CLI (oc) est l'outil CLI le plus utilisé pour les utilisateurs de la plateforme conteneurisée d'Openshift (OCP). Il permet aux administrateurs et développeurs du cluster d'effectuer des opérations de bout en bout dans Openshift à partir d'un terminal.

Le binaire *oc* offre les mêmes capacités que le binaire *kubectl*, mais il a été enrichi pour supporter les caractéristiques propres de l'OCP comme:
- Les fichiers de configuration des ressources: DeploymentConfig, BuildConfig, Routes, ImageStream et ImageStramTags.
- L'authentification avec login
- Commandes additionnelles: new-project, new-app, etc. 

Avec la commande oc, vous pouvez créer des applications et gérer les projets dans la plateforme conteneurisée d'Openshift.

## Table de contenu
  - [Installation de Openshift CLI (oc)](#installation-de-openshift-cli-oc)
  - [Se connecter au cluster d'Openshift](#se-connecter-au-cluster-dopenshift)
  - [Accéder à votre projet de travail](#accéder-à-votre-projet-de-travail)
  - [Utilisation des secrets](#utilisation-des-secrets)
    - [Création d'un secret générique](#création-dun-secret-générique)
  - [Variables d'environnement](#variables-denvironnement)
    - [Vérifier la liste des variables d'environnement](#vérifier-la-liste-des-variables-denvironnement)
    - [Création d'une variable d'environnement](#création-dune-variable-denvironnement)
  - [Autres commandes](#autres-commandes)
  - [Nettoyage (effacer les ressources créées)](#nettoyage-effacer-les-ressources-créées)
  - [Se déconnecter du cluster Openshift CLI](#se-déconnecter-du-cluster-openshift-cli)
  - [Références](#références)

## Installation de Openshift CLI (oc)
Vous pouvez obtenir l'exécutable `oc` à partir du [lien](https://downloads-openshift-console.apps.exp.openshift.cqen.ca/)

**Ubuntu**
- Extraire le fichier:
  ```bash
  tar xvzf <file>
  ```
- Copier le fichier oc dans un répertoire de votre variable d'environnement $PATH (par exemple: /usr/local/bin):
  ```bash
  echo $PATH
  ```
  Pour déplacer le fichier utiliser la commande `cp <src> <dest>` (copier) ou `mv <src> <dest>` (déplacer). Par exemple pour copier:
  ```bash
  cp odo /usr/local/bin/
  ```
- Après l'installation vous pouvez commencer à exécuter les commandes oc:
  ```bash
  oc <command>
  ```

## Se connecter au cluster d'Openshift
Pour ouvrir une session au cluster, obtenir le jeton avec un [appel HTTP](https://oauth-openshift.apps.exp.openshift.cqen.ca/oauth/token/request
)
La réponse à la requête dans le navigateur web va vous indiquer la commande pour ouvrir une session, par exemple:
```bash
oc login --token=<token-dans-la-response> --server=https://api.exp.openshift.cqen.ca:6443
```
Un message va s'afficher pour montrer qu'on a bien ouvert une session avec succès dans le cluster

## Accéder à votre projet de travail
La commande "oc get projects" vous montrera la liste des projets auxquels vous avez accès:
```bash
oc get projects
NAME    DISPLAY NAME            STATUS
...
```
Vous pouvez sélectionner le projet en cours avec la commande "oc project <projectname>"
```bash
oc project <projectname>
```

## Utilisation des secrets
Le type d'objet `Secret` offre un mécanisme pour stocker des informations sensibles comme les mots de passe, les fichiers de configuration, les fichiers `dockercfg`, les identifiants de dépôts de code source privés, etc.

Parmi les avantages de l'utilisation des secrets, on peut mentionner:
- Ils peuvent être référencés de manière indépendante à partir de sa définition.
- Ils peuvent être partagés à l'intérieur d'un espace de noms (project).

### Création d'un secret générique
On peut créer un secret à partir d'un fichier local, un dossier ou à partir des valeurs littérales.
La commande à utiliser est: `oc create secret generic <nomDuSecret> <sourceDuSecret>`

- Créer un secret avec plusieurs fichiers dans un dossier particulier
  ```bash
  oc create secret generic my-secret --from-file=path/to/bar
  ```
- Créer un secret avec des clés spécifiques au lieu de noms dans le disque
  ```bash
  oc create secret generic my-secret --from-file=ssh-privatekey=path/to/id_rsa --from-file=ssh-publickey=path/to/id_rsa.pub
  ```
- Créer un secret avec des paires clés/valeurs littérales: key1=supersecret et key2=topsecret
  ```bash
  oc create secret generic my-secret --from-literal=key1=supersecret --from-literal=key2=topsecret
  ```
- Créer un secret à partir d'un fichier env
  ```bash
  oc create secret generic my-secret --from-env-file=path/to/foo.env --from-env-file=path/to/bar.env
  ```

## Variables d'environnement

### Vérifier la liste des variables d'environnement

Pour vérifier les variables d'environnement de tous les pods, utilisez la commande "oc set env pods --all --list".

Un exemple de résultat pour les variables d'environnement d'un pod de base de données:
```bash
# pods/mongodb-26-centos7-7677cf4d75-mzflw, container mongodb-26-centos7
MONGODB_ADMIN_PASSWORD=super-secret
MONGODB_DATABASE=mongo_db
MONGODB_PASSWORD=secret
MONGODB_USER=admin
```
### Création d'une variable d'environnement

Pour la création d'une variable d'environnement utiliser la commande `oc set env ...`:

```bash
oc set env deployment/nodejs-ex MONGO_URL='mongodb://admin:secret@172.30.245.220:27017/mongo_db'
```
L'exemple montre le cas d'une variable d'environnement (MONGO_URL), ajouté au déploiement "nodejs-ex" (deployment/nodejs-ex).

## Autres commandes
- Voir les pods
    ```bash
    oc get pods -o wide
    ```
    exemple de résultat:
    ```bash
    NAME                                READY   STATUS    RESTARTS     AGE     IP               NODE                                        NOMINATED NODE   READINESS GATES
    cakephp-ex-1-build                  0/1     Completed   0          23m     10.128.7.33    ip-10-2-8-154.ca-central-1.compute.internal     <none>           <none>
    cakephp-ex-586bf8946d-tf9lj         1/1     Running     0          21m     10.129.4.93    ip-10-2-105-25.ca-central-1.compute.internal    <none>           <none>
    ```    
- Voir les logs du pod
    ```bash
    oc logs cakephp-ex-586bf8946d-tf9lj
    ```
- Voir le projet courant
    ```bash
    oc project
    Using project "sample-nodejs-from-oc-cli" on server "https://api.exp.openshift.cqen.ca:6443".
    ```
- Voir le statut du projet
    ```bash
    oc status
    In project ws1-nodejs on server https://api.exp.openshift.cqen.ca:6443

    svc/mongodb-26-centos7 - 172.30.245.220:27017
      deployment/mongodb-26-centos7 deploys istag/mongodb-26-centos7:latest 
        deployment #2 running for 2 weeks - 1 pod
        deployment #1 deployed 2 weeks ago

    https://nodejs-ex-ws1-nodejs.apps.exp.openshift.cqen.ca to pod port 8080-tcp (svc/nodejs-ex)
      deployment/nodejs-ex deploys istag/nodejs-ex:latest <-
        bc/nodejs-ex source builds https://github.com/sclorg/nodejs-ex on openshift/nodejs:16-ubi8 
        deployment #3 running for 2 weeks - 1 pod
        deployment #2 deployed 2 weeks ago
        deployment #1 deployed 2 weeks ago
    ```

- Suggestions (aide)
    ```bash
    oc help
    Openshift Client

    This client helps you develop, build, deploy, and run your applications on any
    Openshift or Kubernetes cluster. It also includes the administrative commands for managing a cluster under the 'adm' subcommand.

    Usage:
    oc [flags]

    Basic Commands:
    login           Log in to a server
    new-project     Request a new project
    new-app         Create a new application
    ...
    ```
    Pour obtenir de l'aide avec une commande spécifique, utilisez "--help":
    ```bash
    oc create --help
    Create a resource from a file or from stdin.

    JSON and YAML formats are accepted.

    Usage:
    oc create -f FILENAME [flags]

    Exemples:
    # Create a pod using the data in pod.json.
    oc create -f ./pod.json
    
    # Create a pod based on the JSON passed into stdin.
    cat pod.json | oc create -f -
    
    # Edit the data in docker-registry.yaml in JSON then create the resource using the edited data.
    oc create -f docker-registry.yaml --edit -o json    
    ```
- Voir la documentation pour l'une des ressources en particulier: utilisez "explain". Pour exemple, pour les pods:
    ```bash
    oc explain pods
    KIND:     Pod
    VERSION:  v1

    DESCRIPTION:
        Pod is a collection of containers that can run on a host. This resource is
        created by clients and scheduled onto hosts.

    FIELDS:
    apiVersion	<string>
        APIVersion defines the versioned schema of this representation of an
        object. Servers should convert recognized schemas to the latest internal
        value, and may reject unrecognized values. More info:
        https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources

    kind	<string>
        Kind is a string value representing the REST resource this object
        represents. Servers may infer this from the endpoint the client submits
        requests to. Cannot be updated. In CamelCase. More info:
        https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds

    metadata	<Object>
        Standard object's metadata. More info:
        https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

    spec	<Object>
        Specification of the desired behavior of the pod. More info:
        https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status

    status	<Object>
        Most recently observed status of the pod. This data may not be up to date.
        Populated by the system. Read-only. More info:
        https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
    ```

## Nettoyage (effacer les ressources créées)
Pour obtenir la liste de composants qui ont été créés dans le projet, utilisez la commande "oc get all":

```bash
oc get all
```
Exemple de résultat obtenu:
```bash
NAME                             READY   STATUS      RESTARTS   AGE
pod/nodejs-ex-1-build            0/1     Completed   0          5d23h
pod/nodejs-ex-68f996fb6b-2p2tm   1/1     Running     0          5d23h

NAME                TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
service/nodejs-ex   ClusterIP   172.30.223.39   <none>        8080/TCP   5d23h

NAME                        READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/nodejs-ex   1/1     1            1           5d23h

NAME                                   DESIRED   CURRENT   READY   AGE
replicaset.apps/nodejs-ex-66bb474c     0         0         0       5d23h
replicaset.apps/nodejs-ex-68f996fb6b   1         1         1       5d23h

NAME                                       TYPE     FROM   LATEST
buildconfig.build.openshift.io/nodejs-ex   Source   Git    1

NAME                                   TYPE     FROM          STATUS     STARTED      DURATION
build.build.openshift.io/nodejs-ex-1   Source   Git@5b6d6ae   Complete   6 days ago   1m3s

NAME                                       IMAGE REPOSITORY                                                                 TAGS     UPDATED
imagestream.image.openshift.io/nodejs-ex   image-registry.openshift-image-registry.svc:5000/nodejs-demo-with-oc/nodejs-ex   latest   6 days ago

NAME                                     HOST/PORT                                                      PATH   SERVICES    PORT       TERMINATION   WILDCARD
route.route.openshift.io/nodejs-ex-app   nodejs-ex-app-nodejs-demo-with-oc.apps.exp.openshift.cqen.ca          nodejs-ex   8080-tcp   edge/None     None
```

Pour effacer tous les composants, utilisez la commande "oc delete all --all":
```bash
oc delete all --all
```
Exemple de résultat:
```bash
pod "nodejs-ex-1-build" deleted
pod "nodejs-ex-68f996fb6b-2p2tm" deleted
service "nodejs-ex" deleted
deployment.apps "nodejs-ex" deleted
buildconfig.build.openshift.io "nodejs-ex" deleted
imagestream.image.openshift.io "nodejs-ex" deleted
route.route.openshift.io "nodejs-ex-app" deleted
```
Si vous effectuez encore la commande "oc get all" encore, vous allez voir que le projet est maintenant vide:
```bash
oc get all
```
Vous allez obtenir un résultat similaire:
```bash
No resources found in nodejs-demo-with-oc namespace.
```

## Se déconnecter du cluster Openshift CLI
```bash
oc logout
```

## Références
- [Openshift Container Platform CLI tools overview](https://docs.openshift.com/container-platform/4.10/cli_reference/index.html)
- [Getting stated with the Openshift CLI](https://docs.openshift.com/container-platform/4.10/cli_reference/openshift_cli/getting-started-cli.html)