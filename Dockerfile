# ==============================
# 1. Base image
# ==============================

# A. Utilise l'image suivante debian:stable-slim

# ==============================
# Installe Nginx
# ==============================

RUN apt-get update

# B. Installer nginx en utilisant apt

RUN apt-get install unzip curl -y

WORKDIR /app

# ==============================
# Remove default config
# ==============================
RUN rm /etc/nginx/sites-enabled/default

RUN rm -rf /usr/share/nginx/html/*

# ==============================
# Copy custom config
# ==============================
COPY nginx.conf /etc/nginx/nginx.conf


# ==============================
# Copy static website
# ==============================

# C. télécharge le fichier main.zip depuis cette url : https://github.com/vincent-agi/fake-military-dashboard/archive/refs/heads/main.zip
# Astuce : utiliser la commande curl -OL
/
# D. dezippe (commande unzip) le fichier main.zip, tu obtiendras le dossier fake-military-dashboard-main avec les site à l'intérieur

# E. Copie (commande cp -r) le contenu du dossier fake-military-dashboard-main dans le chemin /usr/share/nginx/html/ 

# ==============================
# Expose port
# ==============================
EXPOSE 80

# ==============================
# Start Nginx in foreground
# ==============================
CMD ["nginx", "-g", "daemon off;"]

