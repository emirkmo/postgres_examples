SQL Cheat Sheet notes

Dtypes ```INT, VARCHAR, BLOB, DECIMAL(), DATE```, etc.

```sql
CREATE TABLE <name> (
Col1 Type Constraint,
Col2 Type …,
PRIMARY KEY(Col1,ColX#composite)
FOREIGN KEY(col2) REFERENCES tab(col)
ON DELETE SET NULL
ON DELETE CASCADE #good if foreign key is primary.
);
```
```sql
INSERT INTO …(co1, .) VALUES(.., ..);
```
```sql
SELECT * FROM …;
```
```sql
ALTER TABLE …
ADD FOREIGN KEY …
REFERENCES
ON DELETE SET NULL;
```
Table creation notes.
Composite keys good for relational.
If foreign key not created, init with null, add foreign key to its table, then update NULLs.

Constraints
```sql
NOT NULL
UNIQUE
AUTO_INCREMENT
DEFAULT <val>
```
Update Delete
```sql
UPDATE …
SET co2l = ‘blah’, col1 = 5
WHERE col1 =, <= etc.
OR col1 = …;
AND
```
```sql
DELETE FROM …
WHERE <condition>
```
Queries
```sql
SELECT *,<Cols>,table.col
FROM …
ORDER BY …1,…2 DESC -- (ASC)
LIMIT 200
```
```sql
WHERE col1 = … --(where first)
```
`--` is comment.
`<>`: not equal `!=`
`WHERE … IN (…,…,…)`
```sql
SELECT col1 AS colN , col2 AS colK
SELECT DISTINCT col1
FROM …
```
```sql
COUNT(col1)
AVG()
SUM()
GROUP BY <col1>
```
Wildcards
`%` = Nchars, `_` = one char.
```sql
LIKE
WHERE … LIKE ‘%LLC%’, ‘%LLC’
WHERE … LIKE ‘____-10%’
```
unions
```sql
SELECT … AS <union col name>
UNION. #need same col, similar dtype.
SELECT …
UNION
SELECT …
```
JOINS
```sql
SELECT …, …, …, …
FROM tab1
JOIN tab2 --#(Inner join)
ON tab1.colX = tab2.colY
LEFT JOIN tab2 --#all left
RIGHT JOIN --#all right
OUTER JOIN --#all
```
Nested queries
(Query on result of select).
```sql
SELECT …
WHERE … IN (
SELECT …)
```
```sql
SELECT …
WHERE … = (
SELECT …
LIMIT 1)
```
On Delete
`SET NULL` # Set all references to null.
`CASCADE` # Delete row

Triggers
(In command line)
Mysql (slightly different in postgres):
```sql
use <db>
DELIMITER $$
CREATE
TRIGGER … BEFORE INSERT
ON tab1
FOR EACH ROW BEGIN
IF NEW.col2 = ‘…’
INSERT INTO tablog VALUES(NEW.col1,‘…’)
ELSEIF
ELSE
END IF
END$$
DELIMITER ;
```
