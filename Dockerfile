FROM  oven/bun:alpine@sha256:ae1ee3f0e326ad8ae886bd500929e7f4fcb4986a1455d6d6ab2f3c2498036aad

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lockb ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
