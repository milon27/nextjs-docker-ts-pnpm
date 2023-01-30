# # ------------------ dev build -------------------
FROM node:18.13.0-alpine as build_dev
RUN npm install -g pnpm

WORKDIR /app

COPY package.json ./
COPY pnpm-lock.yaml ./
RUN pnpm install

COPY . .
COPY .env.dev ./.env

RUN npm run build

# # ------------------dev -------------------

FROM node:18.13.0-alpine as dev

WORKDIR /app

COPY --from=build_dev /app/.env .
COPY --from=build_dev /app/package.json .
COPY --from=build_dev /app/pnpm-lock.yaml .
COPY --from=build_dev /app/next.config.js ./next.config.js
COPY --from=build_dev /app/node_modules/ ./node_modules/
COPY --from=build_dev /app/public/ ./public/
COPY --from=build_dev /app/.next/ ./.next/

CMD ["/bin/sh", "-c", "npm start"]


# # ------------------staging build-------------------

FROM node:18.13.0-alpine as build_staging
RUN npm install -g pnpm

WORKDIR /app

COPY package.json ./
COPY pnpm-lock.yaml ./
RUN pnpm install

COPY . .
COPY .env.staging ./.env

RUN npm run build

# # ------------------ staging -------------------
FROM node:18.13.0-alpine as staging

WORKDIR /app

COPY --from=build_staging /app/.env .
COPY --from=build_staging /app/package.json .
COPY --from=build_staging /app/pnpm-lock.yaml .
COPY --from=build_staging /app/next.config.js ./next.config.js
COPY --from=build_staging /app/node_modules/ ./node_modules/
COPY --from=build_staging /app/public/ ./public/
COPY --from=build_staging /app/.next/ ./.next/

CMD ["/bin/sh", "-c", "npm start"]
