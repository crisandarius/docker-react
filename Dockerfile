FROM node:alpine AS buildImage
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=buildImage /app/build /usr/share/nginx/html
# btw, it starts automatically



