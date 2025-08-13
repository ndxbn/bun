FROM  oven/bun:alpine@sha256:5ade1ec6fc2b74f825d48d33d98d7450fb960426d5d0df9a8f27b419da832012

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lock ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
