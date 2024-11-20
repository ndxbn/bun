FROM  oven/bun:alpine@sha256:937b2625ab04b95531cb776a7dd39970ede04b406b63f964654edc67308900b2

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lockb ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
