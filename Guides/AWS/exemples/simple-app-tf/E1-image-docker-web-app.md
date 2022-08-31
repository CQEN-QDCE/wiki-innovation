# Construction d'une image docker d'une application web simple

Cette étape est nécessaire si vous n'avez pas déjà une application web simple pour la déployer dans AWS.

Si vous avez déjà une image docker d'une telle image, alors, vous pouvez passer à l'[étape 2](E2-deploy-aws-ecs.md) pour déployer les ressources dans AWS.

## Créer une application basique NodeJS

Nous allons créer une application basique web qui peut être exécutée localement dans votre poste de travail (localhost).

Créez un répertoire de travail et allez dans ce répertoire:
```bash
mkdir web-api-nodejs
cd web-api-nodejs
```

Initialisez le fichier package.json pour suivre les dépendances:
```bash
npm init
```
Installez le serveur express comme le serveur web:
```bash
npm install --save express
```

Créez un fichier app.js pour le serveur web avec le contenu suivant:
```js
const app = require('express')();

app.get('/', (req, res) => {
  res.send('Hello, World!\n');
});

app.listen(3000, '0.0.0.0');
```
Ce fichier va commencer le serveur web localement (localhost) avec le port 3000.

Vérifiez que votre serveur marche:
```bash
node app.js
```
Vous devriez voir dans votre browser:
![](images/localhost-hello-world-nodejs.png)