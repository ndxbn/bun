FROM  oven/bun:alpine@sha256:b5d37e653d1b86f23c15ecac4f3f9b4a5572045f16258637e033a2b16b317926

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lock ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
