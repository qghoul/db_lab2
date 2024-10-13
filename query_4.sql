-- query 4


SELECT 
    -- e.position_id,
    p.position_name,
    COUNT(e.employee_id) AS employee_count
FROM 
    Employee e
JOIN 
    Position p ON e.position_id = p.position_id
WHERE 
    e.active_bool = TRUE
GROUP BY 
    e.position_id, p.position_name;