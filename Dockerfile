FROM php:8.2-apache

# Enable PostgreSQL extensions
RUN docker-php-ext-install pdo pdo_pgsql pgsql

# Copy your PHP app
COPY . /var/www/html/

# Render uses port 10000
ENV PORT=10000
EXPOSE 10000

# Update Apache to use Render port
RUN sed -i 's/80/10000/g' /etc/apache2/ports.conf \
 && sed -i 's/:80/:10000/g' /etc/apache2/sites-available/000-default.conf
