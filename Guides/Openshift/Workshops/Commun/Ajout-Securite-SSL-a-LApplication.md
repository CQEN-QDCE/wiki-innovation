# Ajouter la couche de sécurité (SSL - Secure Sockets Layer) à votre application
Dans cet exercice, vous allez configurer votre application pour crypter le trafic avec le certificat joker d'Openshift (Openshift Wildcard certificate).

Dans les étapes précédentes, vous avez:
- crée et déployé votre application nodejs
- ajouté une route à votre application

## TLS Termination Edge
Openshift a un certificat joker SSL qui peut être utilisé pour toute application. On peut utiliser ce certificat pour servir notre application sans devoir en générer un nous mêmes.

Il faut éditer la route créée pour ajouter l'option TLS.

Allez dans la console web d'Openshift et cliquez sur la route de l'application (menu à gauche -> Topology or menu à gauche -> Project -> Route).

Pour continuer, suivez les instructions [ici](../../Readme-HandsOn.md#ajout-dune-couche-de-sécurité-pour-laccès-à-nos-applications-sur-le-web)

## Vérification
Cliquez sur le nouveau lien créé "https://..."

Vous obtiendrez un résultat similaire:

![ocp-nodejs-deploye-page](images/ocp-deployed-nodejs-ui.png)

Félicitations! Dans cet exercice, vous avez appris comme utiliser le certificat SSL d'Openshift pour exposer votre application.