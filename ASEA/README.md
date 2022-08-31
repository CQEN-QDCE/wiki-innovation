<!-- ENTETE -->
[![img](https://img.shields.io/badge/Lifecycle-Experimental-339999)](https://www.quebec.ca/gouv/politiques-orientations/vitrine-numeriqc/accompagnement-des-organismes-publics/demarche-conception-services-numeriques)
[![License](https://img.shields.io/badge/Licence-LiLiQ--P-blue)](https://github.com/CQEN-QDCE/.github/blob/main/LICENCE.md)

---

<div>
    <img src="https://github.com/CQEN-QDCE/.github/blob/main/images/mcn.png" />
</div>
<!-- FIN ENTETE -->

# AWS Secure Environment Accelerator (ASEA)

Le CEAI déploie son infrastructure infonuagique chez AWS. Le CEAI a utilisé l'outil AWS Secure Environment Accelerator qui lui a permis de déployer rapidement une architecture AWS multi-comptes, multi-régions sécuritaire et automatisé. 

Cette architecture adaptée au contexte d'utilisation gouvernemental garantie une conformité envers les standards de sécurité infonuagique américain [NIST 800-53](https://csrc.nist.gov/publications/detail/sp/800-53/rev-5/final) et canadien [CCCS Medium Cloud Control Profile](https://www.canada.ca/fr/gouvernement/systeme/gouvernement-numerique/innovations-gouvernementales-numeriques/services-informatique-nuage/profil-controle-securite-services-ti-fondes-information-nuage.html).

Pour comprendre ce qui suit il est préférable d'avoir consulté la documentation du dépôt [AWS Secure Environement Accelerator (ASEA)](https://github.com/aws-samples/aws-secure-environment-accelerator)

## Architecture

Le CEAI a choisi de mettre en place une version allégée de l'architecture ASEA.

![Architecture AWS CEAI](images/ASEA-CEAI.png)

### Organisation

ASEA utilise le service AWS Organization pour organiser son architecture multi-compte. Celle-ci est composée de 6 comptes systèmes répartis dans deux unités d'organisations puis, d'un nombre variable de comptes de travail assignés dans des unités représentant des niveaux d'environnement. 

![Structure multi-comptes du CEAI](images/organization_structure.png)

Trois types de comptes de travail sont utilisés: **Sandbox**, **Dev** et **Prod**.

Pour en savoir plus sur l'architecture prescriptive des comptes de travail, consultez ce [document](compte_travail.md).

### Réseautique

![Architecture Réseau](images/network.png)

Au niveau réseautique, le CEAI ne déploie que les VPC partagés Dev, Prod et Central dans deux zones de disponibilité. 

Le pare-feu AWS Network Firewall est déployé dans le compte Perimeter pour filtrer le trafic entrant et sortant de l'infrastructure.

Le compte Management est isolé au niveau réseautique et déploie le service AWS SSO qui utilise le service public Keycloak du CEAI comme fournisseur d'identité.

Finalement deux zones hébergées asea.cqen.ca (publique) et asea.cqen.org (privée) assurent la résolution des noms de domaines de l'infrastructure.

## Contenus connexes

* [Déploiement ASEA du CEAI](https://github.com/CQEN-QDCE/ceai-cqen-deployments/tree/main/ASEA)

## Références

* [Documentation  AWS Secure Environment Accelerator](https://aws-samples.github.io/aws-secure-environment-accelerator/)
* [Norme de sécurité de l'information NIST 800-53](https://csrc.nist.gov/publications/detail/sp/800-53/rev-5/final)
* [Norme de sécurité de l'information CCCS Medium Cloud Control](https://www.canada.ca/fr/gouvernement/systeme/gouvernement-numerique/innovations-gouvernementales-numeriques/services-informatique-nuage/profil-controle-securite-services-ti-fondes-information-nuage.html)