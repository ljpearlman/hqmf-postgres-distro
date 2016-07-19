set search_path = results;
create function year_delta(lhs timestamp, rhs timestamp) returns float as $$
SELECT CASE
   WHEN ($2 >= $1) THEN
       CASE
          WHEN (EXTRACT(month FROM $2) < EXTRACT(month FROM $1)) 
            THEN (EXTRACT(year FROM $2) - EXTRACT(year FROM $1)) - 1
          WHEN (EXTRACT(month FROM $2) = EXTRACT(month FROM $1) AND EXTRACT(day FROM $2) >= EXTRACT(day FROM $1)) 
            THEN EXTRACT(year FROM $2) - EXTRACT(year FROM $1)
          WHEN (EXTRACT(month FROM $2) = EXTRACT(month FROM $1) AND EXTRACT(day FROM $2) < EXTRACT(day FROM $1))
            THEN (EXTRACT(year FROM $2) - EXTRACT(year FROM $1)) - 1 
          WHEN (EXTRACT(month FROM $2) > EXTRACT(month FROM $1)) 
            THEN EXTRACT(year FROM $2) - EXTRACT(year FROM $1)
       END 
   WHEN ($2 < $1) THEN 
       CASE
          WHEN (EXTRACT(month FROM $1) < EXTRACT(month FROM $2)) 
            THEN (EXTRACT(year FROM $1) - EXTRACT(year FROM $2)) - 1
          WHEN (EXTRACT(month FROM $1) = EXTRACT(month FROM $2) AND EXTRACT(day FROM $1) >= EXTRACT(day FROM $2))
            THEN EXTRACT(year FROM $1) - EXTRACT(year FROM $2)
          WHEN (EXTRACT(month FROM $1) = EXTRACT(month FROM $2) AND EXTRACT(day FROM $1) < EXTRACT(day FROM $2))
            THEN (EXTRACT(year FROM $1) - EXTRACT(year FROM $2)) - 1
          WHEN (EXTRACT(month FROM $1) > EXTRACT(month FROM $2))
            THEN EXTRACT(year FROM $1) - EXTRACT(year FROM $2) 
       END
   ELSE NULL
END
$$ LANGUAGE SQL;

create function month_delta(lhs timestamp, rhs timestamp) returns float as $$
SELECT CASE
   WHEN ($2 >= $1) THEN 
     CASE
        WHEN (EXTRACT(day FROM $2) >= EXTRACT(day FROM $1))
          THEN ((EXTRACT(year FROM $2) - EXTRACT(year FROM $1)) * 12 + EXTRACT(month FROM $2)) - EXTRACT(month FROM $1)
        WHEN (EXTRACT(day FROM $2) < EXTRACT(day FROM $1))
          THEN (((EXTRACT(year FROM $2) - EXTRACT(year FROM $1)) * 12 + EXTRACT(month FROM $2)) - EXTRACT(month FROM $1)) - 1
     END
   WHEN ($2 < $1) THEN
       CASE
          WHEN (EXTRACT(day FROM $2) >= EXTRACT(day FROM $2))
            THEN ((EXTRACT(year FROM $2) - EXTRACT(year FROM $2)) * 12 + EXTRACT(month FROM $2)) - EXTRACT(month FROM $2) 
          WHEN (EXTRACT(day FROM $2) < EXTRACT(day FROM $2))
            THEN (((EXTRACT(year FROM $2) - EXTRACT(year FROM $2)) * 12 + EXTRACT(month FROM $2)) - EXTRACT(month FROM $2)) - 1
       END
    ELSE NULL
END
$$ LANGUAGE SQL;

create function week_delta(lhs timestamp, rhs timestamp) returns float as $$
   select floor(abs(CAST($2 AS DATE) - CAST($1 AS DATE)) / 7)
$$ LANGUAGE SQL;

create function day_delta(lhs timestamp, rhs timestamp) returns integer as $$
  select abs(CAST($2 AS DATE) - CAST($1 AS DATE))
$$ LANGUAGE SQL;

