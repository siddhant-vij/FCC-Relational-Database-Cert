# [Learn Relational Databases by Building a Mario Database](https://github.com/freeCodeCamp/learn-relational-databases-by-building-a-mario-database/blob/main/TUTORIAL.md?plain=1)


- The virtual machine comes with PostgreSQL installed. You will use the Psql terminal application to interact with it. Log in by typing `psql --username=USERNAME --dbname=postgres` into the terminal and pressing enter.
- Notice that the prompt changed to let you know that you are now interacting with PostgreSQL.
- Type `\l` into the prompt to *list* the databases.
- Create a new database:
  ```sql
  CREATE DATABASE new_database_name;
  ```
- Note that *all commands need a semi-colon at the end.*
- You can connect to a database by entering `\c database_name`.
- A database is made of tables that hold your data. Enter `\d` to display the tables.
- Similar to how you created a database, you can create a table like this:
  ```sql
  CREATE TABLE table_name();
  ```
- Note that the parenthesis are needed for this one. It will create the table in the database you are connected to.
- You can view more details about a table by adding the table name after the display command like this: `\d table_name`.
- Tables need *columns* to describe the data in them. Here's an example of how to add one:
  ```sql
  ALTER TABLE table_name ADD COLUMN column_name DATATYPE;
  ```
- You can also remove them. Here's an example:
  ```sql
  ALTER TABLE table_name DROP COLUMN column_name;
  ```
- A common data type is `VARCHAR`. It's a short string of characters. You need to give it a maximum length when using it like this: `VARCHAR(30)`. The `30` means the data in it can be a max of 30 characters.
- Rows are the actual data in the table. You can add one like this:
  ```sql
  INSERT INTO table_name(column_1, column_2) VALUES(value1, value2);
  ```
- You can view the data in a table by querying it with the `SELECT` statement:
  ```sql
  SELECT columns FROM table_name;
  ```
- Use a `SELECT` statement to view **all** the columns in a `table`. Use an asterisk (`*`) to denote that you want to see all the columns. Usage: `SELECT * FROM table;`
- Here's an example of how to delete a row:
  ```sql
  DELETE FROM table_name WHERE condition;
  ```
- Rename `old_database_name` to `new_database_name`:
  ```sql
  ALTER DATABASE old_database_name RENAME TO new_database_name;
  ```
- You can change a value like this:
  ```sql
  UPDATE table_name SET column_name=new_value WHERE condition;
  ```
- View Sorted Data. Actually, you should put that in order. Here's an example:
  ```sql
  SELECT columns FROM table_name ORDER BY column_name;
  ```
- You can add a **primary key**. It's a column that uniquely identifies each row in the table. Here's an example of how to set a `PRIMARY KEY`:
  ```sql
  ALTER TABLE table_name ADD PRIMARY KEY(column_name);
  ```
- Drop Primary Key from Table. Here's an example of how to drop a constraint:
  ```sql
  ALTER TABLE table_name DROP CONSTRAINT constraint_name;
  ```
- You can set a **foreign key** so that you can relate rows from one table to rows from another table. Here's an example that creates a column as a foreign key:
  ```sql
  ALTER TABLE table_name ADD COLUMN column_name DATATYPE REFERENCES referenced_table_name(referenced_column_name);
  ```
- You can enforce one-to-one relationship by adding the `UNIQUE` constraint to your foreign key. Here's an example:
  ```sql
  ALTER TABLE table_name ADD UNIQUE(column_name);
  ```
- You can add a **not null** constraint to a column if you don't want to have a row that is for nobody. Here's an example:
  ```sql
  ALTER TABLE table_name ALTER COLUMN column_name SET NOT NULL;
  ```
- "Many-to-many" relationships usually use a **junction** table to link two tables together, forming two "one-to-many" relationships.
- Every table should have a primary key. You can create a primary key from two columns, known as a **composite** primary key. Here's an example:
  ```sql
  ALTER TABLE table_name ADD PRIMARY KEY(column1, column2);
  ```
- Enter a join command to see **all** the info from both tables.
  ```sql
  SELECT * FROM table1 FULL JOIN table2 ON table1.common_id = table2.common_id;
  ```
  OR
  ```sql
  SELECT columns FROM junction_table
  FULL JOIN table_1 ON junction_table.foreign_key_column = table_1.primary_key_column
  FULL JOIN table_2 ON junction_table.foreign_key_column = table_2.primary_key_column;
  ```