-- query 5

SELECT 
    e.employee_id,
    p.full_name,
    v.starting_date,
    v.end_date
FROM 
    Employee e
JOIN 
    PassportData p ON e.employee_id = p.employee_id
JOIN 
    Vacation v ON e.employee_id = v.employee_id
WHERE 
    EXTRACT(MONTH FROM v.starting_date) = 1 -- вказати місяць для якого необхідно отримати список співробітників у відпустці 
    OR EXTRACT(MONTH FROM v.end_date) = 1; -- вказати місяць для якого необхідно отримати список співробітників у відпустці