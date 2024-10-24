# XXX
This project is created by `bun create ndxbn/bun`.

- TypeScript config is based on "strictest"
- Dockerfile for production, docker-compose for development
- entrypoint files
  - `bun run cli` (or `bunx THIS_PACKAGE`): [cli.ts](./cli.ts)
  - `bun run start` or `docker-compose up`: [server.ts](./server.ts)
  - `import from "THIS_REPO"`: [index.ts](./index.ts) 

## Install & Run

```bash
bun install
bun run start
```
