#!/bin/bash

# Démarrage de rsyslogd en arrière-plan
rsyslogd &

# Garde le script en cours d'exécution
tail -f /dev/null
