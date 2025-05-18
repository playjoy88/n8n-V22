FROM node:18-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3 \
    build-essential && \
    rm -rf /var/lib/apt/lists/*

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Set environment variables
ENV N8N_PORT=5678
ENV NODE_ENV=production

# Expose port
EXPOSE 5678

# Start n8n
CMD ["npm", "start"]