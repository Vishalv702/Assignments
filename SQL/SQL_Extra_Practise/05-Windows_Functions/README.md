# SQL Window Functions Assignment

## Overview

This assignment was completed to strengthen my understanding of SQL Window Functions and analytical querying techniques. The dataset simulates sales performance data across multiple salespersons, regions, cities, customer types, and product categories.

The focus of this assignment was to perform advanced analytics while preserving row-level details, something that traditional GROUP BY queries cannot achieve.

---

## Database Used

**Database:** `performance_db`

**Table:** `employee_sales`

The table contains sales-related information such as:

- Salesperson Name
- Region
- City
- Product Category
- Sale Amount
- Quantity Sold
- Sale Date
- Customer Type
- Target Amount

---

## Concepts Implemented

### Ranking Functions
- ROW_NUMBER()
- RANK()

### Window Aggregation Functions
- Running SUM()
- Running COUNT()
- Running AVG()
- Running MAX()

### Navigation Functions
- LAG()
- LEAD()
- FIRST_VALUE()

### Partitioning
- PARTITION BY Region
- PARTITION BY Salesperson
- PARTITION BY City
- PARTITION BY Customer Type

---

## Tasks Performed

### Ranking & Leaderboards
- Assigned overall sales rankings
- Generated region-wise rankings
- Identified top performers per region
- Retrieved top N sales records per salesperson

### Running Analytics
- Calculated cumulative sales totals
- Computed running transaction counts
- Generated running averages
- Tracked running maximum sales values

### Comparative Analysis
- Compared current sales with previous sales
- Compared current sales with next sales
- Measured sales differences across transactions
- Evaluated sales against target amounts

### Regional & Salesperson Insights
- Region-wise cumulative performance tracking
- Salesperson-wise cumulative sales analysis
- City-level running sales totals
- Customer-type performance analysis

### Advanced Window Function Use Cases
- First sale per category
- Highest seller within each region
- Multi-level ranking analysis
- Simultaneous overall and partition-based calculations

---

## Skills Demonstrated

- SQL Window Functions
- Data Analysis using SQL
- Business Performance Reporting
- Ranking and Leaderboard Generation
- Trend Analysis
- Running Calculations
- Comparative Analytics
- Partition-Based Data Processing

---

## Learning Outcomes

Through this assignment, I gained practical experience in:

- Performing advanced analytical queries using SQL
- Using Window Functions for real-world reporting scenarios
- Generating cumulative metrics without losing row-level data
- Comparing records across time using LAG() and LEAD()
- Building performance reports commonly used in dashboards and business intelligence systems