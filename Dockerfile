# 1. Start with a base image that already has Node.js installed.
FROM node:18-alpine

# 2. Set the working directory inside the container.
WORKDIR /app

# 3. Copy the dependency file and install dependencies.
# We copy this first to take advantage of Docker's caching.
COPY package*.json ./
RUN npm install

# 4. Copy the rest of our application's source code.
COPY . .

# 5. Tell Docker that the container listens on port 3000.
EXPOSE 3000

# 6. Define the command to run when the container starts.
CMD ["npm", "start"]