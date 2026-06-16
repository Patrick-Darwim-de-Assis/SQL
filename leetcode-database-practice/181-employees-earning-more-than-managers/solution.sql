-- ============================================================================
-- LEETCODE 181: Employees Earning More Than Their Managers
-- Platform: LeetCode (Database Category)
-- Language: SQL (MySQL / Oracle compatible)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- PERSPECTIVE 1: The Self-Join Approach (Highly Recommended)
-- ----------------------------------------------------------------------------
-- This flattens the hierarchy by virtually copying the table into two aliases: 
-- 'worker' and 'manager', matching primary keys to foreign keys.
SELECT worker.name AS Employee 
FROM   employee AS worker
JOIN   employee AS manager 
  ON   worker.managerid = manager.id 
WHERE  worker.salary > manager.salary;


-- ----------------------------------------------------------------------------
-- PERSPECTIVE 2: The Correlated Subquery Approach
-- ----------------------------------------------------------------------------
-- This loops through the workers row-by-row and dynamically executes an inner 
-- query to fetch that specific worker's manager's salary.
SELECT name FROM employee AS worker 
WHERE managerId IS NOT NULL
  AND salary > (
      SELECT salary FROM employee AS manager 
      WHERE manager.id = worker.managerid
  );


-- ----------------------------------------------------------------------------
-- PERSPECTIVE 3: The INCORRECT Left Join + AND Trap (Educational Reference)
-- ----------------------------------------------------------------------------
-- WARNING: THIS DOES NOT WORK!
-- Why it fails: A LEFT JOIN *must* preserve every row from the left table ('worker'). 
-- If we put the salary filter inside the 'ON' clause, rows that fail the salary condition 
-- are not removed; instead, their manager columns just turn into NULL, keeping the 
-- worker on the final list anyway. 
--
-- To filter rows out when using a LEFT JOIN, the condition MUST be in the WHERE clause.
/*
SELECT worker.name AS Employee 
FROM   employee AS worker
LEFT JOIN employee AS manager 
  ON   worker.managerid = manager.id 
 AND   worker.salary > manager.salary; -- <-- TRAP: Keeps all workers anyway!
*/