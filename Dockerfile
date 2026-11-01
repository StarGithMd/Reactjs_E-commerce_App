# Stage 1: Build the React application
FROM node:16-alpine AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve in production using Nginx on Port 80
FROM nginx:stable-alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

FOF

$ cat > docker-compose.yml << EOF
version: '3.8'

services:
  react-app:
    image: doch2/dev:latest
    container_name: react-ecommerce-app
    ports:
      - "80:80"
    restart: always

