FROM  oven/bun:alpine@sha256:f6c70b20b96d25b7374cb2f474030a74e78fcdbc6e37c0b3c580d2834051746f

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lockb ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
