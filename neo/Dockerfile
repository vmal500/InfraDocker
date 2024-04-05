# Utiliser l'image de base Ubuntu
FROM ubuntu:latest

# Installer rsyslog
RUN apt-get update && apt-get install -y rsyslog ufw

# Copier la configuration rsyslog à l'emplacement approprié avec le droit root
COPY --chown=root:root ./rsyslog.conf /etc/rsyslog.conf

# Copier le script neo.sh dans le conteneur
COPY ./neo.sh /neo.sh

# Donner les permissions d'exécution au script
RUN chmod +x /neo.sh

# Démarrer le service rsyslog en arrière-plan
ENTRYPOINT [ "/bin/sh", "/neo.sh" ]