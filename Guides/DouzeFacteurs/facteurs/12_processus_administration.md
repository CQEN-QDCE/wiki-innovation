## 12. Processus d'administration

> Exécutez des tâches d’administration/gestion, telles que le nettoyage ou l'analyse de données, en tant que processus unique.

Les processus d'administration sont généralement constitués de tâches ponctuelles ou récurrentes, telles que la création de rapports, l'exécution de scripts batch, le démarrage de sauvegardes de bases de données et la migration de schémas. Ils devraient être lancés dans un environnement identique à ceux des processus standards de l’application de façon planifée ou déclenchée.

### Les processus d'administration doivent respecter les règles suivantes:

- Ces scripts doivent partager le même chemin de déploiement et d’exécution de l’application de base et ne doivent pas être séparés du cycle de vie du développement. Cela signifie que pour une même base de code, on associe une même séquence de Build, Release et Run.
- Afin d’éviter tout risque d’interférence avec les processus de production en cas de problème (fail ou potentiel impact de performances), les processus d’administration doivent être exécutés d’une manière séparée et isolés des autres processus de production. Il est préférable de démarrer de nouvelles instances d’exécution.
- Une parfaite parité entre les environnements de dev, tests et production permet de valider le bon fonctionnement de ces scripts avant de les appliquer en production.


### Nous recommandons les pratiques spécifiques suivantes :

- Exécuter des scripts ponctuels (comme la sauvegarde d'une base de données) dans le même environnement et la même configuration que l'application (même image Docker de base).
-  Stockez les scripts d'administration dans le même contrôle de version que l'application pour éviter les problèmes de synchronisation.
- La même technique d’isolation de dépendances doit être utilisée sur tous les types de processus.
- Exécuter les scripts dans des instances temporaires.

### Exemples de cas d’utilisation

- Lancer les migrations de base de données (par ex. `manage.py migrate` avec `Django`, `rake db:migrate` avec `Rails`).
- Lancer une console (également appelée terminal) pour exécuter du code arbitraire ou inspecter les modèles de l’application dans la base de données. La plupart des langages fournissent un terminal `REPL` en lançant l’interpréteur sans arguments (par exemple `python`), ou dans certains cas à l’aide d’une commande dédiée (par ex. `irb` pour `Ruby`, `rails` console pour `Rails`) et exécuter des scripts ponctuels inclus dans le dépôt de code (par ex. `php scripts/fix_bad_records.php`).
- Vous pouvez exploiter les CronJob dans un cluster. Les `CronJob` s'exécutent dans des conteneurs éphémères et vous permettent de contrôler la durée, la fréquence d'exécution et les nouvelles tentatives si les Jobs échouent ou prennent trop de temps.


[Le facteur suivant](13_api_first.md)

[Le tableau de la méthodologie de 12 Facteurs](../README.md)