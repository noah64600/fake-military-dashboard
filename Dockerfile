# ==============================
# 1. Base image
# ==============================

# A. Utilise l'image suivante debian:stable-slim comme base


# ==============================
# Installe Nginx
# ==============================

RUN apt-get update -y

# B. Installer nginx en utilisant apt

WORKDIR /app

# ==============================
# Remove default config
# ==============================
RUN rm -rf /etc/nginx/sites-enabled/default

RUN rm -rf /usr/share/nginx/html/*

# ==============================
# Copy custom config
# ==============================
COPY nginx.conf /etc/nginx/nginx.conf


# ==============================
# Copy static website
# ==============================

# C. Copier le dossier military-dashboard dans /usr/share/nginx/html

# ==============================
# Expose port
# ==============================
EXPOSE 80

# ==============================
# Start Nginx in foreground
# ==============================
CMD ["nginx", "-g", "daemon off;"]

