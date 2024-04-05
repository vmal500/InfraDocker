#!/bin/bash

# Rendez le script exécutable avec la commande chmod +x docker-cleaner.sh
# Ensuite, vous pouvez exécuter le script pour nettoyer les ressources Docker en exécutant ./docker-cleaner.sh

# Arrêter tous les conteneurs en cours d'exécution
echo "Arrêt de tous les conteneurs en cours d'exécution..."
docker stop $(docker ps -q) 2>/dev/null

# Supprimer tous les conteneurs
echo "Suppression de tous les conteneurs..."
docker rm -f $(docker ps -aq) 2>/dev/null

# Supprimer les images, réseaux, volumes et le cache de construction non utilisés
echo "Exécution du nettoyage du système..."
docker system prune -af

echo "Nettoyage terminé!"
