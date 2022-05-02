---
title: "Orientation"
subtitle: "Mise à jour de l'environnement AWS-SEA à la version 1.5"
author: Francis Gagné
date: 2022-04-07
documentclass: scrreprt
fontfamily: arev
fontsize: 8pt
---

# Contexte

L'environnement infonuagique AWS du CEAI est basé l'architecture _Secure Environment Accelerator_. Cette architecture composée de services AWS, s'implémente à partir d'un script d'installation automatisé maintenu par l'équipe d'AWS. Le CEAI déploie actuellement la version 1.3 de cette architecture. Un changement de version majeure (1.5) est disponible depuis quelques semaines. 

Cette mise à jour entraîne plusieurs changements majeurs à l'architecture et l'équipe du CEAI doit déterminer une stratégie pour mettre à jour son environnement

# Scénarios

## Mise à jour de l'environnement actuel

### Avantages

* Pas de désinstallation
* Pas besoin de refaire les comptes de travail
* Pas de changement/transfert de domaine
* Pas de migration des charges de travail


### Inconvénients

* Modification complexe du fichier de configuration
* Changement courriel manuel de tous les comptes
* Arrêt de service des applications exposées via le compte Perimeter
* Pas possible d'utiliser la nouvelle fonctionnalité de gestion de comptes Control Tower
* Utilisation  de la nomenclature dépréciée PBMM qui rend difficile l'utilisation de la documentation.
* Impossibilité de désinstaller l'expérimentation d'un VPC partagé non utilisé (mais facturé)
* Le remplacement des pare-feu Fortinet par ceux d'AWS doit se faire manuellement et entrainera un autre arrêt de service des applications exposées via le compte Perimeter
* Mise à jour complexe Openshift 4.9

## Réinstallation d'un nouvel environnement

### Avantages

* Occasion de revoir l'architecture en tenant compte de la nouvelle réalité du projet CEAI et des besoin du CQEN
* Bénéficier des nouvelles intégrations de services AWS (Control Tower, AWS Firewall)
* Utiliser la nomenclature standardisée du projet ASEA
* Bénéficier de l'adressage dynamique des VPC partagés
* Éviter la mise à jour complexe d'Openshift, en plus d'avoir l'occasion de baisser les coûts et révisant les besoins.
* Migration itérative des charges de production avec arrêt de service minimal
* Occasion d'expérimenter le redéploiement complet de l'environnement et de mettre à jour la documentation.

### Inconvénients

* Désinstallation complexe de l'ancien environnement
* Transfert des noms de domaine
* Migration des charges de travail

# Conclusion

Nous irons de l'avant avec une réinstallation d'un nouvel environnement ASEA 1.5. L'environnement actuel, qui a été installé dans les versions préliminaires du projet ASEA, commence a subir des limitations au niveau des fonctionnalités déployables dans les nouvelles mise à jour. L'occasion de réviser l'architecture de l'environnement et mettre à jour la documentation d'installation s'aligne parfaitement avec les objectifs du CEAI, soit de mettre en place les meilleures pratiques pour ses infrastructures ainsi que de rester allignées avec les dernières innovations offertes.

