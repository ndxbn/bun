FROM  oven/bun:alpine@sha256:60179f5ab9a193228941d94b6e0570f152aea0ac092d5df14f4f2c4fbd8f3ca8

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lock ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
