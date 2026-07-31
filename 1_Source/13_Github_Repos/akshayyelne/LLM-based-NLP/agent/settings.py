# Extracted from: akshayyelne/LLM-based-NLP/agent/settings.py
# Generated: 2026-07-31T00:49:45.221Z

```python
import os
import streamlit as st

GROQ_API_KEY = st.secrets.get("GROQ_API_KEY") or os.getenv("GROQ_API_KEY")

if not GROQ_API_KEY:
    raise ValueError("Missing GROQ_API_KEY")

LLM_MODEL = "llama-3.3-70b-versatile"
LLM_TEMPERATURE = 0.1

```
