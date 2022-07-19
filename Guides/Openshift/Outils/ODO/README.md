# CLI développeur (odo)

L'interface de ligne de commandes de développement de Red Hat Openshift (odo - Red Hat Openshift Developer CLI), est un outil pour la création des applications dans la plateforme conteneurisée d'Openshift et Kubernetes.
Avec odo, vous pouvez développer, tester, débogueur et déployer des applications basées en microservices dans un cluster Kubernetes sans avoir une connaissance approfondie de la plateforme.

## Installation de l'outil client odo

### Linux

1. Étape 1: Téléchargez le fichier approprié à votre système d'exploitation.
    
    Dans ce cas-ci, on va prendre le fichier binaire:
    ```bash
    curl -L https://developers.redhat.com/content-gateway/rest/mirror/pub/openshift-v4/clients/odo/latest/odo-linux-amd64 -o odo
    ```
2. Étape 2: Changez la permission du fichier binaire
    ```bash
    chmod +x <filename>
    ```
3. Placez le fichier binaire dans un dépôt qui est dans votre "PATH".
    
    Pour vérifier votre "PATH", utilisez la commande "echo $PATH"
    ```bash
    echo $PATH
    ```
4. Vérifiez que odo est maintenant disponible dans votre système:
    ```bash
    odo version
    ```
    Exemple de résultat:
    ```bash
    odo v2.5.1 (ae0c55309)

    Server: https://api.exp.openshift.cqen.ca:6443
    Kubernetes: v1.23.5+3afdacb
    ```
## Se connecter au cluster d'Openshift
Pour ouvrir une session au cluster, obtenir le jeton avec un [appel HTTP](https://oauth-openshift.apps.exp.openshift.cqen.ca/oauth/token/request
)
La réponse à la requête dans le navigateur web va vous indiquer la commande pour ouvrir une session, par exemple:
```bash
odo login https://api.exp.openshift.cqen.ca:6443 --token=<token-dans-la-response>
```
Un message va s'afficher pour montrer qu'on a bien ouvert une session avec succès dans le cluster

## Autres commandes

## Se déconnecter du cluster Openshift CLI
```bash
oc logout
```

## Références
- [Understanding odo](https://docs.openshift.com/container-platform/4.10/cli_reference/developer_cli_odo/understanding-odo.html)