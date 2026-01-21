FROM node:18-alpine

WORKDIR /app

# Copiar arquivos de dependências
COPY package.json package-lock.json ./

# Instala dependências de produção sem exigir lock perfeito
RUN npm install --omit=dev --no-audit --no-fund

# Copiar código
COPY src ./src

ENV NODE_ENV=production

EXPOSE 3001

CMD ["node", "src/index.js"]
