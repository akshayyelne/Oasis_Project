# Extracted from: akshayyelne/LLM-based-NLP/agent/graph.py
# Generated: 2026-07-31T00:49:45.220Z

```python
"""
Graph entrypoint for the LangChain Documentation Assistant.

This module exposes the compiled LangGraph agent so other parts
of the application (UI, API, services) can import it without
knowing the internal graph implementation details.
"""

from agent.docs_graph import docs_agent

__all__ = ["docs_agent"]

```
