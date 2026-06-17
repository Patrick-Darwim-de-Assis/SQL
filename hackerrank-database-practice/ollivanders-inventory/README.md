# HackerRank SQL Practice: Ollivander's Inventory

A comprehensive structural solution targeting advanced query segmentation, aggregation boundaries, and temporary view filtering in MySQL.

## 🔗 Project Links
* **Official Challenge:** [HackerRank - Ollivander's Inventory](https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?isFullScreen=true)
* **Source Code:** [solution.sql](./solution.sql)

## 📌 Problem Focus
Determine the individual system `id`, `age`, `coins_needed`, and `power` of the optimal (cheapest) non-evil wands for every distinct combination of age and power. The final presentation matrix must sort results by maximum power descending, followed by maximum age descending.

## 🛠️ Architectural Strategy

To decouple aggregation boundaries from specific target columns, this solution establishes a **Common Table Expression (CTE)** acting as an isolated internal processing unit.

```sql
WITH innerTable AS (
    SELECT p.code, MIN(coins_needed) AS min_coins, age, power
    FROM wands w 
    INNER JOIN wands_property p ON w.code = p.code 
    WHERE is_evil = 0
    GROUP BY power, age, p.code
)
SELECT w.id, i.age, w.coins_needed, w.power
FROM wands w
INNER JOIN wands_property p ON w.code = p.code
INNER JOIN innerTable i 
   ON w.power = i.power 
  AND p.age = i.age 
  AND w.coins_needed = i.min_coins
  AND w.code = i.code
ORDER BY w.power DESC, i.age DESC;