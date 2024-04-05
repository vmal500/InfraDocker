#!/bin/bash

# Réinitialisation de UFW et autorisation du trafic entrant sur les ports TCP 22 et 80
ufw --force reset
ufw allow 22/tcp
ufw allow 80/tcp
ufw --force enable

# Démarrage du service SSH
service ssh start

# Démarrage du service Apache2
service apache2 start

# Créer un fichier auth.log vide
touch /var/log/auth.log

# Définir le propriétaire et le groupe sur root
chown root:root /var/log/auth.log

# Définir les permissions appropriées
chmod 644 /var/log/auth.log

# Démarrage du service fail2ban
service fail2ban start

# Rendre les pages accessibles via le navigateur local
chmod -R 755 /var/www/html

# Démarrage de rsyslogd en arrière-plan
rsyslogd &

# Garder le script en cours d'exécution
tail -f /dev/null
