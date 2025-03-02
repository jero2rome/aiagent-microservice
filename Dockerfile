FROM python:3.9-slim

# Install Poetry
ENV POETRY_VERSION=1.5.1
RUN pip install poetry==$POETRY_VERSION

WORKDIR /app

# Copy dependency files and install dependencies using Poetry
COPY pyproject.toml poetry.lock* /app/
RUN poetry config virtualenvs.create false && poetry install --no-interaction --no-ansi

# Copy application code into the container
COPY . /app

EXPOSE 8000

# Start Uvicorn with auto-reload; Codespaces will handle debugging automatically.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
