FROM node:18-alpine
WORKDIR /src
COPY package*.json ./
RUN npm install
COPY . .

ENV DATABASE_HOST=db-postgres-cart.cbi8iv7qjpxl.us-east-1.rds.amazonaws.com
ENV DATABASE_PORT=5432
ENV DATABASE_NAME=postgres
ENV DATABASE_USERNAME=postgres
ARG DATABASE_PASSWORD
ENV DATABASE_PASSWORD=$DATABASE_PASSWORD

RUN npm run build
EXPOSE 3000
CMD [ "npm", "run", "start:prod" ]
