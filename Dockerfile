FROM node:15.2-alpine3.10 as build
WORKDIR /app
RUN curl -sfL https://install.goreleaser.com/github.com/tj/node-prune.sh | bash -s -- -b /usr/local/bin
COPY . ./app
RUN npm i && npm run build

RUN npm prune --production
RUN /usr/local/bin/node-prune

# production environment
FROM nginx:stable-alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]