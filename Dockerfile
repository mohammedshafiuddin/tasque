# Step 1: Use an official Node.js image
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 443

CMD ["node", "dist/main.js"]    
