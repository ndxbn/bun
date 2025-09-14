FROM  oven/bun:alpine@sha256:ab596b6d0dcad05d23799b89451e92f4cdc16da184a9a4d240c42eaf3c4b9278

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lock ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
