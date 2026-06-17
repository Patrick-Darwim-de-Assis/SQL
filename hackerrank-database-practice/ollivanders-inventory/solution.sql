/**
 * Challenge: Ollivander's Inventory (HackerRank Medium)
 * Code Evolution & Engineering Roadmap
 * =========================================================================
 */

/* -------------------------------------------------------------------------
 * PHASE 1: THE COMPILER GUARDROAD (THE "ONLY_FULL_GROUP_BY" ERROR)
 * -------------------------------------------------------------------------
 * Your First Attempt:
 * You tried to squish the data by age and power, but left the 'id' column 
 * raw. MySQL threw ERROR 1055 because it didn't know which specific wand id 
 * to pair with your calculated minimum price.
 */

-- WRONG CODE TYPE #1:
SELECT 
    id, 
    MIN(coins_needed), 
    age, 
    power 
FROM wands w 
INNER JOIN wands_property p ON w.code = p.code 
GROUP BY power, age 
ORDER BY power DESC, age DESC;


/* -------------------------------------------------------------------------
 * PHASE 2: THE SYNTAX ALIGNMENT
 * -------------------------------------------------------------------------
 * Your Second Attempt:
 * You realized you needed a temporary table (CTE) to isolate the minimums, 
 * but the syntax structure was scrambled (using "AS WITH" instead of "WITH") 
 * and used a comma join instead of an explicit JOIN ON statement.
 */

-- WRONG CODE TYPE #2:
AS WITH (
    SELECT MIN(coins_needed), age, power 
    FROM wands w 
    INNER JOIN wands_property p ON w.code = p.code 
    GROUP BY power, age 
    ORDER BY power DESC, age DESC
) innerTable;

SELECT id, i.min(coins_needed), age, power
FROM wands, innerTable;


/* -------------------------------------------------------------------------
 * PHASE 3: THE OVER-AGGREGATION LOOPHOLE (LOST DATA)
 * -------------------------------------------------------------------------
 * Your Third Attempt:
 * You fixed the CTE syntax perfectly! But by grouping the inner table 
 * globally by 'power, age', different model types (codes) collided. 
 * A globally cheaper wand type completely wiped out other distinct wand lines 
 * from your subquery entirely, causing HackerRank to say "Wrong Answer".
 */

-- WRONG CODE TYPE #3:
WITH innerTable AS (
    SELECT 
        MIN(coins_needed) AS min_coins, 
        age, 
        power 
    FROM wands w 
    INNER JOIN wands_property p ON w.code = p.code 
    GROUP BY power, age
)
SELECT w.id, i.age, w.coins_needed, w.power
FROM wands w
INNER JOIN wands_property p ON w.code = p.code
INNER JOIN innerTable i 
    ON w.power = i.power 
   AND p.age = i.age 
   AND w.coins_needed = i.min_coins
ORDER BY w.power DESC, i.age DESC;


/* -------------------------------------------------------------------------
 * PHASE 4: THE UNSTITCHED ID LOOPHOLE (CROSS-WIRING)
 * -------------------------------------------------------------------------
 * Your Fourth Attempt:
 * You smartly fixed the inner table by adding 'p.code' to isolate your 
 * calculations. However, you didn't connect ("stitch") that code back to the 
 * outer query. If two distinct wand models shared the same age, power, and price, 
 * their identity lines crossed over, leading to duplicate output lines.
 */

-- WRONG CODE TYPE #4:
WITH innerTable AS (
    SELECT 
        MIN(coins_needed) AS min_coins, 
        age, 
        power
    FROM wands w 
    INNER JOIN wands_property p ON w.code = p.code 
    GROUP BY power, age, p.code
)
SELECT w.id, i.age, w.coins_needed, w.power
FROM wands w
INNER JOIN wands_property p ON w.code = p.code
INNER JOIN innerTable i 
    ON w.power = i.power 
   AND p.age = i.age 
   AND w.coins_needed = i.min_coins
ORDER BY w.power DESC, i.age DESC;


/* -------------------------------------------------------------------------
 * PHASE 5: THE FINAL PRODUCT (CLEAN, FILTERED & BOUNDED)
 * -------------------------------------------------------------------------
 * The Solution:
 * By adding the 'is_evil = 0' filter to clean out dark magic, and explicitly 
 * stitching the inner and outer tables together with 'AND w.code = i.code', 
 * the data pipelines are perfectly insulated.
 */

-- PRODUCTION-READY CODE:
WITH innerTable AS (
    SELECT 
        p.code, 
        MIN(coins_needed) AS min_coins, 
        age, 
        power
    FROM wands w 
    INNER JOIN wands_property p ON w.code = p.code 
    WHERE is_evil = 0
    GROUP BY power, age, p.code
)
SELECT 
    w.id, 
    i.age, 
    w.coins_needed, 
    w.power
FROM wands w
INNER JOIN wands_property p ON w.code = p.code
INNER JOIN innerTable i 
    ON w.power = i.power 
   AND p.age = i.age 
   AND w.coins_needed = i.min_coins
   AND w.code = i.code
ORDER BY 
    w.power DESC, 
    i.age DESC;