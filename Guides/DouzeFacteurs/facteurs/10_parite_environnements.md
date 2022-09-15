## 10. Parité des environnements developpemment/production

> Gardez vos environnements d'exécution aussi semblables possibles les uns des autres. Les tests faits sur l'environnement de développement doivent être valides pour l'environnement de production.

Les applications d'entreprise évoluent dans différents environnements au cours de leur cycle de développement. En règle générale, ces environnements sont les suivants : développement, préproduction et production. Il est recommandé de faire en sorte que ces environnements restent aussi semblables que possible.

L'utilisation de conteneurs Docker facilitent beaucoup l'atteinte de la parité dans les environnements car ils vous permettent d'exécuter exactement le même environnement d'exécution tout au long du développement local jusqu'à la production. N'oubliez pas, cependant, que des différences dans les données sous-jacentes peuvent toujours entraîner des différences au moment de l'exécution.

### Nous recommandons les pratiques spécifiques suivantes :

- Créer des images de conteneurs et expédiez-les dans plusieurs environnements, puisque tous les environnements fonctionnent de la même manière lorsqu'ils sont configurés avec les mêmes paramètres.
- Réduir le délai de publication de votre code pour qu'il soit vos branches identiques.

### Exemples de cas d’utilisation

- L'utilisation de [Git Workflow](https://nvie.com/posts/a-successful-git-branching-model/) qui permet d'avoir plusieurs branches et environnements 

- Pour un application nodejs, nous utilisons `NODE_ENV`, `NODE_CONFIG` pour produire un comportement légèrement différent. Par exemple `NODE_ENV=production` a une signification particulière. npm install installera uniquement les dépendances répertoriées dans votre `package.json` et omettra toute devDependencies. Nous utilisons également `NODE_ENV` pour déterminer comment nous construisons nos ressources statiques. `NODE_ENV=production` inclut quelques optimisations supplémentaires.

`NODE_CONFIG` est utilisé avec parcimonie, et uniquement pour charger des fichiers de configuration spécifiques à l'environnement.


[Le facteur suivant](./11_journaux.md)

[Le tableau de la méthodologie de 12 Facteurs](../README.md)