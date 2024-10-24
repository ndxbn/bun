FROM  oven/bun:alpine@sha256:3dc101cc42433f8a470da07701441afdb1aab4c6d056a291eb405e348c5a5c37

COPY tsconfig.prod.json ./
COPY bun.prod.toml ./bun.toml
COPY server.ts cli.ts ./
COPY src/ ./
COPY package.json bun.lockb ./

RUN bun install --frozen-lockfile
ENTRYPOINT ["bun"]
CMD ["run", "start"]
