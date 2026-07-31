# Extracted from: akshayyelne/State-Based-NLP/services/premium_service.py
# Generated: 2026-07-31T00:49:45.435Z

```python
def calculate_premium(coverage, vehicle_year):
  base = 500

  if coverage.lower() == "premium":
      base += 300

  age = 2025 - int(vehicle_year)

  if age > 10:
      base += 200
  elif age > 5:
      base += 100

  return base

```
