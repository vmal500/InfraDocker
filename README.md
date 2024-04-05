# Guide pour la Configuration Docker Compose

## Aperçu
Ce guide fournit des instructions détaillées pour utiliser la configuration Docker Compose disponible dans ce référentiel. La configuration définit trois services : `neo`, `zion`, et `smith`, chacun avec des paramètres spécifiques pour la construction d'images, les configurations réseau et les mappages de ports.

## Prérequis
- Docker Engine doit être installé sur votre système.
- Docker Compose doit être installé sur votre système.

## Utilisation
1. Assurez-vous que Docker Engine et Docker Compose sont installés sur votre système.
2. Clonez ce référentiel sur votre machine locale.
3. Accédez au répertoire contenant le fichier `docker-compose.yml`.
4. Utilisez la commande suivante pour construire les images des services définis dans la configuration Docker Compose : `docker-compose build --no-cache`.
5. Pour démarrer les services, exécutez : `docker-compose up`.
6. Pour arrêter les services, exécutez : `docker-compose down`.

En option:
- **docker-cleaner.sh** : Ce script nettoie Docker pour vous permettre de recommencer à zéro et d'avoir un environnement propre. Utilisez-le si nécessaire en exécutant `./docker-cleaner.sh`.

## Détails de la Configuration

### Version
La configuration Docker Compose utilise la version `3` de Docker Compose.

### Services

#### Neo
- **Configuration de Construction** : 
  - Contexte : `./neo`
  - Fichier Docker : `Dockerfile`
- **Configuration de Réseau** : 
  - Adresse IPv4 attribuée : `10.0.0.2`
- **Mappage des Ports** : 
  - Port Hôte `11514` mappé au Port Conteneur `514/tcp`
  - Port Hôte `10514` mappé au Port Conteneur `514/udp`

#### Zion
- **Configuration de Construction** : 
  - Contexte : `./zion`
  - Fichier Docker : `Dockerfile`
- **Configuration de Réseau** : 
  - Adresse IPv4 attribuée : `10.0.0.4`
- **Mappage des Ports** : 
  - Port Hôte `2222` mappé au Port Conteneur `22/tcp` (SSH)
  - Port Hôte `8080` mappé au Port Conteneur `80/tcp` (HTTP)

#### Smith
- **Configuration de Construction** : 
  - Contexte : `./smith`
  - Fichier Docker : `Dockerfile`
- **Configuration de Réseau** : 
  - Adresse IPv4 attribuée : `10.0.0.3`

### Réseaux
- **Nom du Réseau** : `matrix`
- **Driver** : `bridge`
- **Gestionnaire d'Adresses IP (IPAM)** : 
  - Driver : `default`
  - Sous-réseau : `10.0.0.0/29`

### Infrastructure cible
Dans l'infrastructure cible, les machines, serveurs et réseaux reflètent les personnages et lieux clés de la série de films Matrix, comme illustré dans le logigramme ci-dessous :

![Logigramme de l'infrastructure](https://i.imgur.com/JLmT7DL.png)

- Zion est le serveur contenant les actifs critiques de la Matrix à protéger absolument.
- Neo est le serveur de centralisation des journaux d'activité (logs) générés dans la Matrix.
- Smith est la machine de tests de connexion et de balayage (scan) de la Matrix.

### Remarques supplémentaires
- Toutes les configurations de filtrage réseau (pare-feu/firewall) sont purgées par défaut.
- Le serveur Neo est configuré pour recevoir uniquement les flux rsyslog du serveur Zion.
- Les journaux d'activité (logs) générés par les services OpenSSH et Apache2 sur le serveur Zion sont configurés pour être envoyés vers le serveur Neo.
- Toute adresse IP qui échoue à établir une connexion SSH au serveur Zion plus de deux fois en l'espace de 5 minutes est automatiquement bloquée pour une durée de 1 heure.
- Le serveur web Apache2 est configuré pour servir les pages web disponibles [ici](https://github.com/nanamou224/matrix).

# Outils de débogage Docker

Lorsque vous travaillez avec des conteneurs Docker, le débogage peut parfois être difficile. Heureusement, Docker fournit plusieurs outils et commandes pour vous aider à diagnostiquer les problèmes et à résoudre les problèmes de vos conteneurs. Voici quelques outils essentiels de débogage Docker :

1. **Journaux Docker** : 
   - Description : Affiche les journaux d'un conteneur en cours d'exécution.
   - Commande : `docker logs <nom_du_conteneur>` ou `docker logs <ID_du_conteneur>`

2. **Docker Exec** :
   - Description : Exécute des commandes à l'intérieur d'un conteneur en cours d'exécution.
   - Commande : `docker exec -it <nom_du_conteneur> /bin/bash` (ou `/bin/sh`)

3. **Docker-Compose avec --no-cache** :
   - Description : Construit des images sans utiliser le cache, ce qui peut être utile pour éviter les problèmes potentiels.
   - Commande : `docker-compose build --no-cache`

4. **Liste de tous les conteneurs Docker** :
   - Description : Affiche tous les conteneurs Docker, y compris ceux qui ne sont plus en cours d'exécution.
   - Commande : `docker ps -a`