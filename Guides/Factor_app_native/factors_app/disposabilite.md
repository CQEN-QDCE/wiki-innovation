## 9. Ressources jetables (Démarrages rapides et arrêts gracieux)
"Maximisez la robustesse avec des démarrages rapides et des arrêts gracieux"

Sur une instance Cloud, a vie d'une application est aussi éphémère que l'infrastructure qui la prend en charge. Il faut savoir qu’une application 12 facteurs est jetables : cela signifie qu’elle peut démarrer ou s’arrêter très rapidement. Les processus doivent donc être prêts à l’emploi rapidement : s’ils sont lancés pour des besoins de montée en charge, il est important d’être opérationnel rapidement pour éviter la saturation des instances en cours. En complément, les développeurs doivent prévoir des arrêts gracieux, c’est-à-dire prévoir les cas où l’application est en train d’être déconnectée ou est en train de crasher : il est préférable d’intercepter ces signaux pour que le travail en cours soit renvoyé dans une file de travaux, afin de ne pas corrompre des données.

![](../images/jetable.png)


Pour les microservices, En adoptant la conteneurisation dans le processus de déploiement des microservices, votre application suit implicitement ce principe dans une mesure maximale. Les conteneurs Docker peuvent être démarrés ou arrêtés instantanément. Le stockage des données de demande, d'état ou de session dans des files d'attente ou d'autres services de sauvegarde garantit qu'une demande est traitée de manière transparente en cas de panne du conteneur.

En outre, selon la plate-forme sur laquelle votre application est déployée, un démarrage aussi lent peut déclencher des alertes ou des avertissements lorsque l'application échoue à son contrôle de santé. Des temps de démarrage extrêmement lents peuvent même empêcher votre application de démarrer du tout dans l'infonuagique. Si votre application est soumise à une charge croissante et que vous devez rapidement mettre en place plus d'instances pour gérer cette charge, tout retard au démarrage peut entraver sa capacité à gérer cette charge. Et Si l'application ne s'arrête pas rapidement et gracieusement, cela peut également entraver la capacité à la relancer après un échec. L'incapacité à s'arrêter assez rapidement peut également entraîner le risque de ne pas disposer des ressources, ce qui pourrait corrompre les données.

- Empaquetez l'application dans une image de conteneur.
- Réduire les temps de démarrage. Les temps de démarrage peuvent être réduits en utilisant Docker et en tirant parti de son système de superposition intégré. Envisagez également le lazy-loading ou d'autres pratiques pour réduire les temps.
- Les processus peuvent être facilement créés ou détruits sans processus d'arrêt orchestré.
- Mettez en place un arrêt progressif. Marquez le service comme hors ligne (plus de nouvelles demandes), terminez les demandes existantes, puis supprimez les services. Dans Kubernetes, cela se produit automatiquement pour vous.
- Votre application est robuste contre la mort subite. Il n'y a pas de perte de données si votre application cesse soudainement de fonctionner.