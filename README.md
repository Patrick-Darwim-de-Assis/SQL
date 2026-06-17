# SQL Portfolio & Technical Log

Welcome! This repository serves as a professional engineering log documenting my mastery of relational database architecture, structural query optimizations, and advanced time-series data analysis.

## Repository Contents
* **[Ollivander's Inventory](./hackerrank-database-practice/ollivanders-inventory)**: Managing 1-to-Many isolation boundaries and bypassing restrictive compiler blocks (`ONLY_FULL_GROUP_BY`) using decoupled Common Table Expressions (CTEs).
* **[176. Second Highest Salary](./leetcode-database-practice/176-second-highest-salary/)**: Isolating data boundaries using aggregate functions within scalar subqueries to safely process missing or null records.
* **[181. Employees Earning More Than Their Managers](./leetcode-database-practice/181-employees-earning-more-than-managers/)**: Managing internal relational hierarchies using self-joins and isolated filtering scopes.
* **[197. Rising Temperature](./leetcode-database-practice/197-rising-temperature/)**: Tracking day-over-day sequential data shifts using self-joins and nested analytical window functions (`LAG()`) while accounting for timeline gaps.

## Core Concepts Mastered
* **Time-Series Analysis**: Tracking structural updates across shifting chronological datasets using date-differentiation operations (`DATEDIFF()`).
* **Subquery Encapsulation**: Restructuring deep virtual tables to pass complex execution columns out to parent filtering layers.
* **Window Functions & Positioning**: Leveraging chronological ordering layouts (`OVER (ORDER BY)`) to map rows sequentially independent of chaotic hardware retrieval streams.
* **Data Relationship Scoping**: Strategically positioning logic boundaries across execution phases (`ON` structural matching constraints versus `WHERE` final row limits).
* **Deterministic Aggregation Isolation**: Decoupling mathematical summary boundaries (`MIN()`) from granular physical keys (`id`) via Common Table Expressions (CTEs) to bypass restrictive SQL compiler engine constraints (`ONLY_FULL_GROUP_BY`).