# Use the official Node.js image.
FROM node:latest

# Set the working directory.
WORKDIR /usr/src/app

# Copy package.json and package-lock.json.
COPY package*.json ./

# Install dependencies.
RUN npm install

# Copy the rest of your application code.
COPY . .

# Expose the port your app will run on.
EXPOSE 3000

# Command to run your app.
CMD ["node", "server.js"]