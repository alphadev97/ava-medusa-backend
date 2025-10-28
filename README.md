# AVA Medusa Backend

Git-based deployment for Medusa v2 on Coolify.

## Files
- Dockerfile: builds a Node 20 image and scaffolds Medusa once.
- docker-compose.yml: service definition (envs injected by Coolify).

## Run (local, optional)
cp .env.example .env
# adjust envs for local DB/Redis or use Coolify URLs if reachable
docker compose up --build
