#
[![Bun](https://img.shields.io/badge/Bun-000?logo=bun&logoColor=fff)](https://bun.sh/)

[![Formatted with Biome](https://img.shields.io/badge/Formatted_with-Biome-60a5fa?style=flat&logo=biome)](https://biomejs.dev/)
[![Linted with Biome](https://img.shields.io/badge/Linted_with-Biome-60a5fa?style=flat&logo=biome)](https://biomejs.dev)

This project is created by `bun create ndxbn/bun`.

- TypeScript config is based on "strictest"
- Dockerfile for production, docker-compose for development
- entrypoint files
  - `bun run cli` (or `bunx THIS_PACKAGE`): [cli.ts](./cli.ts)
  - `bun run start` and/or `docker-compose up`: [server.ts](./server.ts)
  - `import from "THIS_REPO"`: [index.ts](./index.ts)

## Install & Run

```bash
bun install
bun run start
```
