# Use Node 20 LTS (officially supported by Medusa)
FROM node:20-alpine

# Set working directory
WORKDIR /app/my-store

# Copy your already-initialized Medusa project
COPY ./my-store /app/my-store

# Install dependencies
RUN npm install

# Expose Medusa API port
EXPOSE 9000

# Start Medusa server
CMD ["npm", "run", "start"]
