---
title: Décision (MADR)
subtitle: Outil Infrastructure as Code
author: Centre d'expertise appliquée en innovation
date: 2021-09-21
status: accepté
---

# Choix d'un outil *Infrastructure as Code*

## Contexte et problème

Selon l’orientation « Hébergement des services de l’environnement d’innovation » :

> Tous les services d’infrastructure seront donc hébergés dans AWS – SEA directement. Cela sera fait dans l’esprit des bonnes pratiques en appliquant les principes de l’IaC.

Il faut donc déterminer un outil permettant de scripter l’infrastructure de l’environnement d’innovation (*Infrastructure as Code*). 

<!-- Cet élément est facultatif. N'hésitez pas à le supprimer. -->
## Facteurs décisionnels

* Coûts d’acquisition et de mise en place minimaux (sans agent, ni serveur, ni licence);
* Montée en compétence rapide des ressources
* Support des fournisseurs en infonuagique majeurs
* Open-source
* Présence d’une communauté de pratique stable
* Langage déclaratif

## Options envisagées

* Ansible par RedHat
* Terraform par HashiCorp
* AWS CloudFormation

## Résultat de la décision

Option choisie : Terraform par HashiCorp

Terraform est open-source, il traite tous les fournisseurs en infonuagique majeurs, il permet de supporter une infrastructure immuable. Le langage est declaratif. Il n’exige pas d’infrastructure supplémentaire ni d’agent. L’outil est appuyé par une communauté énorme. De plus, le temps de montée en compétences est diminué par le fait que l’équipe de projet possède déjà des connaissances relatives à ce produit.

Pour les fins de mise en place des composantes nécessaires au laboratoire, l’utilisation d’un outil de provisioning comme Terraform remplie le besoin à court termes. Si la gestion des configurations devient nécessaire, Ansible pourra être intégré à la boite à outil du centre d’expertise appliqué en innovation.

## Avantages et inconvénients des options envisagées

### Ansible par RedHat

Ansible est avant tout un outil configuration management, de gestion de la configuration et de déploiement d'applications permettant une infrastructure en tant que code. Il fonctionne sur de nombreux systèmes de type Unix et peut configurer aussi bien des systèmes de type Unix que Microsoft Windows. Il comprend son propre langage déclaratif pour décrire la configuration du système. Ansible a été écrit par Michael DeHaan et acquis par Red Hat en 2015. Ansible est sans agent, se connectant temporairement à distance via SSH ou Windows Remote Management (permettant l'exécution de PowerShell à distance) pour effectuer ses tâches.

Ansible n’est pas retenu car il est avant tout un outil de configuration : il est conçu pour configurer les serveurs et non pour les provisionner (bien qu’il puisse le faire). Là où Ansible perd des points est qu’il est de type procédural : on doit coder les actions à effectuer plutôt que d’indiquer l’état dans lequel on souhaite le système. Cela implique que l’on doive connaitre l’état courant du système afin de poser les actions nécessaires pour atteindre l’état voulu ce qui n’est pas simple. 

### Terraform par HashiCorp

Terraform est un outil logiciel open-source d'infrastructure en tant que code (IaC) qui fournit un flux de travail CLI cohérent pour gérer des centaines de services en infonuagique. Terraform codifie les API des principaux fournisseurs infonuagiques dans des fichiers de configuration déclaratifs. Terraform est principalement conçu pour faire du provisioning i.e. approvisionner les serveurs et le reste de l’infrastructure nécessaire au système. 

Terraform est open-source, il traite tous les fournisseurs en infonuagique majeurs, il permet de supporter une infrastructure immuable. Le langage est declaratif. Il n’exige pas d’infrastructure supplémentaire ni d’agent. L’outil est appuyé par une communauté énorme. De plus, le temps de montée en compétences est diminué par le fait que l’équipe de projet possède déjà des connaissances relatives à ce produit.

### AWS CloudFormation

Comme Terraform, AWS CloudFormation est un outil logiciel d'infrastructure en tant que code de type provisionning. Il n’est pas open-source.  Il permet de modéliser une collection de ressources AWS et tierces et de les allouer rapidement. Un modèle CloudFormation décrit les ressources souhaitées et leurs dépendances afin de les installer ensemble sous la forme d’une pile. Un modèle permet de créer, mettre à jour et supprimer toute une pile comme s’il s’agissait d’une seule unité, aussi souvent qu’il le faut, plutôt que de gérer individuellement chaque ressource. CloudFormation ne gère que les ressources AWS.

Bien que l’option AWS CloudFormation ait été utilisée pour installer AWS-SEA, le fait que l’outil ne soit pas open-source et qu’il ne traite que les infrastructures AWS ne nous permettent pas de retenir celle-ci.

## Plus d'informations

https://blog.gruntwork.io/why-we-use-terraform-and-not-chef-puppet-ansible-saltstack-or-cloudformation-7989dad2865c

https://aws.amazon.com/fr/cloudformation/

https://www.terraform.io/

https://www.ansible.com/products/automation-platform
