# Step 1: Use an official Node.js image
FROM node:18-alpine

# Step 2: Set the working directory in the container
WORKDIR /usr/src/app

# Step 3: Copy the package.json and package-lock.json
COPY package*.json ./

# Step 4: Install the app dependencies
RUN npm install

# Step 5: Copy the rest of the app source code
COPY . .

# Step 6: Expose the app port
EXPOSE 443

# Step 7
CMD ["node", "index.js"]
