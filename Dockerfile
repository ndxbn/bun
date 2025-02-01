FROM  oven/bun:alpine@sha256:fbf0f725b6915079da7d6f175f3843281b470e9684aff5feae6bbf785e005a7b

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lockb ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
