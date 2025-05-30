FROM  oven/bun:alpine@sha256:37b37b8cefbf88956d4cbecbc5b3ac4b3f1a9fb051f745c98a4bc6f5f285aacb

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lock ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
