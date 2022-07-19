# Openshift CLI (oc)

Openshift CLI (oc) est l'outil CLI le plus utilisé pour les utilisateurs de la plateforme conteneurisée d'Openshift (OCP). Il permet aux administrateurs et développeurs du cluster d'effectuer des opérations de bout en bout dans Openshift à partir d'un terminal.

Avec la commande oc, vous pouvez créer des applications et gérer les projets dans la plateforme conteneurisée d'Openshift.

## Installation de Openshift CLI (oc)
Vous pouvez obtenir le fichier binaire à partir du [lien](https://downloads-openshift-console.apps.dev.openshift.cqen.ca/)

**Ubuntu**
- extraire le fichier:
```bash
tar xvzf <file>
```
- copier le fichier oc dans un répertoire du PATH (par exemple: /usr/local/bin):
```bash
echo $PATH
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
La commande "oc get projects" vous montrera la liste de projets qui ont été créés pour vous:
```bash
oc get projects
NAME    DISPLAY NAME            STATUS
...
```
Vous pouvez sélectionner le projet de travail avec la commande "oc project <projectname>"
```bash
oc project <projectname>
```
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
    In project guide-openshift-project on server https://api.exp.openshift.cqen.ca:6443

    https://cakephp-example-guide-openshift-project.apps.dev.openshift.cqen.ca to pod port 8080-tcp (svc/cakephp-ex)
    deployment/cakephp-ex deploys istag/cakephp-ex:latest <-
    bc/cakephp-ex source builds https://github.com/sclorg/cakephp-ex on openshift/php:7.4-ubi8 
    deployment #2 running for about an hour - 1 pod
    deployment #1 deployed about an hour ago
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
- Voir la documentation pour l'un de ressources en particulier: utilisez "explain". Pour exemple, pour les pods:
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