<!-- ENTETE -->
[![img](https://img.shields.io/badge/Lifecycle-Experimental-339999)](https://www.quebec.ca/gouv/politiques-orientations/vitrine-numeriqc/accompagnement-des-organismes-publics/demarche-conception-services-numeriques)
[![License](https://img.shields.io/badge/Licence-LiLiQ--R-blue)](LICENSE_FR)

---

<div>
    <img src="https://github.com/CQEN-QDCE/.github/blob/main/images/mcn.png">
</div>
<!-- FIN ENTETE -->

# Pipelines en AWS

## AWS Codebuild

AWS CodeBuild c'est un service de "build" dans le nuage qui permet de compiler le code source, d'exécuter des tests unitaires et de produire les artefacts prêts pour déployer.
Voir [ici](https://docs.aws.amazon.com/codebuild/latest/userguide/welcome.html) pour plus d'information d'AWS.

Entre les avantages que CodeBuild offre, nous pouvons mentionner:
- Flexibilité de configuration du "build" de l'application, avec un fichier de spécification "buildspec.yaml". Ce fichier sert à détailler les tâches à exécuter lors du "build" de l'application et il peut se trouver dans le code source.
- Un project de CodeBuild peut être déclenché par exemple à la création et mis à jour d'un "Pull Request".
- Le project CodeBuild créé pour une application, peut être appelé aussi à partir d'un pipeline dans AWS CodePipeline pour spécifier les tâches d'un "stage" particulier comme un "build" ou test par exemple.

  ![aws-codepipeline-aws-codebuild](images/pipeline.png)

Pour les avantages mentionnées précédement, nous avons décidé de travailler et de proposer des différents gabarits d'AWS CodeBuild pour nos workflows d'automatisation.

### AWS Buildspec

AWS offre une [documentation detaillé](https://docs.aws.amazon.com/codebuild/latest/userguide/getting-started-create-build-spec-console.html) de la syntaxe d'un fichier buildspec.yaml.

Vous pouvez voir le fichier au complet [ici](CodeBuild/buildspec_ref.yaml), mais nous allons vous montrer les parties plus importantes à être utilisées dans nos gabarits.

Voici un exemple de fichier buildspec.yaml simple et minimal:

```yaml
version: 0.2
...
phases:
  install:
    commands:
      - echo sequence optionnelle pour installer des paquets dans l'environnement du "build"
  pre_build:
    commands:
      - echo sequence optionnelle pour les commandes à exécuter avant le "build". Par exemple pour se logger au repository Amazon ECR.
  build:
    commands:
      - echo sequence optionnelle pour les commandes à exécuter durant le "build". Par exemple pour installer maven.
  post_build:
    commands:
      - echo sequence optionnelle pour les commandes à exécuter après le "build". Par exemple, pousser l'image docker au repository Amazon ECR.
artifacts:
  files:
    - echo sequence requise pour indiquer la location des artefacts résultat du "build"
```

#### Gabarits des fichiers buildspec pour AWS CodeBuild

| Buildspec pour  | Fichier yaml  | Plus d'information  |
|---|---|---|---|
| syntaxe  | [référence](CodeBuild/buildspec_ref.yaml)  | [doc-aws](https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html#build-spec.phases) |
| application java  | [java-app](CodeBuild/buildspec_app_java.yaml)  | [doc-aws](https://docs.aws.amazon.com/codebuild/latest/userguide/getting-started-create-build-spec-console.html), [app-java](#application-java) |
| application nodejs  | [nodejs-app](CodeBuild/buildspec_app_nodejs.yaml) | [app-nodejs](#application-nodejs) |
| application golang  | [go-app](CodeBuild/buildspec_app_go.yaml)  | [app-go](#application-go) |
| scan snyk  | [scan-snyk](CodeBuild/buildspec_scan_snyk.yaml)  | [scan-snyk](#scan-snyk)  |
| docker image  | [docker-img-ecr](CodeBuild/buildspec_docker.yaml)  | [docker-img](#image-docker-dans-aws-ecr) |

**Plus de détails sur les projets CodeBuild**

Dans les gabarits du tableau, pour le cas des applications, la liste des tâches à exécuter lors du "build" du projet sont:

- Compiler le code source
- Exécuter les tests unitaires
- Déployer les artefacts résultat dans un conteneur de data en AWS S3

À continuation, nous allons mentionner les parties les plus pertinentes pour chacun des gabarits: 

##### Application Java

- Extrait du [buildspec](CodeBuild/buildspec_app_java.yaml):
  ```yaml
  phases:
    install:
      runtime-versions:
        java: corretto17
    build:
      commands:
        - echo Build started on `date`
        - mvn install
  artifacts:
    files:
      - target/messageUtil-1.0.jar
  ```  
- Extrait du [log](CodeBuild/logs/logs-extract-java.log) du build dans AWS CodeBuild:

  ```bash
  ...Selecting 'java' runtime version 'corretto17' based on manual selections...
  ...Running command echo "Installing Java version 17 ..."
  ...
  -------------------------------------------------------
  T E S T S
  -------------------------------------------------------
  Results :

  Tests run: 2, Failures: 0, Errors: 0, Skipped: 0
  ...
  ...Expanding target/messageUtil-1.0.jar
  ...Phase complete: UPLOAD_ARTIFACTS State: SUCCEEDED
  ```

  Vous pouvez observer que le build exécute l'installation du runtime java, compile le code source, exécute les tests unitaires et finalement télécharge l'artefact résultat avec succès.
  
##### Application Nodejs

- Extrait du [buildspec](CodeBuild/buildspec_app_nodejs.yaml):
  ```yaml
  phases:
    install:
      runtime-versions:
        nodejs: 16
      commands:
        - npm install
  ```    
- Extrait du [log](CodeBuild/logs/log-extract-nodejs.log) du build dans AWS CodeBuild:-  

  ```bash
  ...Running command npm install
  ...
  added 383 packages, and audited 384 packages in 7s
  ...
  found 0 vulnerabilities
  ```
  Vous pouvez observer que le build exécute l'installation de nodejs version 16 et compile le code source. 

##### Application Go

- Extrait du [buildspec](CodeBuild/buildspec_app_go.yaml):
  ```yaml
  env:
  variables:
    GO_VERSION: 1.19
  phases:
    install:
      commands:
        #...
        # Install golint
        - go get -u golang.org/x/lint/golint        
        # install govulncheck to scan code
        - go install golang.org/x/vuln/cmd/govulncheck@latest           
    pre_build: 
      commands:
        - go get -t ./...
        # Ensure code passes all lint tests
        - golint -set_exit_status
        # Check the Go code for common problems with 'go vet'
        - go vet .
        # Run all tests included with our application
        - go test .
        # Vulnerability detection using govulncheck
        - govulncheck -json ./... > lambda-go-samples-govulncheck-results.json   
    build:
      commands:
        # Build our go application
        - go build -o main
  artifacts:
    files:
      - lambda-go-samples-govulncheck-results.json           
  ```    
- Extrait du [log](CodeBuild/logs/logs-extraxt-go.log) du build dans AWS CodeBuild:-  

  ```bash
  ...Running command go get -u golang.org/x/lint/golint
  ...Running command go install golang.org/x/vuln/cmd/govulncheck@latest
  ...
  Running command go vet .

  Running command go test .
  ok      github.com/aws-samples/lambda-go-samples    0.003s
  ...
  ...Running command govulncheck -json ./... > lambda-go-samples-govulncheck-results.json
  ...
  ...Expanding lambda-go-samples-govulncheck-results.json
  ...Found 1 file(s)
  ...Phase complete: UPLOAD_ARTIFACTS State: SUCCEEDED  
  ```
  Vous pouvez observer que le build exécute l'installation de golint et govulncheck pour le scan de code, ensuite, exécute go vet for vérifier les problèmes communs dans le code, exécute go test pour les tests unitaires, exécute govulncheck pour vérifier les vulnerabilités et imprime le résultat dans un fichier json et finalement télécharge tel fichier dans AWS S3.

##### Scan Snyk

##### Image docker dans AWS ECR

## Références

- [AWS CLI Command Reference](https://docs.aws.amazon.com/cli/latest/reference/codepipeline/create-pipeline.html)
- [AWS CLI Create Project](https://docs.aws.amazon.com/cli/latest/reference/codebuild/create-project.html)
- Exemples de AWS CodeBuild pour des applications:
  - java
    - [Getting started with AWS CodeBuild using the console](https://docs.aws.amazon.com/codebuild/latest/userguide/getting-started.html)
  - golang
    - [Codebuild AWS for Golang](https://abrahamlarrazolo.com/articles/codebuild-golang-aws/)
    - [lambda-go-samples](https://github.com/aws-samples/lambda-go-samples)