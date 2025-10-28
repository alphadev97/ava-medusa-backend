# Medusa v2 requires Node >= 20
FROM node:20-alpine AS base
WORKDIR /app

# Install CLI and scaffold the project ONCE at build time
RUN npm install -g @medusajs/medusa-cli \
  && medusa new my-store --seed --skip-db --skip-git --force \
  && cd my-store && npm install

# ---- Runtime ----
FROM node:20-alpine AS runtime
WORKDIR /app/my-store

# copy built project from the builder stage
COPY --from=base /app/my-store /app/my-store

# Expose Medusa port
EXPOSE 9000

# Start Medusa server
CMD ["npm", "run", "start"]
