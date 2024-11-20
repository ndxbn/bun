FROM  oven/bun:alpine@sha256:4411b2e94e64d26f871736f028b82790a84e7a851469f52f61c81fc6bbbbf901

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lockb ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
