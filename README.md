Mini Simulio – Test Technique
📖 Description
Mini Simulio est une application de simulation simplifiée permettant à des utilisateurs authentifiés d’effectuer des simulations et de gérer des clients.

🛠️ Technologies utilisées
Backend
Laravel (PHP)

MySQL

API REST

Frontend
React.js

Responsive Design (support Desktop, Tablette, Mobile)

Simulateur
Flask (Python)

API REST pour l’intégration

🏗️ Architecture & Arborescence des submodules
Le projet est organisé autour de submodules Git pour séparer les différentes parties applicatives :

text
mini-simulio/
├── README.md
├── dump.sql
├── mini-simulio-api/     # Submodule : API Laravel
├── mini-simulio-web/     # Submodule : Application React
├── app.py                # Simulateur Flask
└── requirements.txt      # Dépendances Python
mini-simulio-api : Repository séparé pour l’API Laravel (backend)

mini-simulio-web : Repository séparé pour le frontend React

🚀 Installation & Lancement
Prérequis
PHP >= 8.1

Composer

Node.js >= 16

Python >= 3.8

MySQL

Git

1. Clonage du projet avec submodules
bash
# Clonez le projet principal avec tous les submodules
git clone --recursive https://github.com/Sampanionyy/mini-simulio.git

# Si déjà cloné sans --recursive
git submodule init
git submodule update
2. Mise en place de la base de données
bash
mysql -u root -p
CREATE DATABASE mini_simulio;
exit

mysql -u root -p mini_simulio < dump.sql
3. Installation des dépendances
Backend (Laravel)
bash
cd mini-simulio-api
composer install
cp .env.example .env
# Modifiez le fichier .env (DB_DATABASE, DB_USERNAME, DB_PASSWORD)
php artisan key:generate
Frontend (React)
bash
cd ../mini-simulio-web
npm install
Simulateur (Flask)
bash
cd ..
pip install -r requirements.txt
4. Lancement des services
Démarrage automatique (requiert node)
bash
node start-all.js
Ce script lance :

Backend Laravel : http://localhost:8000

Frontend React : http://localhost:3000

Simulateur Flask : http://localhost:5000

Démarrage manuel (optionnel)
Backend :

bash
cd mini-simulio-api
php artisan serve
Frontend :

bash
cd mini-simulio-web
npm start
Simulateur :

bash
cd ..
python app.py
🔄 Gestion des submodules Git
Mettre à jour tous les submodules :

bash
git submodule update --remote
Mettre à jour un submodule spécifique :

bash
git submodule update --remote mini-simulio-api
git submodule update --remote mini-simulio-web
Travailler sur un submodule :

bash
cd mini-simulio-api
# Modifiez le code puis :
git add .
git commit -m "Modification API"
git push origin main

# Depuis la racine principale
cd ..
git add mini-simulio-api
git commit -m "Update API submodule"
git push origin main
🎯 Fonctionnalités principales
Authentification utilisateur (login/logout)

Interface de simulation pour utilisateurs authentifiés

API REST sécurisée

Gestion complète des clients (CRUD)

Attribution et suivi des simulations clients

Interface responsive (mobile, tablette, desktop)

📬 Contact
Pour toute question technique, contactez :
sampanionyra55@gmail.com

Développé dans le cadre du test technique Simulio.
Architecture modulaire avec submodules Git pour une organisation claire et évolutive.
