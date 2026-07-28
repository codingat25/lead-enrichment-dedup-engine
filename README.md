Multi-Source Lead Enrichment & Deduplication Engine

When leads come in from multiple sources — landing pages, ads, partner referrals — two things break down without a system like this:

Problem 1: Duplicate leads. The same person fills out a form twice, or their phone number is formatted differently each time (+1 (555) 123-4567 vs 555.123.4567 ext 2). Without normalization, these look like two different people and get entered twice. A CRM polluted with duplicates means salespeople waste time calling the same person repeatedly, or worse, contradicting each other.

Problem 2: Manual enrichment. The form only gives you a name, email, and company domain. Someone still has to look up the company, figure out their industry, estimate their size, and guess at what they need. That takes time per lead, and it's inconsistent.

What this system does: It sits between "lead arrives" and "lead enters your CRM" and handles both problems automatically — no human needed for either.

Why This Is Production-Grade

Most n8n demos only handle the happy path. What separates this system:

1. Deterministic dedup logic — normalization happens before comparison, so duplicates are caught regardless of formatting differences in the source data.

2. Database-level safety net — the UNIQUE constraint on email means even application-level bugs can't create true duplicates in the database.

3. Dead letter queue — failed leads are never silently lost. Every crash is logged with a direct link to the failed execution in n8n, so recovery is one click away.

4. Real-time alerting — Discord notifications fire automatically on any failure, without requiring anyone to manually check logs.

5. Defensive parsing — the AI output parser handles malformed LLM responses explicitly, converting potential silent failures into loud, catchable errors.

How we are going to integrate this with other client's workflow?

The Webhook URL would be connected to the client's actual lead form (Typeform, HubSpot form, custom HTML form)
n8n would run on a cloud server (AWS EC2 or similar) instead of locally — always on, not dependent on a laptop being open
The inbound_leads table would connect directly to the client's CRM via a downstream step (HubSpot API, Salesforce API, etc.)
Discord alerts would go to the client's ops/sales channel
