FROM  oven/bun:alpine@sha256:adda30fd4db7d8ef9a2113cb935c6f751de3daad39373713b56eefe49db78471

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lock ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
