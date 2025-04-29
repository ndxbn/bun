FROM  oven/bun:alpine@sha256:6b14922b0885c3890cdb0b396090af1da486ba941df5ee94391eef64f7113c61

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lock ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
