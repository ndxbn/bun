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

- [Bun](https://bun.sh/)
- [Docker](https://docker.com/) or [podman](https://podman.io/)

## Getting Start

```bash
# clone this repository
git clone XXX
cd XXX
# install dependencies
bun install
# setup development environment, initialize application
bun dev
# run middleware
docker compose up -d # or `podman compose up -d`
# run CLI application
bun cli -h
#   or start server
bun start
```

## Testing

```bash
bun test
```

## What to use Docker

- startup Middlewares
- [lint GitHub Action](./.github/lint.compose.yaml): do `cd .github` before run it
