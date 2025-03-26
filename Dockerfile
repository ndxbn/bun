FROM  oven/bun:alpine@sha256:039a0f94f9b59fb0cef929cc66b7199c3af5ca384eab2af9284a3a61b322135c

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lock ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
