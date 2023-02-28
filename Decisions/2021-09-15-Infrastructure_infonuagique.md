---
title: Décision (MADR)
subtitle: Hébergement des services du CEAI
author: Centre d'expertise appliquée en innovation
date: 2021-09-15
statut : accepté
---

# Hébergement des services du CEAI

## Contexte et problème

L’environnement d’innovation est hébergé chez le fournisseur infonuagique AWS. AWS nous permet de mettre en place une zone sécurisée répondant au standard PBMM (Secure Environment Accelerator). C’est à l’intérieur de cette zone qu’une plateforme de développements modernes (PDM) est installée pour développer et héberger les diverses expérimentations réalisées par les équipes de développement.

Dans ce contexte, l’équipe noyau tente de déterminer l’emplacement préférable pour installer les services de l’environnement de d’innovation.

## Options envisagées

* Les services sont hébergés directement dans SEA
* Les services sont hébergés dans la PDM destinée aux expérimentations
* Les services sont hébergés dans leur propre PDM

## Résultat de la décision

C’est le scénario dans lequel les services sont hébergés directement dans SEA qui est retenu. Tous les services d’infrastructure seront donc hébergés dans AWS – SEA directement. Cela sera fait dans l’esprit des bonnes pratiques en appliquant les principes de l’IaC.

## Avantages et inconvénients des options envisagées

### Les services sont hébergés directement dans SEA

Les services sont directement hébergés dans SEA. Les déploiements se font en utilisant les principes IaC. On utilise le plus possible les services gérés offerts par AWS et non des solutions hébergées en IaaS;  

* Bon, isole les services d’infrastructures de l’environnement d’expérimentations;
* Bon, la mise à jour des services d’infrastructure ne sera pas tributaire des projets;
* Bon, une erreur de manipulation dans l’environnement d’expérimentations ne mettra pas en péril le fonctionnement des services d’infrastructures;
* Bon, réduit les coûts d’infrastructures et d’opérations en utilisant avec efficience les ressources déjà acquises et en bénéficiant des services offerts par les fournisseurs infonuagiques; 
* Bon, isole des coûts reliés aux services d’infrastructures des coûts reliés à l’environnement d’expérimentations.

* Mauvais, crée une dépendance à l’environnement AWS. Une migration vers un autre fournisseur sera toujours faisable mais imposera plus de travail. 

### Les services sont hébergés dans la PDM destinée aux expérimentations

Les services sont hébergés dans la PDM destinée aux expérimentations. Les déploiements se font en utilisant les facilités de la PDM : l’IaC est intrinsèque au fonctionnement de la PDM. 

* Bon, applique les bonnes pratiques dans le déploiement des services grâce aux principes inhérent à la PDM;
* Bon, simplifie une éventuelle migration vers un autre fournisseur infonuagique.

* Mauvais, les coûts des services sont « noyés » dans les coûts de la PDM expérimentations;
* Mauvais, la mise à jour des services d’infrastructure est tributaire des projets;
* Mauvais, une erreur de manipulation dans l’environnement d’expérimentations peut mettre en péril le fonctionnement des services d’infrastructures.

### Les services sont hébergés dans leur propre PDM

Les services sont hébergés dans une PDM destinée aux services d’infrastructures. Les déploiements se font en utilisant les facilités de la PDM : l’IaC est intrinsèque au fonctionnement de la PDM. 

* Bon, crée une iolation des opérations entre les services d’infrastructures et les environnements d’expérimentations;
* Bon, Applique les bonnes pratiques dans le déploiement des services grâce aux principes inhérent à la PDM;
* Bon, Simplifie une éventuelle migration vers un autre fournisseur infonuagique;

* Mauvais, coûts élevés infrastructures;
* Mauvais, les coûts des services sont « noyés » dans les coûts de la PDM;
* Mauvais, exigeant en termes d’opérations.

