# SQL ORDER BY Clause

## Overview

This assignment focuses on sorting and organizing data using SQL's `ORDER BY` clause. It covers single-column sorting, multi-column sorting, sorting using expressions and functions, custom sorting using CASE statements, date-based sorting, and ranking records using LIMIT.

The dataset used is a bookstore sales table named `book_sales`.

---

## Concepts Covered

### 1. ORDER BY Clause

Used to sort query results in ascending or descending order.

**Syntax**

```sql
select *
from table_name
order by column_name;
```

---

### 2. ASC and DESC

#### Ascending Order (Default)

```sql
order by column_name asc;
```

#### Descending Order

```sql
order by column_name desc;
```

---

### 3. Multi-Column Sorting

Used when records should be sorted using multiple criteria.

**Syntax**

```sql
order by column1 asc,
         column2 desc;
```

---

### 4. Sorting Using Expressions

SQL allows sorting based on computed values.

**Example**

```sql
order by quantity_sold * price desc;
```

---

### 5. Sorting Using Functions

Functions can be used directly inside ORDER BY.

---

### 6. Date-Based Sorting

Used to arrange records chronologically.

#### Oldest First

```sql
order by sale_date;
```

#### Newest First

```sql
order by sale_date desc;
```

#### Year and Month Sorting

```sql
order by year(sale_date),
         month(sale_date);
```

---

### 7. Date Formatting

Used to display dates in a readable format while sorting by the original date value.

#### Examples

```sql
date_format(sale_date,'%d %M %Y')
```

Output:

```text
15 January 2023
```

---

### 8. CASE in ORDER BY

Used for custom sorting rules.

**Syntax**

```sql
case
    when condition then value
    when condition then value
    else value
end
```

---

### 9. DISTINCT with ORDER BY

Used to display unique values in sorted order.

**Syntax**

```sql
select distinct city
from book_sales
order by city;
```

---

### 10. Handling NULL Values in Sorting

Used to control where NULL values appear.

**Syntax**

```sql
order by column is null,
         column desc;
```

Used to ensure NULL values appear at the end.

---

### 11. LIMIT Clause

Used to return only a specific number of rows.

**Syntax**

```sql
limit n;
```

---

## Learning Outcomes

After completing this assignment, I can:

* Sort records using ORDER BY.
* Use ASC and DESC effectively.
* Apply multi-column sorting.
* Sort using calculated expressions.
* Sort using SQL functions.
* Perform chronological sorting using dates.
* Format dates while maintaining correct sorting.
* Implement custom sorting rules using CASE.
* Handle NULL values during sorting.
* Retrieve top-performing records using LIMIT.
* Create business-oriented ranking and reporting queries.
