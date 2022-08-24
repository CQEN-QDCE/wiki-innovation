## 8. Concurrence

"Evolutivité horizontale (Grossissez) à l’aide du modèle de processus"

Vous devez décomposer votre application en processus indépendants en fonction des types de processus (processus d'exécution en arrière-plan, processus de nœud de calcul et processus Web, par exemple). Votre application peut ainsi évoluer en fonction des besoins de chaque charge de travail. La plupart des applications cloud natives vous permettent d'évoluer à la demande. Vous devez concevoir l'application sous forme de processus répartis multiples et indépendants, capables d'exécuter des blocs de travail et d'effectuer un scaling horizontal par l'ajout d'autres processus.

![](./images/concurrence.png)

Dans une architecture microservices, vous pouvez faire évoluer horizontalement chaque service indépendamment, dans la mesure où l'infrastructure sous-jacente le permet. Avec les services conteneurisés, vous bénéficiez en outre de la concurrence recommandée dans l'application à douze facteurs.

Les sections suivantes décrivent certaines structures permettant l'évolutivité des applications. Les applications conçues avec des processus jetables et sans état sont bien placées pour bénéficier de ces conceptions de scaling horizontal.

- Construire de plus petites applications sans état (microservices).
- L'application peut être exécutée un nombre illimité de fois en parallèle (par exemple, pas d'attente de verrouillage).
- L'application ne maintient pas un grand pool de connexions persistantes à la base de données (par exemple, la taille du pool est configurable).
- L'application utilise les transactions de la base de données, le cas échéant, et évite les blocages.
- L'application ne dépend pas de sessions collantes ; les demandes peuvent atteindre n'importe quel processus.