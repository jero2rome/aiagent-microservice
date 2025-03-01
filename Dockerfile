# Dockerfile
FROM python:3.9-slim-buster AS builder

# Install system dependencies
RUN apt-get update && apt-get install -y curl build-essential

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="/root/.local/bin:$PATH"

# Create a virtual environment
WORKDIR /app

# Copy the pyproject.toml and poetry.lock first for better caching
COPY pyproject.toml poetry.lock /app/

# Install dependencies
RUN poetry install --no-root --only main

# Now copy the app code
COPY src/ /app/src

# ================
# Production stage
FROM python:3.9-slim-buster

# We'll copy from the builder image
COPY --from=builder /root/.local /root/.local
COPY --from=builder /app /app
ENV PATH="/root/.local/bin:$PATH"

WORKDIR /app

EXPOSE 8000

# Command to run your FastAPI app
CMD ["poetry", "run", "uvicorn", "src.app:app", "--host", "0.0.0.0", "--port", "8000"]
