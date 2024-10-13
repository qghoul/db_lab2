-- query 6

SELECT 
    e.employee_id,
    p.full_name,
    c.end_date
FROM 
    Employee e
JOIN 
    PassportData p ON e.employee_id = p.employee_id
JOIN 
    Contract c ON e.employee_id = c.employee_id
WHERE 
    c.end_date < CURRENT_DATE;