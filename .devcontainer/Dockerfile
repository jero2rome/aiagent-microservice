# .devcontainer/Dockerfile
FROM mcr.microsoft.com/vscode/devcontainers/python:3.9

# Install Poetry
USER root
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="/home/vscode/.local/bin:$PATH"

# (Optional) Install Docker CLI, Docker Compose, Dapr CLI, etc.
RUN apt-get update && apt-get install -y docker.io docker-compose

# Switch back to vscode user
USER vscode
