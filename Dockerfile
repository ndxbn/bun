FROM  oven/bun:alpine@sha256:92a7a5ec007152b8669d83f42a9351a678a48534ee047ea7ac479262376886ad

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lockb ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
