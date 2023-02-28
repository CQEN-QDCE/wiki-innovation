---
titre : Décision (MADR)
sous-titre : Mise à jour de l'environnement AWS-SEA à la version 1.5
auteur : Centre d'expertise appliquée en innovation
date : 2022-04-07
statut : accepté
---

# Mise à jour de l'environnement AWS-SEA à la version 1.5

## Contexte et problème

L'environnement infonuagique AWS du CEAI est basé l'architecture _Secure Environment Accelerator_. Cette architecture composée de services AWS, s'implémente à partir d'un script d'installation automatisé maintenu par l'équipe d'AWS. Le CEAI déploie actuellement la version 1.3 de cette architecture. Un changement de version majeure (1.5) est disponible depuis quelques semaines. 

Cette mise à jour entraîne plusieurs changements majeurs à l'architecture et l'équipe du CEAI doit déterminer une stratégie pour mettre à jour son environnement

## Options envisagées

* Mise à jour de l'environnement actuel
* Réinstallation d'un nouvel environnement

## Résultat de la décision

Nous irons de l'avant avec une réinstallation d'un nouvel environnement ASEA 1.5. L'environnement actuel, qui a été installé dans les versions préliminaires du projet ASEA, commence a subir des limitations au niveau des fonctionnalités déployables dans les nouvelles mise à jour. L'occasion de réviser l'architecture de l'environnement et mettre à jour la documentation d'installation s'aligne parfaitement avec les objectifs du CEAI, soit de mettre en place les meilleures pratiques pour ses infrastructures ainsi que de rester allignées avec les dernières innovations offertes.

## Avantages et inconvénients des options envisagées

### Mise à jour de l'environnement actuel

* Bon, pas de désinstallation
* Bon, pas besoin de refaire les comptes de travail
* Bon, pas de changement/transfert de domaine
* Bon, pas de migration des charges de travail

* Mauvais, modification complexe du fichier de configuration
* Mauvais, changement courriel manuel de tous les comptes
* Mauvais, arrêt de service des applications exposées via le compte Perimeter
* Mauvais, pas possible d'utiliser la nouvelle fonctionnalité de gestion de comptes Control Tower
* Mauvais, utilisation  de la nomenclature dépréciée PBMM qui rend difficile l'utilisation de la documentation.
* Mauvais, impossibilité de désinstaller l'expérimentation d'un VPC partagé non utilisé (mais facturé)
* Mauvais, le remplacement des pare-feu Fortinet par ceux d'AWS doit se faire manuellement et entrainera un autre arrêt de service des applications exposées via le compte Perimeter
* Mauvais, mise à jour complexe Openshift 4.9

### Réinstallation d'un nouvel environnement

### Avantages

* Bon, occasion de revoir l'architecture en tenant compte de la nouvelle réalité du projet CEAI et des besoin du CQEN
* Bon, bénéficier des nouvelles intégrations de services AWS (Control Tower, AWS Firewall)
* Bon, utiliser la nomenclature standardisée du projet ASEA
* Bon, bénéficier de l'adressage dynamique des VPC partagés
* Bon, éviter la mise à jour complexe d'Openshift, en plus d'avoir l'occasion de baisser les coûts et révisant les besoins.
* Bon, migration itérative des charges de production avec arrêt de service minimal
* Bon, occasion d'expérimenter le redéploiement complet de l'environnement et de mettre à jour la documentation.

* Mauvais, désinstallation complexe de l'ancien environnement
* Mauvais, transfert des noms de domaine
* Mauvais, migration des charges de travail
