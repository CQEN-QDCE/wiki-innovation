<!-- ENTETE -->
[![img](https://img.shields.io/badge/Lifecycle-Experimental-339999)](https://www.quebec.ca/gouv/politiques-orientations/vitrine-numeriqc/accompagnement-des-organismes-publics/demarche-conception-services-numeriques)
[![License](https://img.shields.io/badge/Licence-LiLiQ--P-blue)](https://github.com/CQEN-QDCE/.github/blob/main/LICENCE.md)

---

<div>
    <img src="https://github.com/CQEN-QDCE/.github/blob/main/images/mcn.png" />
</div>
<!-- FIN ENTETE -->

# Questions & Réponses ASEA

## Est-ce que toutes les expérimentations au CEAI doivent être déployées dans un compte de travail ASEA?

Le CEAI offre une plateforme de déploiement de conteneurs Openshift qui devrait pouvoir accueillir la plupart des expérimentations. Les comptes de travail AWS seront utilisés dans les cas où un service AWS doit être mis à l'essai, pour l'élaboration d'un prototype destinée à être déployé dans une zone d'accueil AWS, ou dans le rares cas où un produit mis à l'essais nécessite absolument un déploiement sur machine virtuelle.

[Guide d'utilisation de la plateforme Openshift du CEAI](../Guides/Openshift/README.md)

## Est-ce que le CEAI peut héberger des charges de production dans son infrastructure AWS?

L'objectif principal de l'environnement AWS du CEAI est l'hébergement de son laboratoire d'expérimentation. Un VPC partagé de production conforme au standard [CCCS Medium Cloud Control Profile](https://www.canada.ca/fr/gouvernement/systeme/gouvernement-numerique/innovations-gouvernementales-numeriques/services-informatique-nuage/profil-controle-securite-services-ti-fondes-information-nuage.html) y est tout de même déployé. Ceci permet effectivement d'héberger des charges dans un contexte de production. 

Il faut toutefois garder en tête que l'environnement du CEAI est totalement détaché du réseau interne du MCN. Il ne peut donc pas accéder aucun système de mission interne du gouvernement du Québec qui ne soit exposé publiquement.

## Est-ce que le CEAI propose des patrons d'architecture à déployer dans AWS ?

Des patrons d'architecture adaptés à l'architecture ASEA testés par le CEAI sont proposés [ici](../Patrons/README.md).