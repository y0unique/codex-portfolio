# Use the official Apache image
FROM httpd:2.4

# Copy your HTML and assets into Apache's web root
COPY ./ /usr/local/apache2/htdocs/

# Expose Render's port
ENV PORT=10000
EXPOSE 10000

# Optional: set Apache to listen on Render's port
RUN sed -i 's/Listen 80/Listen 10000/' /usr/local/apache2/conf/httpd.conf
