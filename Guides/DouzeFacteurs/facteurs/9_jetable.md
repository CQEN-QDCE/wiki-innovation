## 9. Instances jetables

> Les instances de service doivent être jetables. Favorisez le démarrage rapide pour augmenter les opportunités d’extensibilité et les arrêts gracieux pour laisser le système dans un état correct.

Les services de déploiement infonuagique avec capacité d'adaptation à la charge doivent, pour faire cela, pouvoir créer et détruire des instances d'application. Ainsi les instances d'une application 12 facteurs sont jetables : cela signifie qu’elle doivent démarrer ou s’arrêter très rapidement. Elle doivent aussi prévoir des arrêts gracieux, comme par exemple en prévoyant des processus idempotent ou encore en surveillant les signaux d'arrêt système pour réagir en conséquence.

### Nous recommandons les pratiques spécifiques suivantes :

- Déployer les applications dans des conteneurs.
- Réduire les temps de démarrage. Envisagez également le chargement de librairie à la demande ou d'autres pratiques pour réduire les temps.
- Mettez en place un arrêt progressif. Surveillez les signaux d'arrête système (*SIGTERM*), puis marquez le service comme hors ligne (plus de nouvelles demandes), terminez les demandes existantes, puis supprimez les services.
- Placer les longs traitements dans des tâches asynchrones indempotantes gérées par une file d'attente.

### Exemples de cas d’utilisation

L'utilisation du signal [SIGTERM](https://www.ibm.com/docs/en/aix/7.2?topic=management-process-termination) est pour lancer un arrêt. Par exemple, lorsque [AWS CloudWatch Event](https://docs.aws.amazon.com/fr_fr/AmazonCloudWatch/latest/events/WhatIsCloudWatchEvents.html) arrête une instance, il envoie normalement un signal STOP (`SIGTERM`) au conteneur de l'application. Votre application peut utiliser ce signal pour effectuer des actions de nettoyage avant l'arrêt du conteneur. (Votre application n'a pas besoin de répondre à l'événement `SIGTERM`.) Dans des conditions normales, le système attend jusqu'à 30 secondes que l'application s'arrête, puis envoie un signal KILL (SIGKILL).

L'extrait suivant issu vous montre comment intercepter le signal `SIGTERM` pour fermer les connexions de base de données ouvertes:

```js
const express = require('express')
const dbConnection = require('./db')

// Other business logic related code

app.listen(PORT, () => {
  console.log('App listening on port ${PORT}')
  console.log('Press Ctrl+C to quit.')
})

process.on('SIGTERM', () => {
  console.log('App Shutting down')
  dbConnection.close()  // Other closing of database connection
})
```


[Le facteur suivant](./10_parite_environnements.md)

[Le tableau de la méthodologie de 12 Facteurs](../README.md)