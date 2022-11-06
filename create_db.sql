CREATE TABLE projects (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  repo VARCHAR(200),
  link VARCHAR(200),
  tagline VARCHAR(500),
  description TEXT,
  dateadd DATE NOT NULL DEFAULT CURRENT_DATE,
  date DATE DEFAULT CURRENT_DATE  -- Date modified
);

CREATE TABLE changelog (
  logid SERIAL PRIMARY KEY,
  time TIMESTAMP NOT NULL DEFAULT NOW(),
  date DATE NOT NULL DEFAULT CURRENT_DATE,
  projid INT,
  projname VARCHAR(50),
  ucomment TEXT,
  FOREIGN KEY(projid) REFERENCES projects(id) ON DELETE SET NULL,
  FOREIGN KEY(projname) REFERENCES projects(name) ON DELETE SET NULL
);

ALTER TABLE projects
ADD lastchange INT;

-- Postgres15:
-- ALTER TABLE projects
-- ADD CONSTRAINT lastchange UNIQUE NULLS NOT DISTINCT;

ALTER TABLE projects
ADD FOREIGN KEY(lastchange) REFERENCES changelog(logid)ON DELETE SET NULL;

