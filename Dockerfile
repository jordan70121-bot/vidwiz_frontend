# Step 1: Build the Flutter web app
FROM ghcr.io/cirruslabs/flutter:latest AS build

WORKDIR /app

# Copy the Flutter project files
COPY . .

# Enable web support (ensure Flutter is set up for web)
RUN flutter config --enable-web

# Get dependencies
RUN flutter pub get

# Build the web app
RUN flutter build web --release

# Step 2: Serve using Nginx
FROM nginx:alpine

# Copy Flutter web build files to Nginx HTML directory
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose the web port
EXPOSE 80

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
