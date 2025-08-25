FROM  oven/bun:alpine@sha256:02564b43c26a0dc156ff4b70d7ccb68ebae5c486771d699ed1520c42e6ac5cb0

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lock ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
