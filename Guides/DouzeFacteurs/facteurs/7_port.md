## 7. Association de ports

> Chaque microservice doit être autonome avec ses interfaces et ses fonctionnalités exposées par lui-même sur son propre port.

Le principe de l'association de ports (*Port Binding*) consiste à identifier un service ou une application sur le réseau par un numéro de port et non pas par un nom de domaine. 
Les noms de domaine et les adresses IP associées peuvent être attribués à la volée par des manipulations manuelles et des mécanismes automatisés de découverte de services. Leur utilisation comme point de référence n'est donc pas fiable. Par contre, l'exposition d'un service ou d'une application au réseau en fonction du numéro de port est plus fiable et plus facile à gérer. Au minimum, les problèmes potentiels dus à une collision entre l'attribution d'un numéro de port privé au réseau et l'utilisation publique de ce même numéro de port par un autre processus public peuvent être évités en utilisant la redirection de port.

![](../images/port_binding.png)

### Nous recommandons les pratiques spécifiques suivantes :

- Configurer le port avec une variable d'environnement.
- Choissisez des ports différents pour chacun des services.

### Exemples de cas d’utilisation

Exemple d'une application node.js qui écoute le port spécifié en variable d'environnement. 


```js
const express = require('express')
const request = require('got')

const app = express()
app.enable('trust proxy')

const PORT = process.env.PORT || 8080
app.listen(PORT, () => {
  console.log('App listening on port ${PORT}')
  console.log('Press Ctrl+C to quit.')
})
```

[Le facteur suivant](./8_concurrence.md)

[Le tableau de la méthodologie de 12 Facteurs](../README.md)