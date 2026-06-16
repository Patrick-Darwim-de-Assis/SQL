# LeetCode SQL Interview Practice

Welcome! This repository serves as a digital technical log of my progress mastering relational database logic, query optimization, and complex state analysis.

## Repository Contents
* **[181-Employees-Earning-More-Than-Managers](./leetcode-database-practice/181-employees-earning-more-than-managers/solution.sql)**: Deep dive into hierarchical data processing using **Self-Joins**, **Correlated Subqueries**, and analyzing structural logic boundaries (the `LEFT JOIN` conditional trap).

## Core Concepts Practiced
* Data relationship scoping (`ON` conditional constraints vs. `WHERE` filter scopes).
* Table aliasing to process single-table internal organizational hierarchies.

# Employees Earning More Than Their Managers

## 🔗 Problem Reference
* **LeetCode Link**: [181. Employees Earning More Than Their Managers](https://leetcode.com/problems/employees-earning-more-than-their-managers)
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

Employee table:
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+

+----------+
| Employee |
+----------+
| Joe      |
+----------+
```

