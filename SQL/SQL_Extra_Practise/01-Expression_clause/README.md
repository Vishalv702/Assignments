# SQL Expressions & Functions

## Overview

This assignment focuses on using SQL expressions, mathematical functions, date functions, string functions, boolean expressions, conditional functions, and subqueries to perform business-related calculations and reporting.

The dataset used is a retail sales table named `product_sales`.

---

## Concepts Covered

### 1. Arithmetic Expressions

Used to perform calculations using column values.

**Examples**

```sql
column1 + column2
column1 - column2
column1 * column2
column1 / column2
```

**Applications**

* Revenue Calculation
* Profit Calculation
* Discount Calculation
* GST Calculation

---

### 2. Subqueries (Derived Tables)

Used to reuse calculated values without repeating expressions.

**Syntax**

```sql
select *
from (
    select ...
) t;
```

**Applications**

* Profit Percentage Calculation
* Revenue Analysis
* Filtering Computed Columns

---

### 3. Mathematical Functions

| Function | Purpose                                 | Syntax                    |
| -------- | --------------------------------------- | ------------------------- |
| ROUND()  | Round values to specific decimal places | `round(number, decimals)` |
| CEIL()   | Round up to nearest integer             | `ceil(number)`            |
| ABS()    | Find absolute difference                | `abs(number)`             |
| MOD()    | Find remainder after division           | `mod(number, divisor)`    |

---

### 4. Boolean Expressions

Return either TRUE (1) or FALSE (0).

**Example**

```sql
profit > 30
```

**Output**

```text
1 → True
0 → False
```

---

### 5. Conditional Functions

#### IF()

Used for simple decision-making logic.

```sql
if(condition, true_value, false_value)
```

#### CASE

Used for handling multiple conditions.

```sql
case
    when condition then value
    else value
end
```

---

### 6. Date Functions

| Function      | Purpose                            |
| ------------- | ---------------------------------- |
| CURDATE()     | Returns current system date        |
| DATEDIFF()    | Finds difference between two dates |
| DATE_ADD()    | Adds days, months, or years        |
| YEAR()        | Extracts year from date            |
| MONTH()       | Extracts month from date           |
| DATE_FORMAT() | Formats date output                |

**Examples**

```sql
curdate()

datediff(date1, date2)

date_add(date, interval 90 day)

year(sale_date)

month(sale_date)

date_format(date,'%d-%m-%Y')
```

---

### 7. String Functions

| Function    | Purpose                           |
| ----------- | --------------------------------- |
| CONCAT()    | Combine strings                   |
| UPPER()     | Convert text to uppercase         |
| LOWER()     | Convert text to lowercase         |
| LEFT()      | Extract characters from beginning |
| LENGTH()    | Count characters                  |
| TRIM()      | Remove extra spaces               |
| REPLACE()   | Replace text                      |
| REVERSE()   | Reverse text                      |
| SUBSTRING() | Extract part of a string          |
| LOCATE()    | Find position of text             |

---

## Business Metrics Implemented

### Revenue

```sql
quantity * unit_price
```

### Total Cost

```sql
quantity * cost_price
```

### Gross Profit

```sql
total_revenue - total_cost
```

### Profit Per Unit

```sql
unit_price - cost_price
```

### Profit Percentage

```sql
((unit_price - cost_price) / cost_price) * 100
```

### Profit Margin

```sql
((unit_price - cost_price) / unit_price) * 100
```

### Discount Amount

```sql
unit_price * discount_percentage / 100
```

### Discounted Price

```sql
unit_price - discount_amount
```

### GST Amount

```sql
discounted_price * 18 / 100
```

### Final Taxed Revenue

```sql
discounted_price + gst_amount
```

---

## Queries Practiced

* Revenue Calculation
* Discount Calculation
* Profit Analysis
* Profit Margin Calculation
* GST Calculation
* Date Difference Analysis
* Date Formatting
* Boolean Expressions
* Conditional Logic using IF and CASE
* String Manipulation
* Business Reporting Queries
* Computed Columns
* Subqueries for Reusable Calculations

---

## Learning Outcome

After completing this assignment, I can:

* Create computed columns using SQL expressions.
* Perform business calculations directly in SQL.
* Use mathematical, date, and string functions effectively.
* Apply conditional logic using IF and CASE.
* Work with boolean expressions.
* Use subqueries to simplify complex calculations.
* Generate meaningful business reports from raw sales data.
* Write cleaner and more readable SQL queries.
