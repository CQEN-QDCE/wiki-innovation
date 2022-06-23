### Questions - Réponses

#### Avant de commencer mes travaux d'expérimentation

**Q: Par où commencer mon expérience sur openshift?**

R: Il y a deux manières de travailler sur OpenShift:
- La console web : l’interface graphique d’Openshift facilite l’accès et la gestion des ressources d’une manière intuitive. Le portail vous offre la possibilité de commencer de zéro avec une application exemple ou de déployer une ou plusieurs applications à partir d'une source comme un répertoire github, un fichier Dockerfile, un registre d'images, etc. Vous trouvez l'option d'accès au portail Openshift dans notre [Coffre à outils](https://ceai.cqen.ca/coffre-a-outils/index.html).
Pour accèder au portail:
    - Cliquez sur l'option "Portail Openshift" 
    - Sélectionnez l'option de "Log in with" CEAI
    - Completez vos idéntifiants pour vous connecter au portail.

- La ligne de commandes avec le Client d'OpenShift (oc cli): Si vous êtes familiarisé à travailler avec bash, alors cette option pourrait vous permettre de gérer les ressources vous même. Pour l'utilisation de oc cli vous devez l'installer localement. [Voir instructions](Readme-HandsOn.md#installation-de-oc-cli)

**Q: Comment je prépare mon application pour la déployer sur openshift?**

R: Idéalement, toute application comme service (SAAS: Software as a Service) qui sera deployé dans un contexte infonuagique devrait suivre la méthodologie des [12 facteurs](https://12factor.net/)

<i>Minimalement</i>, l'application doit:

- Exister dans un répertoire de code (github)
  
<i>Fortement recommandé</i> mais non obligatoire:
- Être contenneurisé (avoir un Dockerfile)

#### Déploiement des composants sur openshift

**Q: Je n'ai pas une application pour déployer, est-ce que je peux trouver des applications exemple?**

R: Oui, Openshift offre plusieurs exemples des applications dans les différents langages de programmation (nodejs, python, java, .net, etc) que vous pouvez choisir.
Au moment d'ajouter ("+Add") une application, component ou service, vous avez l'option de les créer à partir des exemples Vous pouvez voir les différents exemples avec l'option "+Add" -> 

**Q: Comment déployer une application existente?**

R: On peut déployer une application à partir de:
- un répertoire github
- un fichier Dockerfile dans un répertoire github
- une image docker dans un image registry

**Q: Comment déployer une solution intégrée sur Openshift? (plusieurs composants)**

R: L'application intégrée doit avoir un fichier de configuration pour le déploiement comme docker-compose ou un ficher yaml. Comme pour une application simple, la source de l'application peut venir de:
- un répertoire github
- un fichier docker-compose dans un répertoire github
- une image docker dans un image registry

Voir [ici](../kompose/README.md#openshift) un exemple d'utilisation de kompose pour convertir un fichier docker-compose aux fichiers yaml de création des ressources sur *Openshift*.

#### Après mon expérimentation

**Q: Est-ce que je pourrais migrer mon projet sur OpenShift vers un fournisseur infonuagique?**

R: Il existe des outils comme [kompose](https://kompose.io/) qui permettent de convertir un fichier docker-compose.yaml vers plusieurs fichiers yaml pour la création des ressources sur kubernetes ou sur OpenShift.

Voir [ici](../kompose/README.md#kubernetes) un exemple d'utilisation de kompose pour convertir un fichier docker-compose aux fichiers yaml de création des ressources sur *Kubernetes*.