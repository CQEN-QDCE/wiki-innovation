## 11. Journaux
"Traiter les journaux comme des flux d'événements, ne pas gérer les fichiers journaux"

La journalisation applicative ou les journaux  d’évènements, permettant de stocker un historique des évènements attachés à un processus ou à un service externe qui tourne. Ces évènements sont horodatés et ordonnés en fonction du temps pour retracer le comportement d’une application. Dans une situation idéale, ces fichiers sont visibles par les développeurs dans leurs consoles locales et, en production, ils sont automatiquement capturés comme un flux d'événements et poussés dans un système consolidé en temps réel pour l'archivage à long terme et l'exploration de données. La meilleure solution serait de capter les erreurs puis de les envoyer à un service comme une notification d’erreur.

Traditionnellement, la responsabilité de collecter les logs, de les filtrer selon le niveau souhaité (ERROR , WARN, DEBUG, etc.), de les contextualiser et enfin de les sauvegarder dans des fichiers est souvent déléguée à l’application. Cette approcher rend l’exploitation des logs pour des fins opérationnelles ou de monitoring, compliquée et fastidieuse.

Dans les microservices, l'observabilité est le citoyen de première classe, c’est pourquoi les applications 12 facteurs privilégient une vision plus dynamique où les logs seront considérés comme un flux d’évènements décrivant le comportement de l’application, sans pour autant se soucier du stockage du flux de sortie.

![](../images/logs.png)

- Publier les journaux vers un agrégateur central de journaux.
- Ecrire les logs en sortie standard
- Ne supprimez pas ou ne faites pas tourner les logs. Conservez les données des logs pour des analyses futures
- Les événements sont des flux d'événements structurés (par exemple, JSON).

L'observabilité peut être obtenue en utilisant des outils APM (ELK, Newrelic, et d'autres outils) ou des outils d'agrégation de logs comme Splunk, logs, etc.


[Le facteur suivant](./processus_administration.md)

[Le tableau de la méthodologie de Twelve-Factor](../README.md)