#  STEP 1 Build React project with node
FROM node:14-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# STEP 2 Create NGinx Server
FROM nginx:1.19.6-alpine AS prod-stage
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD [ "nginx","-g","daemon off;" ]
