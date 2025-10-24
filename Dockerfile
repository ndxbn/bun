FROM  oven/bun:alpine@sha256:514fe15804f8ad3772ba323c2298daf121bb4b42386e2522998de5e87f16a94c

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lock ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
