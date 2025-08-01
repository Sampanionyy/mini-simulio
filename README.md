# Mini Simulio - Test Technique

## 📖 Description
Application de simulation simplifiée permettant à des utilisateurs authentifiés d'effectuer des simulations et de gérer des clients.

## Technologies utilisées

### Backend
- **Laravel** (PHP)
- **MySQL** 
- **API REST**

### Frontend  
- **React.js**
- **Responsive Design** (Desktop, Tablette, Mobile)

### Simulateur
- **Flask** (Python)
- **API REST** pour l'intégration

## Architecture du projet avec submodules

Le projet utilise des **submodules Git** pour organiser les différentes parties de l'application :

mini-simulio/
├── README.md
├── dump.sql
├── mini-simulio-api/ # Submodule: API Laravel
├── mini-simulio-web/ # Submodule: Application React
├── app.py # Simulateur Flask
└── requirements.txt # Dépendances Python

yaml
Copier
Modifier

### Structure des submodules
- **mini-simulio-api** : Repository séparé contenant l'API Laravel
- **mini-simulio-web** : Repository séparé contenant l'application React frontend

---

## Installation et lancement

### Prérequis
- PHP >= 8.1
- Composer
- Node.js >= 16
- Python >= 3.8
- MySQL
- Git

### 0. Clonage avec submodules

```bash
# Cloner le projet principal avec tous les submodules
git clone --recursive https://github.com/Sampanionyy/mini-simulio.git

```
# OU si déjà cloné sans --recursive
git clone https://github.com/Sampanionyy/mini-simulio.git
cd mini-simulio
git submodule init
git submodule update

1. Base de données
# Créer la base de données
mysql -u root -p
CREATE DATABASE mini_simulio;
exit

# Importer le dump de données
mysql -u root -p mini_simulio < dump.sql
2. Installer toutes les dépendances
Avant de lancer l'application, il est important d’installer toutes les dépendances pour chaque composant :

Backend (Laravel)
cd mini-simulio-api
composer install

cp .env.example .env
# Modifier le fichier .env pour configurer la connexion MySQL :
# DB_DATABASE=mini_simulio
# DB_USERNAME=your_username
# DB_PASSWORD=your_password
php artisan key:generate

Frontend (React)
cd ../mini-simulio-web
npm install

Simulateur (Flask)
cd ..
pip install -r requirements.txt

3. Lancement du projet complet
Une fois toutes les dépendances installées dans chaque sous-dossier, vous pouvez lancer tous les services simultanément avec la commande suivante à la racine du projet :

node start-all.js

Ce script va démarrer automatiquement :

* Le backend Laravel sur http://localhost:8000
* Le frontend React sur http://localhost:3000
* Le simulateur Flask sur http://localhost:5000

4. Lancement manuel (optionnel)
Si vous souhaitez démarrer manuellement chaque service séparément, voici les commandes à lancer dans chaque dossier :

Backend (Laravel)
cd mini-simulio-api
php artisan serve

Frontend (React)
cd mini-simulio-web
npm start

Simulateur (Flask)
cd ..
python app.py

Gestion des submodules
Mettre à jour tous les submodules
git submodule update --remote

Mettre à jour un submodule spécifique
git submodule update --remote mini-simulio-api
git submodule update --remote mini-simulio-web

Travailler sur un submodule
cd mini-simulio-api

# Modifier le code
git add .
git commit -m "Modification API"
git push origin main

# Retour au projet principal et mise à jour de la référence
cd ..
git add mini-simulio-api
git commit -m "Update API submodule"
git push origin main

Fonctionnalités implémentées
- Authentification utilisateur avec login/logout
- Interface de simulation pour utilisateurs authentifiés
- API REST sécurisée
- Gestion complète des clients (CRUD)
- Attribution des simulations aux clients
- Interface responsive (Mobile, Tablette, Desktop)

Contact
Pour toute question technique, contactez :
sampanionyra55@gmail.com

Développé dans le cadre du test technique Simulio
Architecture modulaire avec submodules Git pour une meilleure organisation
