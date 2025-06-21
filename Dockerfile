FROM  oven/bun:alpine@sha256:6cb88d90f8a96249e272ba877885d5251a77e1d7a44b4d89565ded015fe5be2d

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lock ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
