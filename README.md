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

```
mini-simulio/
├── README.md
├── dump.sql
├── mini-simulio-api/              # Submodule: API Laravel
│   ├── app/
│   ├── config/
│   ├── database/
│   └── ...
├── mini-simulio-web/             # Submodule: Application React
│   ├── src/
│   ├── public/
│   └── ...
├── app.py                        # Simulateur Flask
└── requirements.txt              # Dépendances Python
```

### Structure des submodules
- **mini-simulio-api** : Repository séparé contenant l'API Laravel
- **mini-simulio-web** : Repository séparé contenant l'application React frontend

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

# OU si déjà cloné sans --recursive
git clone https://github.com/Sampanionyy/mini-simulio.git
cd mini-simulio
git submodule init
git submodule update
```

### 1. Base de données
```bash
# Créer la base de données
mysql -u root -p
CREATE DATABASE mini_simulio;
exit

# Importer le dump
mysql -u root -p mini_simulio < dump.sql
```

### 2. Backend (Laravel) - Submodule mini-simulio-api
```bash
cd mini-simulio-api
composer install
cp .env.example .env
# Configurer .env avec vos paramètres MySQL
# DB_DATABASE=mini_simulio
# DB_USERNAME=your_username  
# DB_PASSWORD=your_password
php artisan key:generate
php artisan serve
```
Backend accessible sur `http://localhost:8000`

### 3. Frontend (React) - Submodule mini-simulio-web
```bash
cd mini-simulio-web
npm install
npm start
```
Frontend accessible sur `http://localhost:3000`

### 4. Simulateur (Flask)
```bash
# À la racine du projet
pip install flask flask-cors
python app.py
```
Simulateur accessible sur `http://localhost:5000`

## Gestion des submodules

### Mettre à jour les submodules
```bash
# Mettre à jour tous les submodules vers leur dernière version
git submodule update --remote

# Mettre à jour un submodule spécifique
git submodule update --remote mini-simulio-api
git submodule update --remote mini-simulio-web
```

### Travailler sur un submodule
```bash
# Entrer dans le submodule
cd mini-simulio-api

# Faire des modifications et commit
git add .
git commit -m "Modification API"
git push origin main

# Retourner au projet principal et mettre à jour la référence
cd ..
git add mini-simulio-api
git commit -m "Update API submodule"
git push origin main
```

## Fonctionnalités implémentées

### Fonctionnalités principales
- [x] Authentification utilisateur
- [x] Système de connexion/déconnexion
- [x] Interface de simulation générale pour utilisateurs authentifiés
- [x] API REST sécurisée

### Bonus implémentés
- [x] Gestion des clients (CRUD)
- [x] Attribution de simulations aux clients
- [x] Interface responsive (Desktop/Tablette/Mobile)

## Responsive Design
L'application est entièrement responsive et s'adapte aux différentes tailles d'écran :
- Mobile (< 768px)
- Tablette (768px - 1024px)  
- Desktop (> 1024px)

## API Endpoints

### Authentification
- `POST /api/login` - Connexion
- `POST /api/logout` - Déconnexion
- `GET /api/me` - Utilisateur connecté

### Clients
- `GET /api/clients` - Liste des clients
- `POST /api/clients` - Créer un client
- `PUT /api/clients/{id}` - Modifier un client
- `DELETE /api/clients/{id}` - Supprimer un client

### Simulations
- `POST /api/simulations` - Créer une simulation
- `GET /api/simulations/client/{clientId}` - Liste des simulations d'un client

## Avantages des submodules

### Organisation
- **Séparation claire** entre frontend et backend
- **Repositories indépendants** pour chaque composant
- **Gestion des versions** séparée pour API et Web

### Développement
- **Équipes séparées** peuvent travailler sur API et Web
- **Déploiement indépendant** possible
- **Réutilisation** des composants dans d'autres projets

### Maintenance
- **Historique distinct** pour chaque partie
- **Tests et CI/CD** séparés
- **Gestion des dépendances** isolée

## Problèmes connus
Aucun problème majeur identifié. Si vous rencontrez des difficultés :

1. Vérifiez que tous les services sont démarrés
2. Vérifiez les ports (8000, 3000, 5000)
3. Vérifiez la configuration de la base de données
4. **Pour les submodules** : Assurez-vous d'avoir cloné avec `--recursive` ou fait `git submodule update --init`

## Design
Interface moderne et intuitive avec :
- Design responsive
- UX optimisée  
- Navigation claire
- Feedback utilisateur

## Structure des repositories

```
mini-simulio (Repository principal)
├── mini-simulio-api (Submodule → Repository séparé)
├── mini-simulio-web (Submodule → Repository séparé)
└── Simulateur Flask (Code local)
```

## Contact
Pour toute question technique concernant ce projet :
**sampanionyra55@gmail.com**

---

*Développé dans le cadre du test technique Simulio*  
*Architecture modulaire avec submodules Git pour une meilleure organisation*
