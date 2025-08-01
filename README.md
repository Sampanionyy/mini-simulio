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

## Architecture du projet

```
mini-simulio/
├── README.md
├── dump.sql
├── mini-simulio-api/              # API Laravel
│   ├── app/
│   ├── config/
│   ├── database/
│   └── ...
├── mini-simulio-web/             # Application React
│   ├── src/
│   ├── public/
│   └── ...
└── app.py
└── requirements.txt #dependances python
```

## Installation et lancement

### Prérequis
- PHP >= 8.1
- Composer
- Node.js >= 16
- Python >= 3.8
- MySQL

### 1. Base de données
```bash
# Créer la base de données
mysql -u root -p
CREATE DATABASE mini_simulio;
exit

# Importer le dump
mysql -u root -p mini_simulio < dump.sql
```

### 2. Backend (Laravel)
```bash
cd backend
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

### 3. Frontend (React)
```bash
cd frontend
npm install
npm start
```
Frontend accessible sur `http://localhost:3000`

### 4. Simulateur (Flask)
```bash
cd simulator
pip install flask flask-cors
python app.py
```
Simulateur accessible sur `http://localhost:5000`

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

## Problèmes connus

Aucun problème majeur identifié. Si vous rencontrez des difficultés :

1. Vérifiez que tous les services sont démarrés
2. Vérifiez les ports (8000, 3000, 5000)
3. Vérifiez la configuration de la base de données

## Design

Interface moderne et intuitive avec :
- Design responsive
- UX optimisée  
- Navigation claire
- Feedback utilisateur

## Contact

Pour toute question technique concernant ce projet :
**sampanionyra55@gmail.com**

---

*Développé dans le cadre du test technique Simulio*