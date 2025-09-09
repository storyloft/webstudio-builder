FROM node:20-alpine

WORKDIR /app
RUN corepack enable

COPY pnpm-workspace.yaml ./
COPY package.json pnpm-lock.yaml ./
COPY packages ./packages
COPY apps ./apps

RUN pnpm install --frozen-lockfile

EXPOSE 8787
ENV PORT=8787 NODE_ENV=production

CMD ["pnpm", "--filter", "@webstudio-is/builder", "dev"]
