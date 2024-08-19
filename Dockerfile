FROM  oven/bun:alpine

COPY tsconfig.prod.json ./
COPY bun.prod.toml ./bun.toml
COPY server.ts cli.ts ./
COPY src/ ./
COPY package.json bun.lockb ./

RUN bun install --frozen-lockfile
ENTRYPOINT ["bun"]
CMD ["run", "start"]
