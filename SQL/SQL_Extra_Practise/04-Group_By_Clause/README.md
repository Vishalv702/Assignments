# SQL GROUP BY Clause - Learning Notes

## Overview

This assignment focused on mastering the `GROUP BY` clause and aggregate functions to summarize, analyze, and report data from a sales dataset. It covered grouping data, calculating totals and averages, filtering grouped results, working with dates, counting distinct values, and generating summary rows.

---

# Topics Learned

## 1. GROUP BY

### Purpose

Groups rows having the same values into summary groups.

### Syntax

```sql
select column_name, aggregate_function(column_name)
from table_name
group by column_name;
```

### Example

```sql
select salesperson_name, sum(amount)
from sales
group by salesperson_name;
```

---

## 2. Aggregate Functions

Aggregate functions operate on multiple rows and return a single result.

### COUNT()

Counts rows.

```sql
count(*)
```

### SUM()

Calculates total.

```sql
sum(amount)
```

### AVG()

Calculates average value.

```sql
avg(amount)
```

### MAX()

Finds highest value.

```sql
max(amount)
```

### MIN()

Finds lowest value.

```sql
min(amount)
```

---

## 3. GROUP BY Multiple Columns

### Purpose

Creates groups based on combinations of multiple columns.

### Syntax

```sql
group by column1, column2
```

### Example

```sql
group by salesperson_name, region
```

---

## 4. HAVING Clause

### Purpose

Filters grouped results after aggregation.

### Syntax

```sql
select column_name, sum(amount)
from table_name
group by column_name
having sum(amount) > 100000;
```

### Example

```sql
having count(*) > 3
```

---

## 5. WHERE vs HAVING

### WHERE

Filters rows before grouping.

```sql
where customer_type = 'Corporate'
```

### HAVING

Filters groups after grouping.

```sql
having sum(amount) > 50000
```

---

## 6. Date-Based Grouping

### YEAR()

Extracts year from date.

```sql
year(sale_date)
```

### MONTH()

Extracts month from date.

```sql
month(sale_date)
```

### Example

```sql
group by year(sale_date), month(sale_date)
```

---

## 7. DISTINCT Counting

### Purpose

Counts unique values only.

### Syntax

```sql
count(distinct product_name)
```

---

## 8. WITH ROLLUP

### Purpose

Adds automatic subtotal and grand total rows.

### Syntax

```sql
group by product_name with rollup
```

### Example

```sql
select product_name,
sum(amount)
from sales
group by product_name with rollup;
```

---

## 9. Sorting Grouped Results

### Purpose

Sort summarized results.

### Syntax

```sql
order by aggregate_value desc
```

### Example

```sql
order by total_revenue desc
```

---

# What I Learned

* How to summarize large datasets using GROUP BY.
* How aggregate functions work with grouped data.
* When to use WHERE and when to use HAVING.
* How to create multi-level grouping reports.
* How to perform monthly and yearly revenue analysis.
* How to count unique values using DISTINCT.
* How to generate automatic summary rows using WITH ROLLUP.
* How to build business reports commonly used in dashboards and analytics systems.
