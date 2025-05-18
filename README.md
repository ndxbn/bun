#
[![Bun](https://img.shields.io/badge/Bun-000000?logo=bun&logoColor=white&labelColor=grey)](https://bun.sh/)
[![Formatted and Linted with Biome](https://img.shields.io/badge/Biome-60a5fa?logo=biome&labelColor=grey)](https://biomejs.dev/)
[![Lefthook](https://img.shields.io/badge/Lefthook-ff1e1e?logo=Lefthook&logoColor=ff1e1e&labelColor=grey)](https://lefthook.dev/)

This project is created by `bun create ndxbn/bun`.

- TypeScript config is based on "strictest"
- Dockerfile for production, docker-compose for development
- entrypoint files
  - [index.ts](./src/index.ts): `import from "THIS_REPO"` from outside
  - [cli.ts](src/cli.ts): `bun cli`
  - [server.ts](src/server.ts): `bun start`

## Requirements

- [Bun](https://bun.sh/)
- [Docker](https://docker.com/) or [podman](https://podman.io/)

## Getting Start

```bash
# start middlewares
docker compose up -d
# install modules
bun install
# prepare development environment
bun dev
# run main script
bun start
```

## Testing

```bash
bun test
```

## What to use Docker

- startup Middlewares
- [lint GitHub Action](./.github/lint.compose.yaml): do `cd .github` before run it
