C'est une approche axée sur les API consiste à se concentrer sur la couche applicative pour intégrer les applications et les services sur l'Internet.

Les API sont des points de terminaison qui offrent un accès et la mise à jour des informations dans une application. Une application ou un service client prend la place d'un utilisateur avec un navigateur web. Au lieu d'accéder à une interface graphique par le biais d'un portail, un point de terminaison API expose des fonctions permettant d'accéder aux données et de les mettre à jour. C'est pourquoi l'approche privilégiée pour connecter les services en nuage sur l'internet est une approche API. Cette approche maintient la technologie nécessaire à l'échange de données entre les services au niveau de la couche applicative en utilisant des technologies omniprésentes telles que l'internet, https et les services d'identité. 

Étant donné que le réseau, le calcul et le stockage sous-jacents sont gérés par le fournisseur de services en nuage AWS, le CEAI se concentre sur la sécurisation des applications et, par conséquent, des points de terminaison de l'API.

## Modèle 1 : Interfaces de programme d'application (API)

Les API fournissent une architecture moderne pour accéder aux méthodes et aux données dans les applications, les services et les plates-formes. Elles sont omniprésentes pour les services à l'échelle de l'Internet. Les fournisseurs de nuages offrent une suite de services et d'architectures de plateforme pour soutenir une architecture d'API.

## Modèle 2 : API Gateway (Reverse Proxy)

Les capacités communes sont regroupées dans un seul proxy inverse qui constitue une façade pour tous les services. Le client n'interagit pas directement avec chaque service, mais avec une passerelle API qui est un proxy inverse pour tous les services.  Les fournisseurs de services en nuage offrent des capacités de passerelle API en tant que modèle de plate-forme en tant que service (Platform-as-a-Service) où l'infrastructure sous-jacente, y compris le calcul, le stockage et la mise en réseau, est gérée par les fournisseurs de services en nuage. Le schéma ci-dessous suppose un modèle de livraison PaaS pour la passerelle API. La livraison en tant que modèle de service IaaS n'est pas recommandée car elle nécessite une charge opérationnelle plus importante, notamment la gestion des correctifs, la mise à l'échelle et la sécurité des composants de l'infrastructure.

Les passerelles API offrent les capacités suivantes : 

- L'authentification: est le contrôle de la tentative de connexion. Le client fournit des informations d'identification qui sont vérifiées avant que l'accès ne soit accordé. Ces informations d'identification peuvent être en texte brut (non recommandé) ou cryptées. OAuth 2.0 et SAML sont tous deux suggérés dans les procédures obligatoires pour les API.

- L'autorisation consiste à accorder l'accès au service. L'authentification vérifie que la connexion du client est autorisée, l'autorisation vérifie quels services et méthodes sont autorisés par le client. 

- La terminaison SSL est le processus de conversion des informations cryptées du client en texte clair pour le traitement.

- Le routage (Routing) de la connexion du client vers différents services en fonction de l'URL fournie.
Par exemple, https://domain.com/payment acheminera les interactions du client vers le service de paiement, tandis que http://domain.com/cart acheminera les interactions du client vers le service de panier. Ces services peuvent être déployés à l'aide d'architectures complètement différentes, mais les complexités du client sont abstraites car la passerelle API fournit le routage nécessaire.

- Agrégation (Aggregation) de plusieurs appels de service en un seul appel de service. Cela permet de réduire le nombre d'échanges entre le client et les services. 

- La mise en cache (Caching) des méthodes couramment invoquées peut réduire le traitement requis par les services dorsaux tout en améliorant la réponse des clients.  L'expiration du cache peut être définie pour forcer un rafraîchissement du cache. 

- L'équilibrage de la charge (Load balancing) des demandes de service lorsque les performances d'un service ne sont pas dans une fenêtre spécifiée peut être acheminé entre plusieurs instances de ce service. L'équilibrage de la charge est également un moyen efficace de réaliser des déploiements bleu/vert et des déploiements canariens.

- La conversion de protocole permet aux clients d'utiliser un protocole, par exemple HTTP v1 pour faire une demande même si le service n'accepte que HTTP v2.

- La télémétrie de surveillance (Monitoring) est une capacité essentielle pour surveiller et alerter sur la base de mesures de sécurité, financières et de performance.

- La facturation (Billing) de l'utilisation de l'API ou l'imputation des coûts aux utilisateurs en fonction de leur utilisation est un modèle commercial courant.

## Modèle 3 : API Gateway and Network Firewall

Les pare-feu de réseau sont conçus pour protéger l'infrastructure telle que les serveurs, mais pas nécessairement les applications ou les clients.
Les pare-feu réseau se concentrent sur l'inspection du trafic des couches 3 et 4 de l'OSI et n'ont aucune connaissance de HTTP/S et des menaces spécifiques aux applications telles que l'injection SQL et le Cross Site Scripting. Les pare-feu réseau prennent en charge de nombreux protocoles, mais pour les API, le seul protocole utilisé est HTTP/S. 
Donc pour cela L'ajout d'un pare-feu d'application Web (WAF) offre aux services une plus grande disponibilité tout en protégeant ces services et les clients des menaces courantes. Ce modèle s'appuie sur les capacités d'authentification et d'autorisation d'une passerelle API avec des protections supplémentaires pour les applications et les services pour lesquels la passerelle est un proxy inverse. Les fournisseurs de services en nuage offrent des capacités WAF sous la forme d'un modèle de plate-forme en tant que service (Platform-as-a-Service) où l'infrastructure sous-jacente, y compris l'informatique, le stockage et la mise en réseau, est gérée par les fournisseurs de services en nuage. Le schéma ci-dessous ne s'applique pas lorsque les capacités WAF sont fournies en tant que IaaS.

Les capacités du pare-feu d'application Web sont axées sur la protection contre un grand nombre des 10 principaux risques de sécurité Web de l'OWASP. Un WAF peut augmenter les protections de la passerelle API en fournissant une méthode temporaire pour résoudre les déficiences trouvées dans le code de l'application. Par exemple, si une ancienne application est vulnérable aux injections SQL, le WAF peut être utilisé pour fournir ces protections jusqu'à ce que le code des anciennes applications puisse être remanié.  Pour cette raison, un WAF est plus efficace entre les mains d'un développeur qui connaît le fonctionnement de l'application. Certains diront qu'avec des tests de code appropriés, un WAF n'est pas nécessaire, car les vulnérabilités seront trouvées et corrigées par des tests appropriés. Les WAF, lorsqu'ils sont fournis sous forme de PaaS en nuage, offrent aux développeurs les capacités suivantes :

- Protège contre les attaques par injection SQL.
- Protection contre les scripts intersites.
- Protection contre l'altération des sessions ou des paramètres.
- Permet aux développeurs d'ajouter des inspections spécifiques à une application.
- Inspecte le trafic crypté SSL (HTTPS).
- Protège contre le déni de couche d'application et les attaques par déni de service distribué (DDoS).
- Assure la validation des schémas XML
- Bloque le contenu XML malveillant



