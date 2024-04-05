# Utilisation de l'image de base Debian
FROM debian:latest

# Mise à jour des listes de paquets et installation des paquets nécessaires
RUN apt-get update &&  apt-get install -y rsyslog openssh-server apache2 fail2ban ufw


# Copie des configurations personnalisées
# Configuration de rsyslog
COPY --chown=root:root ./rsyslog.conf /etc/rsyslog.conf  
COPY --chown=root:root ./apache_access.log.conf /etc/rsyslog.d/apache_access.log.conf
COPY --chown=root:root ./apache_error.log.conf /etc/rsyslog.d/apache_error.log.conf
COPY --chown=root:root ./sshd_auth.log.conf /etc/rsyslog.d/sshd_auth.log.conf

# Configuration SSH personnalisée
COPY --chown=root:root ./sshd_config_custom /etc/ssh/sshd_config
# Configuration de fail2ban
COPY --chown=root:root ./jail.local /etc/fail2ban/jail.local               
# Fichiers de l'application
COPY --chown=root:root ./matrix /var/www/html/                   

# Création de l'utilisateur administratif
RUN useradd -m -s /bin/bash zion && \
    echo 'zion:zion' | chpasswd

# Copie du script de démarrage dans le conteneur
COPY ./zion.sh /zion.sh

# Donner les permissions d'exécution au script
RUN chmod +x /zion.sh

# Exécution du script de démarrage
ENTRYPOINT [ "/bin/sh", "/zion.sh" ]