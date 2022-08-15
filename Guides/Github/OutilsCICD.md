<!-- ENTETE -->
[![img](https://img.shields.io/badge/Lifecycle-Experimental-339999)](https://www.quebec.ca/gouv/politiques-orientations/vitrine-numeriqc/accompagnement-des-organismes-publics/demarche-conception-services-numeriques)
[![License](https://img.shields.io/badge/Licence-LiLiQ--P-blue)](https://github.com/CQEN-QDCE/.github/blob/main/LICENCE.md)

---

<div>
    <img src="https://github.com/CQEN-QDCE/.github/blob/main/images/mcn.png" />
</div>
<!-- FIN ENTETE -->

# Configuration des outils pour le pipeline CI/CD

Le Laboratoire offre les automatismes CI/CD créér une pipeline qui ...

## [Snyk](https://snyk.io/)

### Installation de Snyk 

### npm 

```bash 
$ npm install -g snyk  
```
### Linux/Mac

```bash 
$ brew tap snyk/tap 
$ brew install snyk
```

### Windows

```bash 
scoop bucket add snyk https://github.com/snyk/scoop-snyk
scoop install snyk
```

## Autentification de la machine 

```
$ snyk auth
```

## Monitorer le projet 

Rentrer dans le projet que vous voulez monitorer, et entrez la commande suivante: 

```
$ snyk monitor 
```

## Récuperer ton snyk Token 

Pour utiliser les Github Actions avec snyk, il faut récuperer ton snyk token personnel et l'ajouter dans github. 

```yml
env:
  SNYK_TOKEN: ${{ secrets.SNYK_TOKEN }}
```

Tout compte snyk a un tel token. Après la création de votre compte, vous pouvez le retrouver de deux façons: 

1. Dans la page, allez dans le [settings page](https://app.snyk.io/account) et récuperez le token de l'API; 
1. Si vous utilisez la `snyk CLI` localement

# [Git Guardian](https://www.gitguardian.com/)

https://blog.gitguardian.com/github-actions-security-cheat-sheet/

https://docs.gitguardian.com/secrets-detection/leaks_remediation



# [SonarQube](https://www.sonarqube.org/)

# [Github Actions](https://docs.github.com/en/actions)

https://github.com/features/actions

https://docs.github.com/en/actions

https://docs.github.com/en/actions/security-guides/security-hardening-for-github-actions

https://docs.github.com/en/actions/security-guides/encrypted-secrets

https://docs.github.com/en/actions/security-guides/automatic-token-authentication


# Intégration avec Taïga 

Il est possible de faire l'intégration entre Github et Taïga, de façon que lorsque certains évenements choisis se passent, github déclenche un webhook qu'ira créer un issue équivalent dans Taïga, bien comme ajouter des commentaires à l'issue connectés dans Taïga lorsqu'ils sont crées dans Github. 

Référez-vous à la page https://docs.taiga.io/integrations-github.html pour détails de la configuration dans Taïga. 