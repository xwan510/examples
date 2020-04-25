EXPLAIN ANALYZE
WITH RECURSIVE recursive_query(id, child_id) AS (
	    -- Non-recursive initial case
    SELECT id, child_id from my_tree WHERE id = 0
  UNION
    -- Recurive case
    SELECT t.id, t.child_id FROM my_tree t, recursive_query
    WHERE recursive_query.child_id = t.id
)
SELECT * FROM recursive_query


create or replace function recursive_function (my_id int)
returns table (id int, child_id int)
language plpgsql
as $$
begin
	    RETURN QUERY
	    SELECT (recursive_function(A.child_id)).*
	    FROM my_tree A WHERE A.id = my_id;

	    RETURN QUERY 
	    SELECT B.id, B.child_id 
	    FROM my_tree B
	    WHERE B.id = my_id;
end $$;
EXPLAIN ANALYZE SELECT * FROM recursive_function (0);

