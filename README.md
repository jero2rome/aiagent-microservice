# My AI Agent

A mock AI agent using FastAPI, Poetry, and (in future) Dapr, LangGraph, and OpenAI. Currently mocking ChatGPT API calls to save costs.

## Features

- FastAPI application with a `/generate_reply` endpoint
- Docker & Docker Compose setup
- DevContainer for VSCode
- Pytest for testing
- Poetry for Python dependency management
- Ready to be extended with Dapr sidecar for inter-service communication

## Getting Started

1. Clone this repo.
2. Install dependencies: `poetry install`.
3. Run dev server: `poetry run uvicorn src.app:app --reload --host 0.0.0.0 --port 8000`.
4. Open [http://localhost:8000/docs](http://localhost:8000/docs) for the interactive API docs.
5. Post to `/generate_reply` with a JSON body, e.g.:
   ```json
   {
     "message": "Hello, agent!"
   }
