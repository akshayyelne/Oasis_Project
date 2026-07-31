# Extracted from: akshayyelne/Mental-Health-Wellbeing/test_state_mapping.py
# Generated: 2026-07-31T00:49:45.275Z

```python
"""Verify every Streamlit UI input maps correctly to WellbeingState."""
import sys, os, types

for mod in ["streamlit", "langchain_core", "langchain_core.messages",
            "langchain_openai", "langgraph", "langgraph.graph"]:
    sys.modules.setdefault(mod, types.ModuleType(mod))
sys.modules["streamlit"].session_state = {}
sys.modules["langgraph.graph"].END = "END"
sys.modules["langgraph.graph"].START = "START"
sys.modules["langgraph.graph"].StateGraph = object
sys.modules["langchain_core.messages"].HumanMessage = object
sys.modules["langchain_core.messages"].SystemMessage = object
sys.modules["langchain_openai"].ChatOpenAI = object

import importlib.util
spec = importlib.util.spec_from_file_location(
    "agent",
    os.path.join(os.path.dirname(__file__), "ai_mental_wellbeing_agent (1).py"),
)
mod = importlib.util.module_from_spec(spec)
spec.loader.exec_module(mod)
WellbeingState = mod.WellbeingState

mental_state     = "I have been feeling overwhelmed and exhausted lately."
sleep_pattern    = "6"
stress_level     = 8
support_system   = ["Family", "Friends"]
recent_changes   = "Lost my job last month."
current_symptoms = ["Anxiety", "Fatigue"]

initial_state = WellbeingState(
    mental_state=mental_state,
    sleep_hours=int(sleep_pattern),   # select_slider returns str, cast here
    stress_level=stress_level,
    support_system=support_system,
    recent_changes=recent_changes,
    symptoms=current_symptoms,
)

dump = initial_state.model_dump()

mappings = [
    ("mental_state",   mental_state,       dump["mental_state"],   str),
    ("sleep_hours",    int(sleep_pattern), dump["sleep_hours"],    int),
    ("stress_level",   stress_level,       dump["stress_level"],   int),
    ("support_system", support_system,     dump["support_system"], list),
    ("recent_changes", recent_changes,     dump["recent_changes"], str),
    ("symptoms",       current_symptoms,   dump["symptoms"],       list),
]

print("=" * 62)
print("Streamlit UI -> WellbeingState field mapping verification")
print("=" * 62)

all_ok = True
for field, ui_val, state_val, expected_type in mappings:
    type_ok  = isinstance(state_val, expected_type)
    value_ok = state_val == ui_val
    status   = "PASS" if (type_ok and value_ok) else "FAIL"
    if status == "FAIL":
        all_ok = False
    print(f"\n[{status}] {field}")
    print(f"       UI widget   : {repr(ui_val)}")
    print(f"       State field : {repr(state_val)}  ({type(state_val).__name__} / expected {expected_type.__name__})")

print("\n" + "=" * 62)
print("Result:", "ALL MAPPINGS CORRECT" if all_ok else "SOME MAPPINGS FAILED")
print("=" * 62)

print("\nDict passed to graph.invoke():")
for k, v in dump.items():
    if v not in (None, "", [], {}):
        print(f"  {k}: {repr(v)}")
print(f"\nFields with defaults (not set by UI):")
for k, v in dump.items():
    if v in (None, "", [], {}):
        print(f"  {k}: {repr(v)}")

```
