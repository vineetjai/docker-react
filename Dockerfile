# Specify base image for node
FROM node:alpine as builder
WORKDIR '/app'
#Install some dependencies and copying files/folders
COPY package.json .
RUN npm install
COPY . .
# command
CMD ["npm", "run", "build"]


# /app/build <= we care about this folders


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
