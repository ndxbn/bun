FROM  oven/bun:alpine@sha256:37e6b1cbe053939bccf6ae4507977ed957eaa6e7f275670b72ad6348e0d2c11f

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lock ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
