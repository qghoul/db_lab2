-- query 1


SELECT 
    e.employee_id, 
    pd.full_name,
    -- e.department_id,    -- може бути корисним для перевірки відповідності департаменту
    p.position_name, 
    w.years_of_teaching_experience
FROM 
    Employee e
JOIN
    Position p ON e.position_id = p.position_id
JOIN 
    PassportData pd ON e.employee_id = pd.employee_id
JOIN 
    Workbook w ON e.employee_id = w.employee_id
WHERE 
    e.department_id = 1; -- змінити на ID кафедри перелік співробітників якої необхідно отримати

