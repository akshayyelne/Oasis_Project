# Extracted from: akshayyelne/State-Based-NLP/services/underwriting_engine.py
# Generated: 2026-07-31T00:49:45.436Z

```python
from validation_engine import calculate_age

def evaluate_risk(slots):

    age = calculate_age(slots["dob"])
    vehicle_year = int(slots["vehicle_year"])

    # Decline rules
    if age < 21:
        return "DECLINED"

    if 2025 - vehicle_year > 20:
        return "DECLINED"

    # Refer rules
    if age < 25:
        return "REFERRED"

    return "APPROVED"

```
