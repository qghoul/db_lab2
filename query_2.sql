-- query 2


SELECT 
    AVG(w.current_year_workload) AS average_current_year_workload
FROM 
    Employee e
JOIN 
    Workbook w ON e.employee_id = w.employee_id
WHERE
    e.department_id = 1 -- змінити на ID кафедри середнє навантаження асистентів якої необхідно отримати
AND
    e.position_name IN ('Асистент', 'Асистент к.н.');
