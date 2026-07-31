# Extracted from: akshayyelne/LLM-based-NLP/agent/config.py
# Generated: 2026-07-31T00:49:45.218Z

```python

import logging
from langchain_groq import ChatGroq

from agent.settings import GROQ_API_KEY, LLM_MODEL, LLM_TEMPERATURE

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

llm = ChatGroq(
    model_name=LLM_MODEL,
    temperature=LLM_TEMPERATURE,
    groq_api_key=GROQ_API_KEY
)

__all__ = ["llm", "logger"]

```
