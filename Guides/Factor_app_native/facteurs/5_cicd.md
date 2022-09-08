## 5. Build, release, run (CI/CD)

> Étapes de construction et d'exécution strictement séparées.


Il est important de séparer le processus de déploiement logiciel en trois phases: 

- La phase de la compilation (Build) qui transforme le code en un paquet exécutable/un paquet de construction et installe les dépendances;
- La phase du release qui envoie le résultat de cette build sur l’environnement cible, et qui récupère le paquet de construction de l'étape de construction et le combine avec les configurations de l'environnement de déploiement et rend votre application prête à fonctionner;
- La phase de l'exécution (Run) qui lance le ou les processus de l’application.

![](../images/build_release_run.png)

Chaque étape doit donner lieu à un artefact à identifiant unique. Chaque déploiement doit être associé à une release spécifique qui est le produit de la combinaison d'une configuration d'environnement et d'une version. Cela permet de réduire le temps d’indisponibilité de l’applicatif car la phase de build, est souvent une longue opération et peut se faire en parallèle de l’exécution de l’ancienne application sur l’environnement cible.

Nous recommandons l'utilisation d'un outil d'intégration continue/de livraison continue (CI/CD) pour automatiser les processus de constructions et de déploiement. Les images Docker permettent de séparer facilement et plus efficacement les étapes de construction et d'exécution. Idéalement, les images sont créées à chaque livraison et traitées comme des artefacts de déploiement.

### Nous recommandons les bonnes pratiques suivantes :

- Construire et publier une image `Docker`.
- Les `builds` sont déclenchés par un changement de code. Avec les microservices, cela doit être automatisé et cette automatisation vit dans le contrôle de source avec l'application.
- Les `builds` aboutissent à une version avec un identifiant de version unique qui peut être facilement référencé dans l'étape `Run`.
- Vous pouvez mettre à l'échelle une version existante ou revenir à une version précédente sans avoir besoin d'une nouvelle construction ou d'une nouvelle version. Ceci peut être facilement géré avec un outil comme Kubernetes.

### Exemples de cas d’utilisation

Par exemple, une application Cloud Native peut être une application web déployée via des conteneurs Docker et utiliser AWS Container Registry déployé sur les services `AWS EKS` de `Kubernetes` ou utiliser les services `AWS EC2`, `AWS Lambda` ou `AWS S3`.

Le code ci-dessous est utilisé comme base de d'un [démo de `workflow` CI/CD](https://github.com/CQEN-QDCE/ceai-cqen-github-actions-demo#aws-pipeline) en utilisant AWS pipeline pour une application nodejs:

```yml
version: 0.2
phases:
  install:
    runtime-versions:
      nodejs: 16  
    commands:
      - echo Installing mocha JavaScript test framework for Node.js
      - npm install -g mocha
  pre_build:
    commands:
      - echo Installing source NPM dependencies...
      - npm install
      - npm install unit.js
      - npm ci
  build:
    commands:
      - npm run build
      - echo Build started on `date`
      - echo Testing your app ...
      - mocha test.js
  post_build:
    commands:
      - echo Build completed on `date`
artifacts:
  files:
    - index.html
```

- `package.json` permet de configurer des `scripts` afin de codifier diverses tâches. 
- `npm run build` est utilisé pour construire cette application et produit des fichiers javascript et css minifiés à servir comme actifs statiques.
- `npm start` est utilisé pour démarrer l'application.


[Le facteur suivant](./6_processus.md)

[Le tableau de la méthodologie de 12 Facteurs](../README.md)