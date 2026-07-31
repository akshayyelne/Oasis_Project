# Extracted from: akshayyelne/State-Based-NLP/utils/logger.py
# Generated: 2026-07-31T00:49:45.440Z

```python
import logging
import os

LOG_FILE = "insurance_system.log"

def setup_logger():
    logging.basicConfig(
        filename=LOG_FILE,
        level=logging.INFO,
        format="%(asctime)s | %(levelname)s | %(message)s"
    )

def get_logger(name: str):
    return logging.getLogger(name)

```
