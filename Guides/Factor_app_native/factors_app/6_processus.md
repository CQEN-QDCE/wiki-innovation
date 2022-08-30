## 6. Processus

> Les processus sont sans état et ne partagent rien.

Les applications douze facteurs sont exécutées dans l'environnement sous la forme d'un ou de plusieurs processus. Ces processus doivent être doivent être indépendants. Les applications peuvent ainsi évoluer grâce à la réplication de leurs processus. Ces processus qui peut être plus précisément appelé processus sans état. Cela signifie qu'aucun processus ne garde trace de l'état d'un autre processus et qu'aucun processus ne garde trace d'informations telles que l'état de la session ou du flux de travail. Un processus sans état facilite la mise à l'échelle. Lorsqu'un processus est sans état, des instances peuvent être ajoutées et supprimées pour gérer une charge particulière à un moment donné. Comme chaque processus fonctionne indépendamment, l'absence d'état empêche les effets secondaires involontaires.

![](../images/processus.png)

Pour les microservices, le point important du facteur Processus est que votre application doit être sans état. Ainsi, il est facile de faire évoluer un service horizontalement sans aucun impact en ajoutant simplement plus d'instances de ce service. Si votre système nécessite toujours de maintenir l'état, utilisez les ressources attachées comme redis pour stocker l'état au lieu de le faire en mémoire.

### Nous recommandons les pratiques spécifiques suivantes :

- Créez des services sans état et stockez toutes les informations d'état en dehors de l'application, par exemple dans une base de données.
- Tous les processus doivent exposer des health check endpoint (/healthz)
- Ne doit pas dépendre d'un gestionnaire de processus (par exemple [pm2](https://pm2.keymetrics.io/))
- Les contrôles de santé ne doivent pas dépendre de la santé des services de soutien.
- Ne nécessite pas d'exécution privilégiée (par exemple, root).

### Exemples de cas d’utilisation

Des outils de création de paquets de ressources tel que django-compressor utilisent le système de fichier comme cache pour les ressources compilées. Une application 12 facteurs préfère faire cette compilation durant l’étape d’assemblage, comme avec le pipeline des ressources de Rails, plutôt que durant l’exécution. Et si vous souhaitez conserver des données, vous pouvez utiliser le service externe comme[ElastiCache](https://docs.aws.amazon.com/fr_fr/AmazonElastiCache/latest/red-ug/WhatIs.html) pour mettre en cache l'état de vos applications et partager des données communes entre les processus, en vue de favoriser les couplages faibles.


[Le facteur suivant](./7_liaison_port.md)

[Le tableau de la méthodologie de 12 Facteurs](../README.md)