FROM  oven/bun:alpine@sha256:aa3c07503fe8097fd185aa1fa7a55ec99c1d9041586b0efb1ed6fc0bd6923803

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lockb ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
