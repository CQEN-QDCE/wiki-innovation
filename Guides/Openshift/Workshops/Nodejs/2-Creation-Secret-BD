# Création du secret pour les paramètres de la base de données

Une bonne pratique de travail dans la plateforme Openshift est celle d'utiliser les [secrets](../../Outils/OC/README.md#création-dun-secret-générique) pour garder l'information sensible des applications.

Pour le cas de la base de données mongodb de cet exercice, il faut spécifier les paramètres suivants:

|  Clé | Valeur  |
|---|---|
|  MONGODB_USER | admin  |
|  MONGODB_PASSWORD | secret  |
|  MONGODB_ADMIN_PASSWORD | super-secret  |
|  MONGODB_DATABASE | mongo_db  |


**Commande pour créer le secret lié à la base de données:**
```bash
oc create secret generic mongodb-parameters --from-literal=MONGODB_USER=admin --from-literal=MONGODB_PASSWORD=secret --from-literal=MONGODB_DATABASE=mongo_db --from-literal=MONGODB_ADMIN_PASSWORD=super-secret
```

[Table de matières](README.md)