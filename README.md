# Mini Simulio – Test Technique

## Description
Mini Simulio est une application de simulation simplifiée permettant à des utilisateurs authentifiés d'effectuer des simulations et de gérer des clients.

## Technologies utilisées

### Backend
- Laravel (PHP)
- MySQL
- API REST

### Frontend
- React.js
- Responsive Design (support Desktop, Tablette, Mobile)

### Simulateur
- Flask (Python)
- API REST pour l'intégration

## Architecture & Arborescence des submodules
Le projet est organisé autour de submodules Git pour séparer les différentes parties applicatives :

```
mini-simulio/
├── README.md
├── docker-compose.yml
├── dump.sql
├── mini-simulio-api/     # Submodule : API Laravel
├── mini-simulio-web/     # Submodule : Application React
├── app.py                # Simulateur Flask
├── Dockerfile            # Docker pour le simulateur Python
└── requirements.txt      # Dépendances Python
```

- **mini-simulio-api** : Repository séparé pour l'API Laravel (backend)
- **mini-simulio-web** : Repository séparé pour le frontend React

## Installation & Lancement

### Prérequis
- Docker
- Docker Compose
- Git

### 1. Clonage du projet avec submodules
```bash
# Clonez le projet principal avec tous les submodules
git clone --recursive https://github.com/Sampanionyy/mini-simulio.git
cd mini-simulio

# Si déjà cloné sans --recursive
git submodule init
git submodule update
```

### 2. Lancement avec Docker
```bash
# Construire et lancer tous les services
docker-compose up --build

# En arrière-plan (optionnel)
docker-compose up --build -d
```

Cette commande va :
- Construire et lancer le backend Laravel sur http://localhost:8000
- Construire et lancer le frontend React sur http://localhost:5173
- Construire et lancer le simulateur Flask sur http://localhost:5000
- Démarrer une base de données MySQL sur le port 3307

### 3. Initialisation de la base de données (si nécessaire)
```bash
# Importer le dump SQL dans la base de données
docker-compose exec db mysql -u laravel -psecret simulio < dump.sql
```

### 4. Arrêt des services
```bash
# Arrêter tous les services
docker-compose down

# Arrêter et supprimer les volumes (attention : efface les données)
docker-compose down -v
```

## Services et Ports

| Service | Port | URL |
|---------|------|-----|
| Laravel API | 8000 | http://localhost:8000 |
| React Frontend | 5173 | http://localhost:5173 |
| Flask Simulator | 5000 | http://localhost:5000 |
| MySQL Database | 3307 | localhost:3307 |

## Configuration de la base de données

La base de données MySQL est configurée automatiquement avec :
- **Database** : simulio
- **User** : laravel
- **Password** : secret
- **Root Password** : root

## Développement

### Logs des services
```bash
# Voir les logs de tous les services
docker-compose logs

# Logs d'un service spécifique
docker-compose logs laravel
docker-compose logs react
docker-compose logs python
```

### Accès aux conteneurs
```bash
# Accéder au conteneur Laravel
docker-compose exec laravel bash

# Accéder au conteneur React
docker-compose exec react sh

# Accéder au conteneur Python
docker-compose exec python bash
```

### Redémarrage d'un service
```bash
# Redémarrer un service spécifique
docker-compose restart laravel
```

## Gestion des submodules Git

### Mettre à jour tous les submodules :
```bash
git submodule update --remote
```

### Mettre à jour un submodule spécifique :
```bash
git submodule update --remote mini-simulio-api
git submodule update --remote mini-simulio-web
```

### Travailler sur un submodule :
```bash
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
```

## Installation manuelle (alternative)

Si vous préférez ne pas utiliser Docker :

### Prérequis
- PHP >= 8.1
- Composer
- Node.js >= 16
- Python >= 3.8
- MySQL
- Git

### Backend (Laravel)
```bash
cd mini-simulio-api
composer install
cp .env.example .env
# Modifiez le fichier .env (DB_DATABASE, DB_USERNAME, DB_PASSWORD)
php artisan key:generate
php artisan serve
```

### Frontend (React)
```bash
cd mini-simulio-web
npm install
npm run dev
```

### Simulateur (Flask)
```bash
pip install -r requirements.txt
python app.py
```

## Fonctionnalités principales
- Authentification utilisateur (login/logout)
- Interface de simulation pour utilisateurs authentifiés
- API REST sécurisée
- Gestion complète des clients (CRUD)
- Attribution et suivi des simulations clients avec téléchargement PDF
- Interface responsive (mobile, tablette, desktop)

## Dépannage

### Problèmes courants
- **Port déjà utilisé** : Modifiez les ports dans `docker-compose.yml`
- **Permissions Laravel** : Les permissions sont gérées automatiquement dans le conteneur
- **Base de données** : Vérifiez que le service `db` est démarré avant Laravel

### Reconstruction complète
```bash
docker-compose down -v
docker-compose build --no-cache
docker-compose up
```

## Contact
Pour toute question technique, contactez : sampanionyra55@gmail.com

---
Développé dans le cadre du test technique Simulio.
Architecture modulaire avec submodules Git pour une organisation claire et évolutive.
Déploiement simplifié avec Docker Compose.
