FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./
COPY prisma ./prisma/


RUN npm install
RUN apk add --no-cache openssl

COPY . .

RUN npx prisma generate
RUN npm run build

FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache openssl netcat-openbsd dos2unix

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/prisma ./prisma
COPY start.sh ./
RUN dos2unix start.sh && chmod +x start.sh

EXPOSE 3000

CMD [ "./start.sh" ]
