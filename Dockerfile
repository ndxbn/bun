FROM  oven/bun:alpine@sha256:3476c857e7c05a7950b3a8a684ffbc82f5cbeffe1b523ea1a92bdefc4539dc57

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lock ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
