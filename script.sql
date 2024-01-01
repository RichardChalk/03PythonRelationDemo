BEGIN;
-- Skapa employer-tabellen först
CREATE TABLE IF NOT EXISTS employer (
    employerId INTEGER PRIMARY KEY,
    employerName TEXT
);

-- Skapa members-tabellen med en främmande nyckel som refererar till employer
CREATE TABLE IF NOT EXISTS members (
    id INTEGER PRIMARY KEY,
    fn TEXT,
    ln TEXT,
    employerFK INTEGER,
    FOREIGN KEY (employerFK) REFERENCES employer(employerId)
);

-- Infoga värden i members, notera att employerFK ska referera till en befintlig employerId
INSERT OR IGNORE INTO members (id, fn, ln, employerFK) VALUES (1, 'Homer', 'Simpson', 1001);
INSERT OR IGNORE INTO members (id, fn, ln, employerFK) VALUES (2, 'Marge', 'Simpson', NULL);
INSERT OR IGNORE INTO members (id, fn, ln, employerFK) VALUES (3, 'Lisa', 'Simpson', NULL);
INSERT OR IGNORE INTO members (id, fn, ln, employerFK) VALUES (4, 'Bart', 'Simpson', NULL);

-- Skapa 1 arbetsgivare
INSERT OR IGNORE INTO Employer VALUES (1001, "Nuclear Power Plant");
COMMIT;