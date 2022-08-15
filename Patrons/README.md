<!-- ENTETE -->
[![img](https://img.shields.io/badge/Lifecycle-Experimental-339999)](https://www.quebec.ca/gouv/politiques-orientations/vitrine-numeriqc/accompagnement-des-organismes-publics/demarche-conception-services-numeriques)
[![License](https://img.shields.io/badge/Licence-LiLiQ--R-blue)](LICENSE_FR)

---

<div>
    <img src="https://github.com/CQEN-QDCE/.github/blob/main/images/mcn.png">
</div>
<!-- FIN ENTETE -->

## Patrons de conception

Le CEAI déploie son infrastructure sur le fournisseur infonuagique AWS. Pour déployer vos applications sur notre infrastructure, le CEAI a défini trois types d'architectures/patrons que nous allons vous présenter :

1. [Architecture d'une API](./architecture_api.md)
2. [Architecture d'un site statique](./architecture_site_statique.md)
3. [Architecture d'une application web](./architecture_application_web.md)

L'évolution vers des services numériques amène le CEAI à adopter des architectures qui rapprochent ces services de 
l'endroit où nos utilisateurs y accèdent, à savoir l'internet. 

L'objectif de ce document d'orientation est de fournir aux développeurs et aux opérateurs une vue des architectures 
qui peuvent être utilisées. Les fournisseurs de services en infonuagiques gèrent ces services et les proposent aux 
consommateurs sous la forme d'un modèle de plateforme en tant que service. Ces plateformes natives du nuage non 
seulement sécurisent nos données, mais, grâce à leur évolutivité, ajoutent de la résilience et de la disponibilité 
à nos services tout en fournissant un modèle de service qui permet aux architectes et aux développeurs de se 
concentrer sur les choix de configuration et de rester abstraits des activités d'ingénierie de l'infrastructure sous-jacentes.

## Références

- [Document d'architecture pour l'API First au fédéral](https://wiki.gccollab.ca/images/7/7a/API_First_Architecture_Patterns_EN_Endorsed.docx)

- [Déploiement des services du Centre d'Expertise Appliquée en Innovation (CEAI)](https://github.com/CQEN-QDCE/ceai-cqen-deployments)

- [La documentation d'AWS](https://docs.aws.amazon.com/fr_fr/)

- [The API Gateway Pattern](https://manningbooks.medium.com/the-api-gateway-pattern-cd8af792084)

- [AWS Serverless Multi-Tier Architectures](https://d1.awsstatic.com/whitepapers/AWS_Serverless_Multi-Tier_Architectures.pdf)

- [Le Centre d'architecture AWS](https://aws.amazon.com/fr/architecture/?cards-all.sort-by=item.additionalFields.sortDate&cards-all.sort-order=desc&awsf.content-type=content-type%23reference-arch-diagram%7Ccontent-type%23pattern&awsf.methodology=*all&awsf.tech-category=*all&awsf.industries=*all&awsm.page-cards-all=1)

- [Architecture AWS utilise ECS fargate avec S3](https://github.com/alaeddine-13/ecs-fargate-s3-infrastructure)

- [Serverless Architecture Patterns in AWS](https://waswani.medium.com/serverless-architecture-patterns-in-aws-edeab0e46a32)

- [Secure AWS API Gateway](https://mydeveloperplanet.com/2022/01/25/how-to-secure-aws-api-gateway-with-cognito-user-pool)

- [Démarrer avec un site web statique sécurisé](https://docs.aws.amazon.com/fr_fr/AmazonCloudFront/latest/DeveloperGuide/getting-started-secure-static-website-cloudformation-template.html)