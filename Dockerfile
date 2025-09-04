FROM ubuntu:22.04

# Prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies: python, tmate, curl, etc.
RUN apt update && \
    apt install -y python3 python3-pip curl wget git tmate && \
    apt clean && rm -rf /var/lib/apt/lists/*

# Create working directory and dummy index
WORKDIR /app
RUN echo "Tmate session is running on Render 🚀" > index.html

# Render requires a web service, so expose port 10000 (default Render)
EXPOSE 10000

# Start Python web server and tmate
CMD python3 -m http.server 10000 & \
    tmate -F
