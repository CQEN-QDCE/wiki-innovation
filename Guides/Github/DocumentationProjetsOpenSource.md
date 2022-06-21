<!-- ENTETE -->
[![img](https://img.shields.io/badge/Lifecycle-Experimental-339999)](https://www.quebec.ca/gouv/politiques-orientations/vitrine-numeriqc/accompagnement-des-organismes-publics/demarche-conception-services-numeriques)
[![License](https://img.shields.io/badge/Licence-LiLiQ--R-blue)](LICENSE_FR)

---

<div>
    <img src="./images/mcn.png">
</div>
<!-- FIN ENTETE -->

# Documentation des projets `Open Source`


# Soutien 

Vous pouvez créer un fichier `SUPPORT.md` pour informer les gens sur les moyens d'obtenir de l'aide sur votre projet.

Pour diriger les utilisateurs vers des ressources d'assistance spécifiques, vous pouvez ajouter un fichier `SUPPORT.md` à la racine, au répertoire `docs` ou au dossier `.github` de votre répo. Lorsque quelqu'un crée un `issue` dans votre répo, il verra un lien vers le fichier `SUPPORT.md` de votre projet.

Vous pouvez créer des ressources d'assistance par défaut pour votre organisation ou votre compte personnel. Pour plus d'informations, voir la page ["Creating a default community health file (en)"][health]. 

**Conseil :** Pour aider les utilisateurs à trouver vos directives d'assistance, vous pouvez créer un lien vers votre fichier `SUPPORT.md` à partir d'autres emplacements de votre répo, tels que votre fichier `README`.

## Ajout de ressources d'assistance à votre projet

Rendez-vous sur la page ["Ajouter des ressources de support à votre projet (en)"][support] pour instructions comment lier le fichier `SUPPORT.md` à votre projet. 

## Exemple de fichier `SUPPORT.md` 

Voici un exemple de fichier [`SUPPORT.md`][support.md], tiré et adapté de https://github.com/remarkjs/.github/blob/main/support.md

# Sécurité 

Il est de plus en plus courant d'ajouter un fichier `SECURITY.md` qui met en évidence les informations relatives à la sécurité de votre projet. Non seulement cela donne aux utilisateurs de votre projet open source les informations de sécurité importantes dont ils ont besoin, mais cela oblige également les responsables à réfléchir à la manière dont ils doivent gérer les divulgations de sécurité, les mises à jour et les pratiques générales de sécurité.

Améliorez les rapports et corrigez les vulnérabilités lorsqu'elles sont découvertes. Le fichier `SECURITY.MD` doit se trouver dans le répertoire racine de tous les projets open source. Il fournit des directives sur la façon de contacter les projets concernant des problèmes de sécurité ou des bogues.

L'objectif est d'améliorer la sécurité open source en rendant les politiques plus accessibles et en signalant les vulnérabilités de sécurité plus facilement pour tout le monde.

Un fichier `SECURITY.md` doit contenir :

* **Politique de divulgation : vous devez définir la procédure pour la personne qui a trouvé des problèmes de sécurité, et qui est le contact pour elle. Vous pouvez configurer l'e-mail "security@".**  
    Cela illustre l'importance de définir la procédure permettant à un signaleur de problème de divulguer pleinement les problèmes de sécurité de manière responsable. Cela devrait inclure qui contacter et comment. Ceci est extrêmement important car cela vous permet d'obtenir des retours importants des utilisateurs de votre projet. D'autres peuvent enregistrer l'existence d'une vulnérabilité comme un `open issue`, en informant par inadvertance le monde avant qu'un correctif ne soit disponible. Assurez-vous de donner aux utilisateurs de votre projet toutes les instructions dont ils ont besoin pour donner les bonnes informations aux responsables du projet lorsque des problèmes sont détectés.

* **Politique de mise à jour de sécurité : vous devez définir comment vous souhaitez informer les utilisateurs des nouvelles vulnérabilités de sécurité au fur et à mesure qu'elles sont détectées.**  
    Des vulnérabilités logicielles sont découvertes chaque jour. Lorsqu'une vulnérabilité est détectée dans votre application ou votre bibliothèque, vous avez la responsabilité d'en informer les utilisateurs de votre projet. Ils pourraient utiliser votre code open source en production sur des systèmes critiques. Vous devez disposer d'un processus bien défini pour leur partager les informations pertinentes, y compris la gravité de la vulnérabilité, le risque qu'elle comporte et comment passer à une version fixe de votre code. Définissez ce processus à l'avance afin que les informations soient envoyées aux utilisateurs de votre projet, leur permettant d'être informés le plus tôt possible des nouvelles vulnérabilités de sécurité au fur et à mesure qu'elles sont trouvées et corrigées. Cela peut être aussi simple qu'une liste de diffusion de sécurité. Un fichier SECURITY.md est une bonne maison pour de telles informations sur le dépôt, et si vous avez un site Web, envisagez une page indépendante pour celui-ci.

* **Configuration liée à la sécurité : cela inclut les paramètres que les utilisateurs doivent prendre en compte et qui auraient un impact sur la posture de sécurité du déploiement de ce projet.**  
    Les considérations de sécurité de votre projet vont au-delà de votre code seul. Les utilisateurs de votre projet open source doivent probablement ajouter une configuration à votre projet et créer des paramètres pour qu'il fonctionne selon les besoins dans leur environnement. Vous devez fournir aux utilisateurs de votre projet des paramètres suggérés qui renforcent leur posture de sécurité lors du déploiement de ce projet. Les exemples incluent l'activation de HTTPS, l'ajout d'une couche d'autorisation et bien sûr le remplacement des mots de passe par défaut. N'oubliez pas que de nombreux utilisateurs ont généralement une compréhension assez faible de la sécurité, donc tout conseil que vous pouvez leur transmettre les aidera grandement.

* **Lacunes de sécurité connues et améliorations futures. Cela inclut les améliorations de sécurité que vous n'avez pas encore mises en œuvre.**  
    Il existe un compromis entre donner à vos utilisateurs les informations dont ils ont besoin pour sécuriser leur environnement et activer un attaquant avec des itinéraires d'attaque suggérés. Considérez toujours comment les informations que vous partagez pourraient être utilisées par les deux parties. Il est très rare que des projets soient dans un état tel que toutes les améliorations de sécurité que vous souhaitez apporter aient été mises en œuvre. Il est important d'informer les utilisateurs de votre projet des contrôles de sécurité qui ne sont pas actuellement en place. Vos utilisateurs méritent de connaître toute l'histoire afin qu'ils puissent prendre des décisions éclairées sur la façon dont ils utilisent votre projet. Qui sait, vous pourriez même obtenir des contributions d'une implémentation de sécurité de vos utilisateurs sur la liste !

## Ajouter une politique de sécurité à votre projet

Rendez-vous sur la page ["Ajouter une politique de sécurité à votre projet (en)"][securite] pour instructions comment lier le fichier `SECURITY.md` à votre projet. 

## Exemple de fichier `SECURITY.md` 

Voici un exemple de fichier [`SECURITY.md`][securite.md], tiré et adapté de https://raw.githubusercontent.com/atomist/samples/master/SECURITY.md

# Références 


## Général 
https://opensource.guide/fr 

## Soutien 

https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/adding-support-resources-to-your-project

## Sécurité 

[Add a SECURITY.md file to your Azure Repos (en)](https://snyk.io/blog/add-a-security-md-file-to-your-azure-repos/)

[Example SECURITY.md (en)](https://github.com/atomist/samples/blob/master/SECURITY.md)

https://github.com/Trewaters/security-README


<!-- Definitions -->

[health]: https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/creating-a-default-community-health-file
[securite]: https://docs.github.com/en/code-security/getting-started/adding-a-security-policy-to-your-repository
[securite.md]: ./docs/SECURITY.md
[support]: https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/adding-support-resources-to-your-project
[support.md]: ./docs/SUPPORT.md
