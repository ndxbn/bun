FROM  oven/bun:alpine@sha256:3b903177af1ffc30de30dcf7ba13285cbe434e75e711d8a4b1250af67fbbe91e

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lockb ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
