# Redhat Openshift

## Openshift: qu’est-ce que c’est?

“*OpenShift constitue une plateforme d’application basée sur Kubernetes. Ce logiciel est utilisé pour construire des environnements d’application et de développement décentralisés et capables de mettre à l’échelle.
...
Ce logiciel permet une gestion complète du cycle de vie de l’application, y compris le développement, le déploiement, le pilotage et la maintenance. Plus de 2 000 entreprises à travers le monde s’appuient sur OpenShift pour héberger leurs applications dans des environnements Cloud hybrides.*”
Pour plus d’information cliquez [ici](https://www.ionos.fr/digitalguide/serveur/know-how/openshift-quest-ce-que-cest/)

“*Red Hat OpenShift est une plateforme d’orchestration de conteneurs Open Source pour les entreprises. Il s’agit d’un produit logiciel qui inclut les composants du projet de gestion des conteneurs Kubernetes et y ajoute des fonctions de productivité et de sécurité avancées importantes pour les grandes entreprises.*”
Pour en savoir plus, cliquez [ici](https://www.redhat.com/fr/topics/containers/red-hat-openshift-kubernetes)

## Console Web
### Créer un projet
### Créer une application

## Openshift Command Line Interface (OC CLI) (Documentation Openshift [ici](https://docs.openshift.com/container-platform/4.8/cli_reference/openshift_cli/getting-started-cli.html))
### Installation de oc cli

Vous pouvez obtenir le binaire à partir du [lien](https://downloads-openshift-console.apps.dev.openshift.cqen.ca/)

**Ubuntu**
- extraire le fichier:
```bash
tar xvzf <file>
```
- copier le fichier oc dans un repertoire du PATH (par exemple: /usr/local/bin):
```bash
echo $PATH
```
- Après l'installation vous pouvez commencer à exécuter les commandes oc:
```bash
oc <command>
```
### Se connecter au cluster d'Openshift
Pour se logger au cluster, obtenir le token avec un appel [HTTP request](https://oauth-openshift.apps.dev.openshift.cqen.ca/oauth/token/request
)
La réponse au request dans le navigateur web va vous indiquer la commande pour vous logger, par exemple:
```bash
oc login --token=<token-dans-la-response> --server=https://api.dev.openshift.cqen.ca:6443
```
Un message va s'afficher pour montrer qu'on est loggé avec succès dans le cluster
### Créer un projet
La commande "oc new-project" va créer un nouveau projet:
```bash
oc new-project guide-openshift-project
Now using project "guide-openshift-project" on server "https://api.dev.openshift.cqen.ca:6443".
```
### Créer une application
La commande "oc new-app" va créer une nouvelle application:
```bash
oc new-app https://github.com/sclorg/cakephp-ex
```
Vous verrez un output similaire:
```bash
--> Found image 6f4aedf (13 months old) in image stream "openshift/php" under tag "7.4-ubi8" for "php"
...
--> Creating resources ...
    imagestream.image.openshift.io "cakephp-ex" created
    buildconfig.build.openshift.io "cakephp-ex" created
    deployment.apps "cakephp-ex" created
    service "cakephp-ex" created
--> Success
    Build scheduled, use 'oc logs -f buildconfig/cakephp-ex' to track its progress.
    Application is not exposed. You can expose services to the outside world by executing one or more of the commands below:
     'oc expose service/cakephp-ex' 
    Run 'oc status' to view your app.
```
#### Autres commandes
- Voir les pods
    ```bash
    oc get pods -o wide
    ```
    exemple de output:
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
    Using project "sample-nodejs-from-oc-cli" on server "https://api.dev.openshift.cqen.ca:6443".
    ```
- Voir le statut du projet
    ```bash
    oc status
    In project guide-openshift-project on server https://api.dev.openshift.cqen.ca:6443

    https://cakephp-example-guide-openshift-project.apps.dev.openshift.cqen.ca to pod port 8080-tcp (svc/cakephp-ex)
    deployment/cakephp-ex deploys istag/cakephp-ex:latest <-
    bc/cakephp-ex source builds https://github.com/sclorg/cakephp-ex on openshift/php:7.4-ubi8 
    deployment #2 running for about an hour - 1 pod
    deployment #1 deployed about an hour ago
    ```

- Suggestions (aide)
    ```bash
    oc help
    OpenShift Client

    This client helps you develop, build, deploy, and run your applications on any
    OpenShift or Kubernetes cluster. It also includes the administrative commands for managing a cluster under the 'adm' subcommand.

    Usage:
    oc [flags]

    Basic Commands:
    login           Log in to a server
    new-project     Request a new project
    new-app         Create a new application
    ...
    ```
    Pour obtenir de l'aide avec une commande specifique utiliser "--help":
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
- Voir la documentation pour l'un de resources en particulier: Utiliser "explain". Pour exemple, pour les pods:
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

#### Log Out du cluster Openshift CLI
```bash
oc logout
```