# Step 1: Build Flutter web app
FROM cirrusci/flutter:latest as build

WORKDIR /app/lib
COPY . .
RUN flutter config --enable-web
RUN flutter pub get
RUN flutter build web

# Step 2: Serve using Nginx (Alpine Linux)
FROM nginx:alpine
COPY --from=build /app/lib/build/web /usr/share/nginx/html

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
