FROM  oven/bun:alpine@sha256:fa47bde9713df05cac86c013abbf1965a348f9de80a73c025a72510ef802d4d3

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lockb ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
