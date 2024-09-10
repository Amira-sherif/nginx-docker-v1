# Use Ubuntu as the base image
FROM amirasherifkamel/nginx:v1.0

# Set environment variables to non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
COPY index.html var/www/http/index.html

# Expose ports (optional, based on your needs)
EXPOSE 80

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

