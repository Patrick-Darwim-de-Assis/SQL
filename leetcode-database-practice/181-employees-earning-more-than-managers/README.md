# 181. Employees Earning More Than Their Managers

## 🔗 Quick Links
* **LeetCode Challenge**: [181. Employees Earning More Than Their Managers](https://leetcode.com/problems/employees-earning-more-than-their-managers)
* **My Solution Code**: [solution.sql](./solution.sql)
* **Difficulty**: Easy

## 📋 Problem Description

Find the employees who earn more than their managers. Return the result table in any order.

### Table Schema: `Employee`
```text
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+
Note: id is the primary key for this table.
Each row indicates the ID of an employee, their name, salary, and the ID of their manager.

Example 1
Input:

Employee table:
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+

Output:

+----------+
| Employee |
+----------+
| Joe      |
+----------+

Explanation: Joe is the only employee who earns more than his manager (Joe makes 70k, his manager Sam makes 60k).
```

