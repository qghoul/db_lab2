-- query 7


SELECT 
    -- e.employee_id,
    p.full_name,
    sa.award_name -- непотрібно, якщо необіхдно вивести лише список сспівробітників без заначення нагород
FROM 
    Employee e
JOIN 
    PassportData p ON e.employee_id = p.employee_id
JOIN 
    Employee_StateAwards esa ON e.employee_id = esa.employee_id
JOIN 
    StateAward sa ON esa.stateAward_id = sa.stateAward_id; -- непотрібно, якщо необіхдно вивести лише список сспівробітників без заначення нагород
