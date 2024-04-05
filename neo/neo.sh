#!/bin/bash

# Réinitialisation de UFW et autorisation du trafic entrant sur les ports TCP 514 et UDP 514
ufw --force reset
ufw allow 514/tcp
ufw allow 514/udp
ufw --force enable

# Démarrage de rsyslogd en arrière-plan
rsyslogd &

# Garde le script en cours d'exécution
tail -f /dev/null
