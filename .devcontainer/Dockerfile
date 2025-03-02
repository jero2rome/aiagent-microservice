# Use Microsoft’s Python DevContainer base image
FROM mcr.microsoft.com/vscode/devcontainers/python:3.9

# 1️⃣ Switch to vscode (default user) and install Poetry in user space
USER vscode
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="/home/vscode/.local/bin:$PATH"

# 2️⃣ Switch to root temporarily to install system-level dependencies
USER root
RUN apt-get update && apt-get install -y docker.io docker-compose

# 3️⃣ Switch BACK to vscode to avoid permission issues in the container
USER vscode
