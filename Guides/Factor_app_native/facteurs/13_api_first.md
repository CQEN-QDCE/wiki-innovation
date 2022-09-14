## 13 - *API First*

>  Concevez tout comme un API. Vos systèmes pourront être consommée par n'importe quel autre type d'applications.

Les applications développées pour l'infonuagique participent généralement à un écosystème de services distribués. La meilleure manière de faire l'interconnexion entre les systèmes est la publication d'API dans chacun des systèmes. 

![](../images/api_first.png)

Une approche API-first implique le développement d'API cohérentes et réutilisables, ce qui donne aux équipes la possibilité de travailler sur avec des contrats publics sans interférer avec les processus de développement internes des services utilisés. En utilisant une approche API-first et en planifiant clairement les différentes API qui seront consommées par les applications et services clients, chaque API peut être très clairement conçue pour être aussi efficace que possible et peut être facilement modélisée. Cela permet une meilleure collaboration avec les parties prenantes et permet aux développeurs et aux architectes de tester ou de vérifier leur orientation/plan avant d'investir trop dans le support d'une API donnée. Un processus de conception clair pour chaque API permet également de créer une documentation plus efficace pour chacune d'entre elles. Il est essentiel de fournir une documentation bien conçue, complète et facile à suivre pour que les développeurs aient une bonne expérience de l'API.

Pour définir clairement une API dans une application, on peut utiliser les modèles standard des spécifications d'API. Une spécification d'API peut fournir une compréhension générale du comportement d'une API et de la façon dont une API particulière est liée à d'autres API. Elle explique le fonctionnement de l'API et les résultats auxquels on peut s'attendre en l'utilisant.

### Exemples de cas d’utilisation

[OpenAPI](https://github.com/OAI/OpenAPI-Specification), [gRPC](https://grpc.io/) et [RAML](https://raml.org/) sont des exemples de langages de description d'API.

En tant qu'outil à code source ouvert, le générateur de documentation d'API Swagger permet de publier une documentation complète ainsi que des tests pour un API.

Vous trouverezà cette adresse https://petstore.swagger.io/, un exemple de documentation Swagger. Jetez-y un coup d'œil pour vous familiariser avec ses fonctionnalités.

Vous pouvez également consulter la vision du CEAI de [l'architecture API-First native](https://github.com/CQEN-QDCE/ceai-cqen-documentation/blob/main/Patrons/architecture_api.md) dans l'infonuagique.


[Le facteur suivant](./14_telemetrie.md)

[Le tableau de la méthodologie de 12 Facteurs](../README.md)