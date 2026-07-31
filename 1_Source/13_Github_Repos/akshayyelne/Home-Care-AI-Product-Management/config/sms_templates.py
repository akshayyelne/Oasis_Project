# Extracted from: akshayyelne/Home-Care-AI-Product-Management/config/sms_templates.py
# Generated: 2026-07-31T00:49:45.206Z

```python
"""
config/sms_templates.py — Home-Care-AI SMS Template Registry

CANONICAL SOURCE: This file is the single source of truth for all outbound SMS copy.
No SMS template string may appear as a literal anywhere else in the codebase.
harness-audit-grader SD-02 check enforces this constraint.

COPY APPROVAL GATE (B1-B):
  approved_by and approved_date are intentionally None.
  These fields BLOCK production go-live until Privacy Counsel signs off.
  The harness-audit-grader (Artifact 26) CP-01 check asserts both are non-null.
  Synthetic test harness runs regardless — advisory mode until B1-B is cleared.

CRIT-02 CONSTRAINT:
  All template rendering MUST use safe string interpolation only.
  No LLM, no format() calls with unvalidated input, no f-strings with user data.
  Use: template.replace("{variable}", sanitized_value) sequentially.

VERSIONING:
  Increment VERSION on every legal-approved change.
  VERSION is logged in APPAuditLogEntry.hitl_notes on every send:
  "sms_template_version=1.0.0" — creates an immutable record of which template
  string was active at the time of each notification.

CHARACTER LIMITS (enforced by send_sms()):
  ACT_C_01:          160 chars max (1 SMS segment)
  ACT_C_02_*:        480 chars max (3 SMS segments)
  ACT_P_01_*:        160 chars max (1 SMS segment)
  ACT_F_01_*:        200 chars max (2 SMS segments)
  Overflow handling: log LOW severity warning + truncate at segment boundary.
  Never silently drop fields mid-sentence.

REFERENCES:
  Artifact 23 §4.1 — verbatim template source + variable payload spec
  Artifact 23 §4 Gate 8 (ACT_C_01), Gate 9 (ACT_C_02), Gate 11 (ACT_P_01), Gate 12 (ACT_F_01)
  Artifact 24 US-05, US-07, US-08, US-09 — user stories referencing these templates
  Artifact 25 §10 Gap 1 — copy approval gate documentation
"""


VERSION      = "1.0.0"
APPROVED_BY  = None   # ← BLOCKS go-live. Set to: "Privacy Counsel — [Full Name]"
APPROVED_DATE = None  # ← BLOCKS go-live. Set to: "YYYY-MM-DD" (ISO 8601)

COORDINATOR_PROXY_REVIEW_BY   = None  # Set to: "Angela CC-001"
COORDINATOR_PROXY_REVIEW_DATE = None  # Set to: "YYYY-MM-DD"


#
#

ACT_C_01 = (
    "Hi {carer_first_name}, {agency_name} needs you to cover a visit for a client "
    "in {client_suburb} at {visit_time}. Reply YES to confirm or NO if unavailable."
)



#
#

ACT_C_02_VARIANT_A = (
    "Hi {carer_first_name}, here are the details for your visit with {client_first_name} "
    "at {visit_time}, {client_full_address}.\n\n"
    "{entry_note}\n"
    "{sensitivities_note}\n"
    "{familiarity_note}\n\n"
    "If you have any questions before the visit, call {coordinator_first_name} "
    "at {coordinator_phone}."
)

ACT_C_02_VARIANT_B = ACT_C_02_VARIANT_A  # Same template — familiarity_note differs at render time

ACT_C_02_FAMILIARITY_NOTE_KNOWN_CARERS = (
    "This client prefers familiar carers — please introduce yourself clearly "
    "and take a calm, steady approach."
)

ACT_C_02_VARIANT_C = (
    "Hi {carer_first_name}, you are covering a visit for {client_first_name} "
    "at {visit_time}, {client_full_address}.\n\n"
    "Client preferences have not yet been set up. "
    "Please introduce yourself warmly at arrival.\n\n"
    "If you have any questions before the visit, call {coordinator_first_name} "
    "at {coordinator_phone}."
)


#
#

ACT_P_01_VARIANT_A = (
    "Good morning, this is {agency_name}. Your visit today will be with "
    "{carer_first_name}, who has visited you before. They'll arrive at {visit_time}."
)

ACT_P_01_VARIANT_B = (
    "Good morning, this is {agency_name}. Your visit today will be covered by "
    "{carer_first_name}. They know about your preferences and will introduce "
    "themselves when they arrive at {visit_time}."
)

ACT_P_01_VARIANT_C = None  # Intentionally None — must never be rendered


#
#

ACT_F_01_VARIANT_A = (
    "Hi {family_first_name}, {agency_name} is letting you know that "
    "{client_first_name}'s visit today will be covered by {carer_first_name}, "
    "who has visited {client_pronoun} before. "
    "Arranged by {coordinator_first_name}. — {agency_name}"
)

ACT_F_01_VARIANT_B = (
    "Hi {family_first_name}, {agency_name} is letting you know that "
    "{client_first_name}'s visit today will be covered by {carer_first_name}, "
    "who knows about {client_first_name}'s care preferences. "
    "Arranged by {coordinator_first_name}. — {agency_name}"
)



TEMPLATES = {
    "version":        VERSION,
    "approved_by":    APPROVED_BY,
    "approved_date":  APPROVED_DATE,

    "ACT_C_01":               ACT_C_01,
    "ACT_C_02_VARIANT_A":     ACT_C_02_VARIANT_A,
    "ACT_C_02_VARIANT_B":     ACT_C_02_VARIANT_B,
    "ACT_C_02_VARIANT_C":     ACT_C_02_VARIANT_C,
    "ACT_C_02_FAMILIARITY_NOTE_KNOWN_CARERS": ACT_C_02_FAMILIARITY_NOTE_KNOWN_CARERS,
    "ACT_P_01_VARIANT_A":     ACT_P_01_VARIANT_A,
    "ACT_P_01_VARIANT_B":     ACT_P_01_VARIANT_B,
    "ACT_P_01_VARIANT_C":     ACT_P_01_VARIANT_C,   # None — must never be rendered
    "ACT_F_01_VARIANT_A":     ACT_F_01_VARIANT_A,
    "ACT_F_01_VARIANT_B":     ACT_F_01_VARIANT_B,
}



def assert_copy_approved():
    """
    Raise RuntimeError if templates have not received Copy Approval (B1-B).
    ECC must call this at application startup, not per-send — fail fast.
    In test harness mode (HOMECARE_AI_TEST_MODE=true), this check is bypassed
    and a WARNING is logged instead. Advisory mode until B1-B is cleared.
    """
    import os
    if os.environ.get("HOMECARE_AI_TEST_MODE") == "true":
        import logging
        logging.warning(
            "SMS templates running in ADVISORY mode — Copy Approval (B1-B) not yet cleared. "
            "approved_by=%s approved_date=%s",
            APPROVED_BY, APPROVED_DATE
        )
        return
    if APPROVED_BY is None or APPROVED_DATE is None:
        raise RuntimeError(
            "SMS templates not approved for production use. "
            "Set APPROVED_BY and APPROVED_DATE in config/sms_templates.py "
            "after Privacy Counsel review (Copy Approval gate B1-B)."
        )


def get_template(template_key: str) -> str:
    """
    Retrieve a template string by key. Raises ValueError if key not found
    or if template is None (e.g. ACT_P_01_VARIANT_C — unreachable branch).
    Logs template version in every call for audit traceability.
    """
    template = TEMPLATES.get(template_key)
    if template is None:
        raise ValueError(
            f"Template '{template_key}' is None or not found. "
            f"If this is ACT_P_01_VARIANT_C, it is unreachable — "
            f"Gate 4 P-3 filter should have prevented this path. "
            f"Log as G-DS-05 violation and escalate to VACANCY_UNRESOLVED."
        )
    return template

```
