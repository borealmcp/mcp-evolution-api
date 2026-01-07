FROM node:18-alpine

WORKDIR /app

# Copiar arquivos de dependências
COPY package*.json ./
RUN npm ci --only=production

# Copiar arquivos de código compilado
COPY src ./src

# Definir variáveis de ambiente padrão
ENV NODE_ENV=production

# Expor a porta para WebSocket (opcional, usada se WebSocket estiver habilitado)
EXPOSE 3000

# Comando para iniciar o servidor
CMD ["node", "src/index.js"] 
