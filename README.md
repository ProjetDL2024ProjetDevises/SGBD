# Script de Configuration MySQL et Déploiement de Base de Données

Ce projet inclut un script Bash permettant de configurer une base de données MySQL et d'y déployer un fichier SQL. 

## Fonctionnalités

- Création d'une base de données MySQL si elle n'existe pas déjà.
- Déploiement automatique d'un fichier SQL (`sql.sql`) pour initialiser la structure et les contraintes de la base.

## Pré-requis

- MySQL doit être installé et accessible depuis le terminal.
- L'utilisateur MySQL doit avoir les permissions nécessaires pour créer des bases de données.

## Instructions

1. **Rendre le script exécutable**  
   ```bash
   chmod +x deploy_db.sh
   ```

2. **Exécuter le script**
   ```bash
   ./deploy_db.sh
   ```

3. **Suivre les instructions à l'écran**  
   - Fournir le nom d'utilisateur, le mot de passe, l'hôte MySQL (par défaut : `localhost`), et le nom de la base à créer.

4. **Structure des tables créées**  
   - Table `monnaie` :
     - `monnaie` : Identifiant unique d'une monnaie.
   - Table `donnee` :
     - `monnaie` : Clé étrangère référant à `monnaie`.
     - `id` : Identifiant unique auto-incrémenté.
     - `date_change` : Date et heure de la donnée.
     - `taux_change` : Taux de change associé.

## Vérification

- En cas de succès, le fichier SQL sera exécuté sur la base de données spécifiée.
- En cas d'erreur, des messages détaillés s'afficheront pour indiquer la cause.

## Avertissements

- Assurez-vous que le fichier `sql.sql` est dans le même répertoire que le script avant l'exécution.
- Vérifiez les permissions d'utilisateur si des erreurs liées à la base de données surviennent.
