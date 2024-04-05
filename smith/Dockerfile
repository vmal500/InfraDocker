# Utiliser le système Kali Linux de base
FROM kalilinux/kali-rolling:latest

# Installer les outils nécessaires pour la journalisation et l'analyse réseau
RUN apt-get update && apt-get install -y rsyslog curl tcpdump openssh-client

# Créer un utilisateur nommé 'smith' avec le mot de passe 'smith'
RUN useradd --create-home --shell /bin/bash smith && \
    echo 'smith:smith' | chpasswd && \
    usermod -aG sudo smith  

# Copie du script de démarrage dans le conteneur
COPY ./smith.sh /smith.sh

# Copier la configuration rsyslog à l'emplacement approprié avec le droit root
COPY --chown=root:root ./rsyslog.conf /etc/rsyslog.conf

# Donner les permissions d'exécution au script
RUN chmod +x /smith.sh

# Démarrer le service de journalisation lorsque le conteneur s'exécute
ENTRYPOINT [ "/bin/sh", "/smith.sh" ]