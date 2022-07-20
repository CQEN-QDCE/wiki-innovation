# Redhat Openshift

## Expérimentation avec la Console Web d'Openshift
(Documentation Openshift [ici](https://docs.openshift.com/container-platform/4.10/web_console/odc-about-developer-perspective.html))
### Créer un projet
Le site du laboratoire, [CEAI](https://ceai.cqen.ca/), vous offre l'option  "Coffre à outils" avec des outils que vous servira pour travailler comme le "Portail Openshift". 

Pour accéder à la console web, vous devez vous authentifier avec votre identifiant du CEAI.

À partir de la page d'accueil d'Openshift, vous trouverez la liste des projets auxquels vous avez accès. Cliquez sur l'un d'eux pour commencer avec la création des ressources comme des applications.

### Créer une application
Sélectionnez un projet.
Dans le menu à gauche, vous verrez l'option "+Add". Cliquez sur ce bouton pour créer une application.
Vous verrez que Openshift vous offre une diversité d'options de création des applications, telles que: 
- Exemples suggérés, 
- Création à partir des sources dans un dépôt Git, 
- Création à partir d'une image dans un registre des conteneurs, 
- Création à partir d'un fichier dans la machine locale, 
- Autre.

![ocp-web-creation-application](images/ocp-web-console-create-application.png)

Pour démontrer un exemple de création d'une application, choisir `Node.js` dans la liste des exemples suggérés: "Getting started resources" -> "View all samples" -> "Node.js"

![ocp-web-creation-app-basic-nodejs](images/ocp-web-console-create-app-sample-nodejs.png)

Cette application vient d'un dépôt git [nodejs-ex](https://github.com/sclorg/nodejs-ex) qui a les scripts nécessaires pour la création des ressources comme le service, le pod, la route (url), entre autres.

Une fois le déploiement terminé, l'application sera déployée et accessible via un lien web:

![ocp-web-creation-app-deploiement](images/ocp-web-console-create-project-deployment.png)

Vous pouvez constater que le pod et le service ont été créés, que le "build" s'est bien complété, que le service a été exposé avec le port 8080 et qu'il y a une route pour accéder à l'application (section "Routes -> Location" dans l'image).

* Pour ajouter la couche de sécurité (TLS) à la route, il faut éditer la route créée originalement. Pour le faire, suivez les instructions [ici](#prise-en-charge-https-des-routes-dans-openshift)

Vous pouvez cliquer sur le lien de la route pour ouvrir l'application sur le web:

![ocp-web-url-app-deployee](images/ocp-web-console-deployed-app-url.png)

Et voilà!, félicitations! vous avez déployé une application web sur Openshift.

## Expérimentation avec l'Interface de Commande en Ligne d'Openshift (OC CLI) 
(Documentation Openshift [ici](https://docs.openshift.com/container-platform/4.10/cli_reference/openshift_cli/getting-started-cli.html))
### Installation de oc cli

Vous pouvez obtenir l'executable `oc` à partir du [lien](https://downloads-openshift-console.apps.exp.openshift.cqen.ca/)

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
### Se connecter au cluster d'Openshift
Pour ouvrir une session au cluster, obtenir le jeton avec un appel [HTTP request](https://oauth-openshift.apps.exp.openshift.cqen.ca/oauth/token/request)
La réponse à la requête dans le navigateur web va vous indiquer la commande pour ouvrir une session, par exemple:
```bash
oc login --token=<token-dans-la-response> --server=https://api.exp.openshift.cqen.ca:6443
```
Un message va s'afficher pour montrer qu'on a bien ouvert une session avec succès dans le cluster
### Accéder à votre projet de travail
La commande "oc get projects" vous montrera la liste de projets auxquels vous avez accès:
```bash
oc get projects
NAME    DISPLAY NAME            STATUS
...
```

Vous pouvez sélectionner le projet en cours avec la commande "oc project <projectname>"
```bash
oc project <projectname>
```

### Créer une application
La commande "oc new-app" va créer une nouvelle application:
```bash
oc new-app https://github.com/sclorg/cakephp-ex
```
Vous verrez un résultat similaire:
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
- Voir la documentation pour l'une des ressources en particulier: Utilisez "explain". Pour exemple, pour les pods:
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

#### Se déconnecter du cluster Openshift CLI
```bash
oc logout
```

#### Prise en charge HTTPS des routes dans Openshift

Pour rendre l'application plus sécuritaire, on ajoute à la route, le protocole TLS (Transport Layer Security) qui offre une sécurité de bout en bout aux données envoyées sur internet. Pour le configurer, dans la console web, il faut éditer la route pour ajouter ce qui correspond au protocole TLS.
* Cliquez sur la route (dans Routes -> nodejs-sample-demo)
* Ouvrez l'onglet YAML et vous allez voir la définition de la route.
* Trouvez la section qui correspond aux spécifications ("spec" -> "port"), et ensuite après le port, ajouter:
    ```yaml
    tls:
        termination: edge
        insecureEdgeTerminationPolicy: None
    ```
    ![ocp-web-edit-route](images/ocp-web-console-edit-route.png)
* Sauvegardez les changements.
* Retournez aux détails de la route (cliquez sur le bouton "cancel").
* Vérifiez que le lien pour accéder à l'application a changé pour "https:..." au lieu de "http:..."

    ![ocp-web-route-avec-tls](images/ocp-web-console-route-with-tls.png)
