# Use an existing docker image as a base
FROM debian:bullseye-slim

# Set the maintainer
LABEL maintainer="limrod.15@gmail.com"
LABEL image.author.name "Lila Maciel Rodriguez Perez"
LABEL image.author.email "limrod.15@gmail.com"

# Avoid prompts with tzdata
ENV DEBIAN_FRONTEND=noninteractive

# Update and install all the necessary packages
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    libncurses5-dev \
    bzip2 \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev

# Download and install samtools
WORKDIR /tmp
RUN wget https://github.com/samtools/samtools/releases/download/1.17/samtools-1.17.tar.bz2
RUN tar -xjf samtools-1.17.tar.bz2
WORKDIR /tmp/samtools-1.17
RUN ./configure --prefix=/usr && make && make install

# Clean up
WORKDIR /
RUN rm -rf /tmp/samtools-1.17