-- =========================
-- 1) Tenants table
-- =========================
CREATE TABLE IF NOT EXISTS tenants (
  id          INT NOT NULL AUTO_INCREMENT,
  name        VARCHAR(255) NOT NULL,
  company_name VARCHAR(255) NULL,
  email       VARCHAR(255) NULL,
  phone       VARCHAR(50) NULL,
  address     TEXT NULL,
  metadata    JSON NULL,                         -- optional extensibility
  created_at  DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at  DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_tenant_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Seed demo tenant
INSERT INTO tenants (id, name, company_name, email, phone)
VALUES (1, 'Demo Tenant', 'Demo Company', 'demo@example.com', '+27 000 000 0000')
ON DUPLICATE KEY UPDATE
  name=VALUES(name),
  company_name=VALUES(company_name),
  email=VALUES(email),
  phone=VALUES(phone);

