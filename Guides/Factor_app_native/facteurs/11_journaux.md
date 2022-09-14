## 11. Journaux
> Traitez les journaux générés par les microservices en tant que flux d’événements. Traitez-les avec un agrégateur d’événements.

Les journaux d’évènements permettant de stocker un historique des évènements attachés à un processus ou à un service externe. Ces évènements sont horodatés et ordonnés en fonction du temps pour retracer le comportement d’une application. Dans une situation idéale, ces fichiers sont visibles par les développeurs dans leurs consoles locales et, en production, ils sont automatiquement capturés comme un flux d'événements et poussés dans un système consolidé en temps réel pour l'archivage à long terme et l'exploration de données.

Traditionnellement, la responsabilité de collecter les journaux, de les filtrer selon le niveau souhaité (`ERROR` , `WARN`, `DEBUG`, etc.), de les contextualiser et enfin de les sauvegarder dans des fichiers est souvent déléguée à l’application. Cette approche rend l’exploitation des logs pour des fins opérationnelles ou de monitoring, compliquée et fastidieuse. Les journaux devrait plutôt être considérés comme un flux d’évènements décrivant le comportement de l’application et doivent stocké dans un service externe.

### Nous recommandons les pratiques spécifiques suivantes :

- Utiliser des conteneurs et écrire les évenement dans la sortie standard de ceux-ci.
- Publier les journaux vers un service d'agrégateur central de journaux.
- Ne supprimez pas ou ne faites pas tourner les journaux. Conservez les données des journaux pour des analyses futures.

### Exemples de cas d’utilisation

L'observabilité peut être obtenue en utilisant des outils [APM](https://www.mezmo.com/learn-log-management/logging-vs-apm) (AWS Log Analysis, Newrelic, et d'autres outils) ou des outils d'agrégation de logs comme [Splunk](https://www.splunk.com/fr_fr).

Le flux d’événements d’une application peut être routé dans un fichier, ou surveillé en temps réel (avec tail) dans un terminal. Plus pertinent, les flux peuvent être envoyés vers un outil d’indexation et d’archivage des logs tel que Splunk, ou bien dans un entrepôt de données générique comme [Hadoop/Hive](https://hadoop.apache.org/)


[Le facteur suivant](./12_processus_administration.md)

[Le tableau de la méthodologie de 12 Facteurs](../README.md)