---
trigger: always_on
---

container: podman kube
base image: wordpress:fpm-alpine
e-commerce: woocommerce
podman kube manifest: kubernetes.yml
podman nginx:
  fastcgi_pass: 127.0.0.1:9000
  nginx config file: nginx-conf/default.conf
php:
  fpm config file: php-config/www.conf
  wordpress ini file: php-config/wordpress.ini
podman systemd dir: services/
