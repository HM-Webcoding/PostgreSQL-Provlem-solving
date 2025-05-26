1.What is PostgreSQL?
PostgreSQL (structured query language) is a database system  — it's a tool that helps you store, organize, and retrieve data easily. It’s free & open-source

2. Explain the Primary Key and Foreign Key concepts in PostgreSQL

 **Primary Key**
A Primary Key is a column (or a set of columns) in a table that uniquely identifies each row in that table.
- Each table can have only one primary key.
- The primary key must contain unique values and cannot be NULL.
- It is used to ensure data integrity and to locate records quickly.

**Foreign Key**
A Foreign Key is a column (or a set of columns) in one table that refers to the primary key in another table.
- It creates a relationship between two tables.
- It is used to enforce referential integrity — ensuring that values in the foreign key column must exist in the referenced table.

3. What is the difference between the VARCHAR and CHAR data types?
   
CHAR(n) always stores exactly n characters. If the input string is shorter, it adds spaces at the end to make up the length.
VARCHAR(n) stores up to n characters, but only saves the characters you enter.
It does not add extra spaces if the text is shorter than n.

4.What are the LIMIT and OFFSET clauses used for?

LIMIT is used to say how many rows you want.
OFFSET is used to skip rows before starting to return results.


note: I've used AI to help make the sentence grammatically correct.

