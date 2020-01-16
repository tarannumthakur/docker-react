#Getting base image
FROM node:alpine as builder

#changing or creating image current working directory
WORKDIR /app

#copying file to image current working directory
COPY package.json .

#running command
RUN npm install

#coying everything form current directory to image current directory
COPY . .

RUN npm run build

FROM nginx
EXPOSE 80
#coypying build folder from builder stage to nginx 
COPY --from=builder /app/build /usr/share/nginx/html