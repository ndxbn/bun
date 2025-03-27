FROM  oven/bun:alpine@sha256:711890300bfd97cf513184aa296241ba5c058906a3d8203ccc0ec102af55f5df

WORKDIR /home/bun/app
COPY tsconfig.json ./
COPY src/ ./src/
COPY scripts/ ./scripts/
COPY package.json bun.lock ./

ENV NODE_ENV=production
RUN bun install

ENTRYPOINT ["bun"]
CMD ["start"]
