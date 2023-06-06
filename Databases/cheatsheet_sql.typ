#set text(font: "Helvetica")

#show raw.where(block: true): block.with(
  fill: luma(245),
  inset: 8pt,
  radius: 4pt,
)

== Creating Tables:
```SQL
CREATE TABLE table_name (
    column1 datatype constraints,
    column2 datatype constraints,
);
```

```SQL
CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT NOT NULL,
    email TEXT UNIQUE,
);
```

== **Adding Primary Key:**

```SQL
CREATE TABLE table_name (
    column1 datatype PRIMARY KEY,
    ...
);
```

```SQL
CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
```

== **Adding Foreign Key:**

```SQL
CREATE TABLE table_name (
    column1 datatype,
    ...
    FOREIGN KEY (column_name) REFERENCES related_table(related_column)
);
```

```SQL
CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    order_date TEXT,
    customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
```

== Adding Constraints:
```SQL
column_name datatype NOT NULL
```
```SQL
column_name datatype UNIQUE
```
```SQL
column_name datatype DEFAULT default_value
```
```SQL
column_name datatype CHECK(condition)
```

#pagebreak()

== **Inserting Data:**

```SQL
INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...);
```

```SQL
INSERT INTO Customers (customer_id, customer_name, email, address)
VALUES (1, 'John Doe', 'john@example.com', '123 Main St');
```

== **Querying Data:**

```SQL
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```

```SQL
SELECT customer_name, email
FROM Customers
WHERE customer_id = 1;
```

== **Updating Data:**

```SQL
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```
   
```SQL
UPDATE Customers
SET email = 'new_email@example.com'
WHERE customer_id = 1;
```

== **Deleting Data:**

```SQL
DELETE FROM table_name
WHERE condition;
```

```SQL
DELETE FROM Customers
WHERE customer_id = 1;
```

== **Joins:**

```SQL
SELECT column1, column2, ...
FROM table1
JOIN table2 ON condition;
```

```SQL
SELECT Orders.order_id, Customers.customer_name
FROM Orders
JOIN Customers ON Orders.customer_id = Customers.customer_id;
```