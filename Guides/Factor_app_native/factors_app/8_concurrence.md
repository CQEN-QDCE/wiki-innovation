## 8. Concurrence

> Evolutivité horizontale (Grossissez) à l’aide du modèle de processus.

Vous devez décomposer votre application en processus indépendants en fonction des types de processus (processus d'exécution en arrière-plan, processus de nœud de calcul et processus Web, par exemple). Votre application peut ainsi évoluer en fonction des besoins de chaque charge de travail. La plupart des applications cloud natives vous permettent d'évoluer à la demande. Vous devez concevoir l'application sous forme de processus répartis multiples et indépendants, capables d'exécuter des blocs de travail et d'effectuer un scaling horizontal par l'ajout d'autres processus.

![](../images/concurrence.png)

Dans une architecture microservices, vous pouvez faire évoluer horizontalement chaque service indépendamment, dans la mesure où l'infrastructure sous-jacente le permet. Avec les services conteneurisés, vous bénéficiez en outre de la concurrence recommandée dans l'application à douze facteurs.

Les applications conçues avec des processus jetables et sans état sont bien placées pour bénéficier de ces conceptions de scaling horizontal.

### Nous recommandons les pratiques spécifiques suivantes :

- Construire de plus petites applications sans état (microservices).
- L'application peut être exécutée un nombre illimité de fois en parallèle (par exemple, pas d'attente de verrouillage).
- L'application ne maintient pas un grand pool de connexions persistantes à la base de données (par exemple, la taille du pool est configurable).
- L'application utilise les transactions de la base de données, le cas échéant, et évite les blocages.
- L'application ne dépend pas de sessions collantes ; les demandes peuvent atteindre n'importe quel processus.

### Exemples de cas d’utilisation

Certaines structures clés de Kubernetes s'appliquent aux processus de scaling :

- Autoscaling horizontal des pods `HPA`. Kubernetes peut être configuré de façon à augmenter ou diminuer le nombre de pods exécutés dans le cluster en fonction de métriques standards ou personnalisées. Cela s'avère utile lorsque vous devez vous adapter à une charge variable sur votre cluster. L'exemple de fichier `YAML` `HPA` suivant montre comment configurer le scaling pour le déploiement en configurant jusqu'à 10 pods selon l'utilisation moyenne du processeur.

```yml
apiVersion: autoscaling/v2beta2
kind: HorizontalPodAutoscaler
metadata:
  name: my-sample-web-app
  namespace: dev
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: my-sample-web-app
  minReplicas: 1
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 60
```

- Autoscaling des nœuds: En cas de demande accrue, vous devrez peut-être faire évoluer votre cluster de façon à ce qu'il accueille davantage de pods. Lorsque l'autoscaling est activé, `AWS EKS` par exemple assure le scaling automatique des nœuds lorsque des pods supplémentaires doivent être programmés et que les nœuds existants ne peuvent pas les gérer. Par contre `AWS EKS` réduit également le nombre de nœuds lorsque la charge sur le cluster diminue 


- Tâches (`Jobs`): Une tâche peut être définie de manière générale comme une action nécessitant l'exécution d'un ou de plusieurs pods. La tâche peut s'exécuter une seule fois ou ponctuellement selon un calendrier. Une fois la tâche terminée, les pods dans lesquels elle s'exécutait sont supprimés. Le fichier `YAML` qui configure la tâche spécifie les détails sur la gestion des erreurs, le parallélisme, la gestion des redémarrages, etc.

```yml
apiVersion: batch/v1
kind: Job
metadata:
  name: pi
spec:
  template:
    spec:
      containers:
      - name: pi
        image: perl:5.34.0
        command: ["perl",  "-Mbignum=bpi", "-wle", "print bpi(2000)"]
      restartPolicy: Never
  backoffLimit: 4
```


[Le facteur suivant](./9_disposabilite.md)

[Le tableau de la méthodologie de 12 Facteurs](../README.md)