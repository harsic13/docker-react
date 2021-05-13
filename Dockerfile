#FROM node:alpine as builder
#as builder is used as a tag to mention everything from the FROM command to everything below it as builder phase
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#COPY --from=nginx /app/build /usr/share/nginx/html
COPY --from=0 /app/build /usr/share/nginx/html

#Used to denote copy something from a different phase
#Here we want to copy somthing from the builder phase

