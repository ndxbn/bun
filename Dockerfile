FROM  oven/bun:alpine@sha256:fc66d85880a740870ff384fc344379715a8d5ffa7acf1e8ac07e90b46eea07e7

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lockb ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
