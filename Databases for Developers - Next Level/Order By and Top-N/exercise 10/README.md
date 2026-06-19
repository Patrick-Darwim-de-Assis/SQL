# Exercise 10: Custom Sorting with Top-N

### 📂 Navigation
* [📄 View Solution Code](./solution.sql)

---

### 🔗 Exercise URL
[FreeSQL - Sorting and Limiting Rows](https://freesql.com/library/tutorials/sorting-and-limiting-rows-databases-for-developers-xSDZLH/)

### 📝 Description
Complete the query so that:
1. **Kangaroo** is always at the top.
2. **Blue Dinosaur** takes second place.
3. All remaining toys are ordered by price, from cheapest to most expensive.

### 💻 Solution Preview
```sql
select t.toy_name, t.price,
       case
         when toy_name = 'Kangaroo' then 1/*TODO*/
         when toy_name = 'Blue Dinosaur' then 2/*TODO*/
         else 3/*TODO*/
       end custom_sort
from   toys t
order  by custom_sort, price/*TODO*/

```

🧠 Concept Learned
This exercise demonstrates how to bypass traditional scalar column ordering by injecting a conditional CASE expression directly into the execution pipeline, creating a temporary positional array (custom_sort) to handle custom business logic sorting rules.
EOF