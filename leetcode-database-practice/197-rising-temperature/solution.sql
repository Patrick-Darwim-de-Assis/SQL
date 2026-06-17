 
-- =========================================================================
-- APPROACH 1: THE PROFESSIONAL INDUSTRY STANDARD (Self-Join with DATEDIFF)
-- =========================================================================
-- This is the most optimal and universally compatible approach for interviews.
SELECT A.id
FROM Weather A
JOIN Weather B 
  ON DATEDIFF(A.recordDate, B.recordDate) = 1
WHERE A.temperature > B.temperature;


-- =========================================================================
-- APPROACH 2: THE MODERN ANALYTICAL OPTION (Window Functions with Subquery)
-- =========================================================================
SELECT id
FROM (
    SELECT id,
           temperature,
           recordDate,
           LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp,
           LAG(recordDate) OVER (ORDER BY recordDate) AS prev_date
    FROM Weather
) temp_comparison
WHERE temperature > prev_temp 
  AND DATEDIFF(recordDate, prev_date) = 1;

/*
----------------------------------------------------------------------------
💡 INTUITION DEEP-DIVE: Why use DATEDIFF() if LAG() already returns the previous row?
----------------------------------------------------------------------------
LAG() grabs data from the previous row based purely on its index position in 
the result set, not on the actual calendar timeline. It has no concept of time.

If your database has missing data (e.g., system downtime over a weekend):

+------------+------------+-------------+------------------+-----------------+
| Row Number | recordDate | temperature | LAG(temperature) | LAG(recordDate) |
+------------+------------+-------------+------------------+-----------------+
| Row 1      | 2015-01-01 | 10          | NULL             | NULL            |
| Row 2      | 2015-01-02 | 25          | 10               | 2015-01-01      |
| Row 3      | 2015-01-05 | 30          | 25               | 2015-01-02      |
+------------+------------+-------------+------------------+-----------------+

Look closely at Row 3 (January 5th):
- LAG() steps back exactly one row index and grabs the dataset from January 2nd.
- Is the temperature higher? Yes (30 > 25).
- Are they consecutive calendar days? No! There is a 3-day weekend gap.

Without `DATEDIFF(recordDate, prev_date) = 1`, Row 3 would trick the system 
and break the logic constraints. DATEDIFF acts as a mandatory validation 
guard to confirm that the physical row above is strictly 'yesterday'.
*/