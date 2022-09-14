## 14 - Télémétrie

>  Collectez le plus de données possibles sur le comportement et l'utilisation de votre application.

Il ne faut pas confondre la télémétrie avec la journalisation, qui consiste généralement a rapporter les évenements de la structure interne de votre application. La télémétrie vise plutôt l'utilisation réelle des clients ainsi que les performances des divers processus. La télémétrie et la surveillance des applications en temps réel permettent aux développeurs de contrôler les performances, la santé et les principales mesures de leur application. Les données collectées peuvent être ensuite analysées et orienter les dévelloppement futur sur l'application.

La télémétrie peut inclure des mesures spécifiques au domaine (celles qui sont nécessaires ou requises par votre organisation, votre département ou votre équipe), ainsi que des mesures de santé et de système pour votre application. Les mesures de santé et de système puevent comprendre le démarrage, l'arrêt et la mise à l'échelle de l'application, le suivi des requêtes Web ou les résultats des contrôles de santé périodiques.

### Exemples de cas d’utilisation

- [Matomo](https://matomo.org/) est outil de télémétrie pour application web. Il peut être ajouté à une application existante comme service externe.
- [MicroProfile Health](https://github.com/eclipse/microprofile-health) et [MicroProfile Metrics](https://github.com/eclipse/microprofile-metrics) sont des outils télémétrique de l'écosystème `Java`.

[Le facteur suivant](./15_authentification.md)

[Le tableau de la méthodologie de 12 Facteurs](../README.md)