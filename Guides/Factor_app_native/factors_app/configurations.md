## 3. Configuration (Config)

Séparation stricte entre la configuration et le code et Stocker la config dans l'environnement"


Toute application moderne requiert une configuration, d'une forme ou d'une autre. Les données de configuration vont plus porter sur des données sensibles telles que les mots de passe de la base de données ou les identifiants d’authentifications. Il est donc nécessaire de les protéger en les séparant du reste du code de l’application pour cela il existe généralement des configurations différentes en fonction des environnements cibles (développement, pre-prod et production, par exemple). Ces configurations incluent généralement des identifiants de compte de service et des descripteurs de ressources dans des services externes tels que des bases de données.

![](../images/configuration.png)


Dans un environnement de service microservice, vous pouvez gérer les configurations de vos applications à partir d'un contrôle de source comme git (spring-cloud-config) et utiliser les variables d'environnement pour ne pas maintenir les informations sensibles dans le contrôle de source.
Nous recommandons les pratiques spécifiques suivantes :

- Utilisez des fichiers .env non contrôlés par version pour le développement local. Docker prend en charge le chargement de ces fichiers au moment de l'exécution.
- Conservez tous les fichiers .env dans un système de stockage sécurisé, tel que Vault, afin que les fichiers soient disponibles pour les équipes de développement, mais non commités dans Git.
- Utilisez une variable d'environnement pour tout ce qui peut changer au moment de l'exécution, et pour tout secret qui ne doit pas être commité dans le référentiel partagé.
- Une fois que vous avez déployé votre application sur une plate-forme de livraison, utilisez le mécanisme de gestion des variables d'environnement de cette plate-forme.

L'avantage de séparer les paramètres de configuration de la logique applicative est que vous pouvez appliquer les paramètres de configuration en fonction du chemin de déploiement. Par exemple, vous pouvez avoir un ensemble de paramètres de configuration pour un déploiement destiné à un environnement de test et un ensemble différent pour un déploiement destiné à un environnement de production.

- Externaliser la configuration avec des variables d'environnement.
- Tous les paramètres de configuration sont transmis via des variables d'environnement et ne sont pas codés en dur.
- Vous ne construisez qu'une seule fois pour les déploiements dans tous vos environnements.
- Les services peuvent être reconfigurés dynamiquement sans recompilation (par exemple en changeant les paramètres)
- Les secrets sont transmis à l'aide de méthodes sécurisées telles que Docker Secrets, AWS secret Manager, Terraform secret ou Kubernetes Secrets et aucun secret n'est stocké dans le contrôle de version.


[Le facteur suivant](./stockage.md)

[Le tableau de la méthodologie de Twelve-Factor](../README.md)
