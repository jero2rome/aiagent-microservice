from fastapi import FastAPI, Body
from pydantic import BaseModel
# from langgraph import Graph  # if you need it for more complex flows, else just keep it simple

app = FastAPI(title="MyMockAIAgent")

class UserRequest(BaseModel):
    message: str

class AIResponse(BaseModel):
    reply: str

@app.get("/")
def root():
    return {"status": "ok", "message": "Hello from MyMockAIAgent"}

@app.post("/generate_reply", response_model=AIResponse)
def generate_reply_endpoint(req: UserRequest = Body(...)):
    """
    Mock endpoint that pretends to generate an AI response.
    Replace this logic later with real OpenAI calls + LangGraph flows.
    """
    user_message = req.message
    # Mock logic:
    # 1) Do any processing or call a mock function.
    # 2) Return a fake AI response.
    fake_response = f"Mock reply to '{user_message}'"
    return AIResponse(reply=fake_response)
