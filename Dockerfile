FROM  oven/bun:alpine@sha256:7dc0e33a62cbc1606d14b07706c3a00ae66e8e9d0e81b83241ed609763e66d55

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lock ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
