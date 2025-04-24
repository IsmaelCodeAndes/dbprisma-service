FROM node:18-alpine

WORKDIR /app

# Instala pnpm y Prisma CLI
RUN npm install -g pnpm prisma

# Copia los archivos necesarios para Prisma
COPY package*.json ./
COPY pnpm-lock.yaml ./
COPY prisma ./prisma/

RUN pnpm install --frozen-lockfile

# Comando por defecto: solo ejecuta migraciones
CMD ["npx", "prisma", "migrate", "deploy"]
