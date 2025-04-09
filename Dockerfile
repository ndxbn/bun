FROM  oven/bun:alpine@sha256:395f8524ee2eaad681a70846afdc63afa7f57e8f8e91935e12106c5daab592c0

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lock ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
