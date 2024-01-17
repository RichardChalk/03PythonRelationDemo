import sqlite3

conn = sqlite3.connect(
    "C:\\Db\\SQL Lite\\employeeRelation.db")

cur = conn.cursor()

with open ("script.sql") as file:
     sqlScript = file.read()

cur.executescript(sqlScript)
conn.commit()

# SQL-fråga som använder LEFT JOIN för att sammanföra members och employer
query = """
SELECT 
    m.fn AS Familjemedlem,
    m.ln AS Efternamn,
    e.employerName AS Arbetsgivare
FROM 
    members m
LEFT JOIN 
    employer e ON m.employerFK = e.employerId;
"""

# Exekvera frågan
cur.execute(query)

# Skriv ut resultaten
for row in cur.fetchall():
    print(row)

cur.close()
conn.close()

