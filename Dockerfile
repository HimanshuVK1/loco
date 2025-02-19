# Stage 1: Build
FROM node:18 AS builder
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .

# Stage 2: Deploy
FROM node:18-slim
WORKDIR /app
COPY --from=builder /app .
EXPOSE 80
CMD ["npm", "start"]