CREATE TABLE IF NOT EXISTS inbound_leads (
  id BIGSERIAL PRIMARY KEY,
  email TEXT UNIQUE NOT NULL,
  full_name TEXT,
  primary_phone TEXT,
  company_name TEXT,
  domain TEXT,
  tags JSONB,
  source TEXT,
  submitted_at TIMESTAMPTZ,
  enrichment JSONB,
  status TEXT DEFAULT 'new',
  created_at TIMESTAMPTZ DEFAULT now(),
  last_seen_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS dead_letter_queue (
  id BIGSERIAL PRIMARY KEY,
  workflow_name TEXT,
  failed_node TEXT,
  error_message TEXT,
  payload JSONB,
  created_at TIMESTAMPTZ DEFAULT now()
);