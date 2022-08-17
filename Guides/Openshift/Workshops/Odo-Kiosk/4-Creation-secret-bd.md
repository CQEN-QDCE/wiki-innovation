# Création du secret pour les paramètres de la base de données

Une bonne pratique de travail dans la plateforme Openshift est celle d'utiliser les [secrets](../../Outils/OC/README.md#création-dun-secret-générique) pour garder l'information sensible des applications.

Pour le cas de la base de données mongodb de cet exercice, il faut spécifier les paramètres suivants:

|  Clé | Valeur  |
|---|---|
|  DATABASE_SERVICE_NAME | mongodb-kiosk  |
|  MONGODB_USER | mongodb  |
|  MONGODB_PASSWORD | mongodb  |
|  MONGODB_ADMIN_PASSWORD | mongodb  |
|  MONGODB_DATABASE | mongodb  |


**Commande pour créer le secret lié à la base de données:**
```bash
oc create secret generic kiosk-mongodb-parameters --from-literal=DATABASE_SERVICE_NAME=mongodb-kiosk --from-literal=MONGODB_USER=mongodb --from-literal=MONGODB_PASSWORD=mongodb --from-literal=MONGODB_DATABASE=mongodb --from-literal=MONGODB_ADMIN_PASSWORD=mongodb
```

[Table de matières](README.md)