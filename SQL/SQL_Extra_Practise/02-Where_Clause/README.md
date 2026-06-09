# SQL WHERE Clause

## Overview

This assignment focuses on filtering records using the SQL `WHERE` clause. It covers comparison operators, logical operators, pattern matching, range filtering, list membership, NULL handling, and date-based filtering.

The dataset used is a student management table named `student`.

---

## Concepts Covered

### 1. WHERE Clause

Used to filter rows based on specific conditions.

**Syntax**

```sql
select *
from table_name
where condition;
```

---

### 2. Comparison Operators

Used to compare values.

| Operator | Description              |
| -------- | ------------------------ |
| =        | Equal to                 |
| !=       | Not equal to             |
| <>       | Not equal to             |
| >        | Greater than             |
| <        | Less than                |
| >=       | Greater than or equal to |
| <=       | Less than or equal to    |

**Examples**

```sql
marks > 80

age = 17

city != 'Delhi'
```

---

### 3. Logical Operators

Used to combine multiple conditions.

#### AND

Returns rows when all conditions are true.

```sql
condition1 and condition2
```

#### OR

Returns rows when at least one condition is true.

```sql
condition1 or condition2
```

#### NOT

Reverses a condition.

```sql
not condition
```

---

### 4. BETWEEN

Used to filter values within a range.

**Syntax**

```sql
column between value1 and value2
```

**Examples**

```sql
marks between 60 and 90
```

---

### 5. IN Operator

Used to match values from a list.

**Syntax**

```sql
column in (value1, value2, value3)
```

**Example**

```sql
city in ('Pune', 'Mumbai', 'Delhi')
```

---

### 6. NOT IN Operator

Used to exclude values from a list.

**Syntax**

```sql
column not in (value1, value2)
```

**Example**

```sql
city not in ('Nagpur', 'Nashik')
```

---

### 7. LIKE Operator

Used for pattern matching.

#### Wildcards

| Wildcard | Meaning                  |
| -------- | ------------------------ |
| %        | Any number of characters |
| _        | Exactly one character    |

**Examples**

```sql
'A%'
```

Starts with A

```sql
'%an%'
```

Contains "an"

```sql
'____'
```

Exactly 4 characters

---

### 8. IS NULL

Used to find missing values.

**Syntax**

```sql
column is null
```

---

### 9. IS NOT NULL

Used to find existing values.

**Syntax**

```sql
column is not null
```

---

### 10. Date Filtering

Used to filter records based on dates.

**Functions Used**

```sql
year(date_column)
```

**Example**

```sql
year(admission_date) = 2023
```

---

## Learning Outcomes

After completing this assignment, I can:

* Filter records using the WHERE clause.
* Use comparison operators effectively.
* Combine conditions using AND, OR, and NOT.
* Filter data using ranges with BETWEEN.
* Perform pattern matching using LIKE and wildcards.
* Check for missing and existing values using NULL conditions.
* Filter records using lists with IN and NOT IN.
* Apply date-based filtering.
* Write complex queries involving multiple conditions.
* Build real-world filtering queries used in reporting systems and applications.
