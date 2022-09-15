## 15 - Authentification & autorisation

> Implémentez l’identité à partir du début sur tout les services.

L'ajout du facteur Authentification et autorisation met l'accent sur la sécurité des applications Cloud Native. Pour interconnecter des systèmes distribués dans l'infonuagique ainsi que sur des applications consonmmées en SaaS, vous devrez exposer des services sur le web public. Il est alors primordial de sécuriser de contrôler l'accès à vos services. Les mécanismes d'ahthentification et d'autorisation doivent être réfléchis et mis en place dans les étapes initiales de la conception d'un service.

On délèguera la plupart du temps, le stockage des identités à un fournisseur d'identité en service externe. Ces outils peuvent aussi souvent fournir le processus d'authentification. Idéalement votre organisation fournie déjà un tel service, mais si vous devez le mettre en place des outils tel que [Keycloak](https://www.keycloak.org/) ou [Gluu](https://gluu.org/) fournissent les fonctionalités nécéssaires à un tel service.

Pour les microservices, un mécanisme d'autorisation basé sur des jetons offre un moyen léger pour contrôler les accès en plus de permettre de propager les identités des utilisateurs à travers différents services. JWT est en train de devenir le format de jeton le plus courant car il suit des normes bien définies et connues.

### Nous recommandons les bonnes pratiques suivantes :

- Tentez le plus possible d'utiliser un fournisseur d'identité externe unique.
- Utiliser des protocols d'authentification et d'identification standards tel que [OAuth2](https://oauth.net/2/) et [OpenIdConnect](https://openid.net/connect/).
- Revalider les identitées à chaques étape d'un processus distribué.
- Mettre en place une authentification unique (*Single Sign On*) pour toutes les applications d'un système, simplifie grandement la vie des usagers.


[Le tableau de la méthodologie de 12 Facteurs](../README.md)