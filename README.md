<!--
README は `bun create ndxbn/bun` で生成されたプロジェクトに新しくジョインしてきた開発者のために書きます。
`bun create ndxbn/bun` 自体の開発者のためのものではありません。
-->
#
[![Bun](https://img.shields.io/badge/Bun-000000?logo=bun&logoColor=white&labelColor=grey)](https://bun.sh/)
[![Formatted and Linted with Biome](https://img.shields.io/badge/Biome-60a5fa?logo=biome&labelColor=grey)](https://biomejs.dev/)
[![Lefthook](https://img.shields.io/badge/Lefthook-ff1e1e?logo=Lefthook&logoColor=ff1e1e&labelColor=grey)](https://lefthook.dev/)

This project is created by `bun create ndxbn/bun`.

- TypeScript config is based on "strictest"
- Dockerfile for production, docker-compose for development
- Entrypoint files
  - [index.ts](./src/index.ts): `import from "THIS_REPO"` from outside
  - [cli.ts](src/cli.ts): `bun cli`
  - [server.ts](src/server.ts): `bun start`

## Requirements

- [Bun](https://bun.sh/): Typescript Runtime
- [Docker](https://docker.com/) or [podman](https://podman.io/): Middleware Container Runtime

## Getting Start

```bash
git clone XXX && cd XXX
bun install
docker compose up -d # or `podman compose up -d`
bun cli init:app

bun cli -h
bun start
```

## Testing

```bash
bun test
```

