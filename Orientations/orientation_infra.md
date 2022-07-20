---
title: "Orientation"
subtitle: "Hébergement des services du CEAI"
author: Stéphane Paré
date: 2021-09-15
documentclass: scrreprt
fontfamily: arev
fontsize: 8pt
---

# Contexte

L’environnement d’innovation est hébergé chez le fournisseur infonuagique AWS. AWS nous permet de mettre en place une zone sécurisée répondant au standard PBMM (Secure Environment Accelerator). C’est à l’intérieur de cette zone qu’une plateforme de développements modernes (PDM) est installée pour développer et héberger les diverses expérimentations réalisées par les équipes de développement.

Dans ce contexte, l’équipe noyau tente de déterminer l’emplacement préférable pour installer les services de l’environnement de d’innovation.

# Scénarios

## Les services sont hébergés directement dans SEA

Les services sont directement hébergés dans SEA. Les déploiements se font en utilisant les principes IaC. On utilise le plus possible les services gérés offerts par AWS et non des solutions hébergées en IaaS;  

### Avantages
- Isolement des services d’infrastructures de l’environnement d’expérimentations;
- Mise à jour des services d’infrastructure ne sera pas tributaire des projets;
- Une erreur de manipulation dans l’environnement d’expérimentations ne mettra pas en péril le fonctionnement des services d’infrastructures;
- Réduction des coûts d’infrastructures et d’opérations en utilisant avec efficience les ressources déjà acquises et en bénéficiant des services offerts par les fournisseurs infonuagiques; 
- Isolation des coûts reliés aux services d’infrastructures des coûts reliés à l’environnement d’expérimentations.

### Inconvénients
- Création d’une dépendance à l’environnement AWS. Une migration vers un autre fournisseur sera toujours faisable mais imposera plus de travail. 

## Les services sont hébergés dans la PDM destinée aux expérimentations

Les services sont hébergés dans la PDM destinée aux expérimentations. Les déploiements se font en utilisant les facilités de la PDM : l’IaC est intrinsèque au fonctionnement de la PDM. 

### Avantages
- Applications des bonnes pratiques dans le déploiement des services grâce aux principes inhérent à la PDM;
- Simplification d’une éventuelle migration vers un autre fournisseur infonuagique.

### Inconvénients
- Les coûts des services sont « noyés » dans les coûts de la PDM expérimentations;
- La mise à jour des services d’infrastructure est tributaire des projets;
- Une erreur de manipulation dans l’environnement d’expérimentations peut mettre en péril le fonctionnement des services d’infrastructures.

## Les services sont hébergés dans leur propre PDM

Les services sont hébergés dans une PDM destinée aux services d’infrastructures. Les déploiements se font en utilisant les facilités de la PDM : l’IaC est intrinsèque au fonctionnement de la PDM. 

### Avantages
- Isolation des opérations entre les services d’infrastructures et les environnements d’expérimentations;
- Applications des bonnes pratiques dans le déploiement des services grâce aux principes inhérent à la PDM;
- Simplification d’une éventuelle migration vers un autre fournisseur infonuagique;

### Inconvénients
- Coûts élevés infrastructures;
- Les coûts des services sont « noyés » dans les coûts de la PDM;
- Exigeant en termes d’opérations.

# Conclusion

C’est le scénario dans lequel les services sont hébergés directement dans SEA qui est retenu. Cela permet :
- D’isoler les services d’infrastructures de l’environnement d’expérimentations. Ainsi la mise à jour des services d’infrastructure ne sera pas tributaire des projets. De plus, une erreur de manipulation dans l’environnement d’expérimentations ne mettra pas en péril le fonctionnement des services d’infrastructures;
- Minimiser les coûts d’infrastructures et d’opérations en utilisant avec efficience les ressources déjà acquises et en bénéficiant des services offerts par les fournisseurs infonuagiques; 
- D’isoler les coûts reliés aux services d’infrastructures des coûts reliés à l’environnement d’expérimentations permettant ainsi d’optimiser les ententes contractuelles avec le fournisseur infonuagique.

En contrepartie, cette orientation a pour désavantages de :
- De créer une dépendance à l’environnement AWS. Une migration vers un autre fournisseur sera toujours faisable mais imposera plus de travail. Il faut noter que cette dépendance est déjà présente par l’utilisation de SEA. Cependant, l’utilisation d’une PDM telle que Openshift pour les services d’infrastructures aurait pu en réduire les effets.

Tous les services d’infrastructure seront donc hébergés dans AWS – SEA directement. Cela sera fait dans l’esprit des bonnes pratiques en appliquant les principes de l’IaC.