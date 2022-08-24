## 10. Parité des environnements developpemment/production

"Gardez le développement, la pre-prod et la production aussi proches que possible"

À notre époque, de nombreuses organisations cherchent à faire évoluer et à renforcer l'innovation de leurs systèmes d'information de manière rapide et efficace. 

Les applications d'entreprise évoluent dans différents environnements au cours de leur cycle de développement. En règle générale, ces environnements sont les suivants : développement, test, préproduction et production. Il est recommandé de faire en sorte que ces environnements restent aussi semblables que possible.
Pour soutenir ce principe, nous recommandons, une fois encore, l'utilisation de conteneurs - un outil très puissant ici, car ils vous permettent d'exécuter exactement le même environnement d'exécution tout au long du développement local jusqu'à la production. N'oubliez pas, cependant, que des différences dans les données sous-jacentes peuvent toujours entraîner des différences au moment de l'exécution.

![](./images/cicd.png)

Pour les microservices, il s'agit d'une caractéristique inhérente aux microservices qui sont exécutés à l'aide des techniques de conteneurisation.

La parité des environnements (ou parité dev/prod) est une fonctionnalité que la plupart des développeurs considèrent comme acquise. Néanmoins, à mesure que les entreprises se développent et que leurs écosystèmes informatiques évoluent, la parité des environnements devient difficile à maintenir.
Ceci est important pour s'assurer que tous les bogues potentiels peuvent être identifiés lors du développement et des tests plutôt que lorsque l'application est mise en production. Cela permet d'éliminer la déclaration de développement stéréotypée : "Cela fonctionne sur mon ordinateur portable". De nombreuses applications s'exécutant désormais dans le nuage, interagissant avec de nombreux autres services dans un vaste écosystème de services, il est important que nous reproduisions cet environnement lorsque nous développons et testons nos applications.

- Créez des images de conteneurs et expédiez-les dans plusieurs environnements.
- Tous les environnements fonctionnent de la même manière lorsqu'ils sont configurés avec les mêmes paramètres.
- Les flags doivent permettre d'activer/désactiver des fonctionnalités sans connaître l'étape ou l'environnement (par exemple, ne pas utiliser if ($environment == 'dev') { ... })
- N'utilisez pas les noms d'hôtes pour la logique conditionnelle/de routage (c'est le travail d'Ingress).
-  Éliminez le "décalage horaire". Publiez le code qui a été écrit quelques heures plus tard au lieu de plusieurs jours ou semaines.