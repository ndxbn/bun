FROM  oven/bun:alpine@sha256:d2bc1fbc3afcd3d70afc2bb2544235bf559caae2a3084e9abed126e233797511

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lock ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
