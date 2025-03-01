# tests/test_app.py
from fastapi.testclient import TestClient
from src.app import app

client = TestClient(app)

def test_root():
    response = client.get("/")
    assert response.status_code == 200
    data = response.json()
    assert "status" in data
    assert data["status"] == "ok"

def test_generate_reply_endpoint():
    response = client.post("/generate_reply", json={"message": "Hello"})
    assert response.status_code == 200
    data = response.json()
    assert "reply" in data
    assert "Mock reply" in data["reply"]
