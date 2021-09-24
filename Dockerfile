FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
# build files in /app/build
RUN npm run build 

FROM nginx
# 80 is the default port for nginx.
# ElasticBeanStalk will map this port automatically for incoming traffic.
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
