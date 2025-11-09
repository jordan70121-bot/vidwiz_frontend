# Use a base image with Flutter SDK installed
FROM cirrusci/flutter:latest

# Set working directory
WORKDIR /app

# Copy everything from your repo into the container
COPY . .

# Enable Flutter web
RUN flutter config --enable-web

# Get dependencies
RUN flutter pub get

# Build the web app
RUN flutter build web

# Expose port 8080 for Render
EXPOSE 8080

# Serve the built web app using a simple web server
CMD ["flutter", "run", "-d", "web-server", "--web-port=8080", "--web-hostname=0.0.0.0"]
