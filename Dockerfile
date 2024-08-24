# Use the Kali Linux base image
FROM kalilinux/kali-rolling

# Update package list and install necessary packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        git \
        neofetch \
        python3 \
        python3-pip \
        build-essential \
        cmake \
        libjson-c-dev \
        libwebsockets-dev \
        libssl-dev \
        zlib1g-dev \
        kali-tools-top10 \
    && apt-get clean

# Install ttyd
RUN mkdir /ttyd && \
    cd /ttyd && \
    git clone https://github.com/tsl0922/ttyd.git && \
    cd ttyd && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install

# Set up ttyd to run on port 8080
EXPOSE 8080

# Command to start ttyd with bash
CMD ["ttyd", "-p", "8080", "bash"]
