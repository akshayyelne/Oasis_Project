# Extracted from: akshayyelne/State-Based-NLP/services/claim_statusengine.py
# Generated: 2026-07-31T00:49:45.433Z

```python
import sqlite3
from datetime import datetime
from config import DB_PATH


def update_claim_status(claim_id, new_status):

    with sqlite3.connect(DB_PATH) as conn:
        cursor = conn.cursor()
        cursor.execute(
            """
            UPDATE Claims
            SET status=?, last_updated=?
            WHERE claim_id=?
            """,
            (
                new_status,
                datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                claim_id
            )
        )
        conn.commit()

```
