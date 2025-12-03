FROM node:18-slim

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies (vulnerable version)
RUN npm install

# Copy source files
COPY src/ ./src/
COPY webpack.config.js ./

# Expose port
EXPOSE 3002

# Start vulnerable server
CMD ["node", "--conditions", "react-server", "--conditions", "webpack", "src/server.js"]

