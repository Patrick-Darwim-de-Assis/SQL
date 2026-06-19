cat << 'EOF' > solution.sql
select t.toy_name, t.price,
       case
         when toy_name = 'Kangaroo' then 1/*TODO*/
         when toy_name = 'Blue Dinosaur' then 2/*TODO*/
         else 3/*TODO*/
       end custom_sort
from   toys t
order  by custom_sort, price/*TODO*/
EOF