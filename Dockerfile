FROM  oven/bun:alpine@sha256:66169513f6c6c653b207a4f198695a3a9750ed0ae7b1088d4a8fc09a3a0d41dc

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lock ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
