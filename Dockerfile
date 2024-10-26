# FROM node:18 AS ui-builder

# WORKDIR /app

# COPY ui/package*.json ./

# RUN npm install

# RUN npm install -g typescript

# COPY ./ui .

# RUN npm run build

# Use an official Node.js runtime as a parent image
FROM node:18 AS builder

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application code
COPY . .

RUN rm -r ./ui

# Build the TypeScript code
RUN npm run build

# Use a smaller Node.js image for the final image
FROM node:18 AS production

# Set the working directory in the production container
WORKDIR /app

# Copy the built files and necessary dependencies from the builder stage
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/assets ./assets
# COPY --from=ui-builder /app/dist ./dist/public

# Install only production dependencies
RUN npm install --only=production

# Expose the port your app runs on
EXPOSE 3000

# Command to run your application
CMD ["node", "dist/index.js"]
