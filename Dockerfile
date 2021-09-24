FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
# build files in /app/build
RUN npm run build 

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
