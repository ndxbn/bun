FROM  oven/bun:alpine@sha256:e8e1d291c25b617d7dda08c839fe00d1524a8ccb253c37eb8e9c6e0525da3c89

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lock ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
