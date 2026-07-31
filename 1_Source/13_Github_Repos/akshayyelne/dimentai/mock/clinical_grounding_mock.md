# Extracted from: akshayyelne/dimentai/mock/clinical_grounding_mock.md
# Generated: 2026-07-31T00:49:45.081Z

> ## ⚠️ SYNTHETIC — FABRICATED FOR PIPELINE TESTING ONLY
> Mirror of `clinical_grounding_mock.jsonl`. **No threshold below is a clinical standard.**
> `SYNTHETIC` = invented for testing · `SOURCED_REFERENCE` = from RACGP Silver Book Part A.

Metrics aligned to `main.py` biomarker scores (0–10, **higher = healthier**).

| Engine | Domain (DSM-5) | Live metric (`main.py`) | Endpoint |
|---|---|---|---|
| **ECHO** | Language | `echo_score` *(not yet produced — `undefined` at runtime)* | — |
| **STRIDE** | Perceptual-motor | `gait_score` | `/process-gait` |
| **VISTA** | Visuospatial / Executive | `clock_score` | `/process-clock` |
| **FOCUS** | Complex attention | `oculomotor_score` | `/process-oculomotor` |

- Per engine (`echo_score`/`gait_score`/`clock_score`/`oculomotor_score`):
  Low/baseline **≥ 8** · Moderate **5–7.99** · High-priority flag **< 5**
- **Composite** (mirrors `main.py /synthesize`): `clock_score*0.5 + oculomotor_score*0.3 + gait_score*0.2` → **stable ≥ 7**, else **review_required**
- **Composite-escalation:** any engine high-priority flag (**< 5**) forces **review_required** regardless of the weighted score.

- Exclude first: **delirium**, **depression (pseudodementia)**, **medication effects** (psychotropics, anticholinergics, incontinence meds, antihistamines), physical/structural disease.
- Panel: **FBC, electrolytes, calcium, glucose, renal & liver function, TFTs, B12 & folate** (± syphilis, HIV); **imaging** to exclude tumour / chronic subdural haematoma.
- No attribution without **confirmed functional interference**.

1. Cognitive test → 2. Pathology → 3. Imaging → 4. Depression assessment → 5. Medication review → 6. Functional assessment → specialist if symptoms persist.

> "DimentAI **flags** patterns that **may warrant clinical assessment**; it **does not diagnose**. Outputs are **decision support** for a clinician and do not replace DSM-5 evaluation, validated testing, or clinical judgement."
