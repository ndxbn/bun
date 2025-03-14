FROM  oven/bun:alpine@sha256:7e2dca828e045e25c417b9b476445e4461424bb74df8288956b820057f2ece4c

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lock ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
