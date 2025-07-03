FROM  oven/bun:alpine@sha256:a7df687a2f684ee2f7404e2592039e192d75d26a04f843e60d9fc342741187d0

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lock ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
