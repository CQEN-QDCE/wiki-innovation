## 6. Processus

> L'application s'exécute comme un ou plusieurs processus sans état. Les états sont persistés dans des services externes de persistance.

Les applications douze facteurs sont exécutées dans l'environnement dans un ou plusieurs processus. Ces processus doivent être doivent être indépendants. Les applications peuvent ainsi évoluer grâce à la réplication de leurs processus. Ils doivent être sans état, cela signifie qu'ils ne gardent pas de trace de l'état des autres processus et qu'ils ne gardent pas d'informations telles que l'état de la session ou du flux de travail. Un processus sans état facilite la mise à l'échelle. Lorsqu'un processus est sans état, des instances peuvent être ajoutées et supprimées pour gérer une charge particulière à un moment donné. Comme chaque processus fonctionne indépendamment, l'absence d'état empêche les effets secondaires involontaires. Les états sont conserver et accéder via un service de stockage externe

### Nous recommandons les pratiques spécifiques suivantes :

- Créez des services sans état et stockez toutes les informations d'état en dehors de l'application, par exemple dans une base de données.
- Utiliser un service de déploiement de conteneur pour déployer vos applications.
- Tous les processus doivent exposer une validation de fonctionnement (*health check*) pour que le service de déploiement de conteur puissent valider si le processus est valide.
- Ne doit pas dépendre d'un gestionnaire de processus (par exemple [pm2](https://pm2.keymetrics.io/))
- Les contrôles de santé ne doivent pas dépendre de la santé des services de soutien.
- Ne nécessite pas d'exécution privilégiée (par exemple, root).

### Exemples de cas d’utilisation

Une application PHP persiste ses sessions dans le service externe Redis au lieu d'utiliser le stockage disque par défaut. Ainsi plusieurs instances PHP peuvent gérer les requêtes entrantes d'une même session puisque les informations sur l'usager sont persisté dans l'outil externe.

[Le facteur suivant](./7_port.md)

[Le tableau de la méthodologie de 12 Facteurs](../README.md)