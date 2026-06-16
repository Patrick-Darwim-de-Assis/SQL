# 176. Second Highest Salary

## 🔗 Quick Links
* **LeetCode Challenge**: [176. Second Highest Salary](https://leetcode.com/problems/second-highest-salary)
* **My Solution Code**: [solution.sql](./solution.sql)
* **Difficulty**: Medium

## 📋 Problem Description
Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null.

### Table Schema: `Employee`
```text
+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
Note: id is the primary key for this table.

Examples
Example 1 Input:

Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+

Example 1 Output:

+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+

Example 2 Input:

Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+

Example 2 Output:

+---------------------+
| SecondHighestSalary |
+---------------------+
| null                |
+---------------------+
```