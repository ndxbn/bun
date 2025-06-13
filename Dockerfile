FROM  oven/bun:alpine@sha256:14beb61b5209e743341a80ff2b05e2eac0ccb794b03902e67735f85f731c2b52

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lock ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
