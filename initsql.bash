#!/bin/bash

# Demander les informations nécessaires pour la connexion MySQL
read -p "Entrez le nom d'utilisateur MySQL (doit avoir des droits de création de base) : " DB_USER
read -sp "Entrez le mot de passe MySQL : " DB_PASSWORD
echo
read -p "Entrez l'hôte MySQL (par défaut : localhost) : " DB_HOST
DB_HOST=${DB_HOST:-localhost}

# Demander le nom de la nouvelle base de données
read -p "Entrez le nom de la nouvelle base de données à créer : " DB_NAME

# Demander le chemin vers le fichier SQL
SQL_FILE='sql.sql'

# Vérifier si le fichier SQL existe
if [ ! -f "$SQL_FILE" ]; then
    echo "Le fichier SQL spécifié n'existe pas. Veuillez vérifier le chemin."
    exit 1
fi

# Créer la base de données
echo "Création de la base de données $DB_NAME..."
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

# Vérifier si la base de données a été créée avec succès
if [ $? -ne 0 ]; then
    echo "Échec de la création de la base de données $DB_NAME. Veuillez vérifier vos permissions."
    exit 1
fi

# Exécuter le fichier SQL sur la nouvelle base de données
echo "Déploiement du fichier SQL sur la base de données $DB_NAME..."
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" < "$SQL_FILE"

# Vérifier si le déploiement a réussi
if [ $? -eq 0 ]; then
    echo "Le fichier SQL a été déployé avec succès sur la base de données $DB_NAME."
else
    echo "Échec du déploiement du fichier SQL. Veuillez vérifier les informations de connexion et le fichier SQL."
fi