# Use Kali Linux as the base image
FROM kalilinux/kali-rolling:latest

# Install dependencies and tools
RUN apt-get update && \
    apt-get install -y \
    kali-linux-large \
    curl \
    gnupg \
    nodejs \
    npm \
    && apt-get clean

# Install Wetty
RUN npm install -g wetty

# Create a non-root user
RUN useradd -ms /bin/bash user
USER user
WORKDIR /home/user

# Set environment variables
ENV PORT=3000
ENV HOST=0.0.0.0

# Expose the port
EXPOSE 3000

# Start Wetty
CMD ["wetty", "--port", "3000", "--host", "0.0.0.0", "bash"]

