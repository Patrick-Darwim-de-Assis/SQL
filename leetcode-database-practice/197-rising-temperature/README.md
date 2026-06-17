 # 197. Rising Temperature

## 🔗 Quick Links
* **LeetCode Challenge**: [197. Rising Temperature](https://leetcode.com/problems/rising-temperature)
* **My Solution Code**: [solution.sql](./solution.sql)
* **Difficulty**: Easy

## 📋 Problem Description
Write a solution to find all dates' `id` with higher temperatures compared to its previous dates (yesterday). Return the result table in any order.

### Table Schema: `Weather`
```text
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
Note: id is the column with unique values for this table.
There are no different rows with the same recordDate.
This table contains information about the temperature on a certain day.

### Example 1

**Input:**
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+

**Output:**
+----+
| id |
+----+
| 2  |
| 4  |
+----+

Explanation: * In 2015-01-02, the temperature was higher than the previous day (25 > 10).

In 2015-01-04, the temperature was higher than the previous day (30 > 20).
```

📋 Technical Summary Inside Code File
Approach 1: Self-Join Architecture

Core Mechanism: Utilizes an optimized Self-Join constraint paired with explicit DATEDIFF() operations.

Impact: Enforces strict chronological pairing across shifting timeline datasets with optimal indexing efficiency.

Approach 2: Subquery Encapsulation & Window Functions

Core Mechanism: Implements an analytical Window Function (LAG()) wrapped inside an encapsulated relational subquery layer.

Impact: Captures positional record sequences independent of disk storage streams. Includes a comprehensive architectural edge-case analysis within the script tracking physical layout gaps versus calendar data omissions.

