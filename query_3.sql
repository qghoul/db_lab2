-- query 3


SELECT 
    -- e.department_id, --може бути корисним для перевірки відповідності департаменту
    -- e.position_id, --може бути корисним для перевірки чи є викладач Деканом 
    s.subject_name,
    p.full_name,
    e.employee_id
FROM 
    Employee e
JOIN 
    PassportData p ON e.employee_id = p.employee_id
JOIN 
    Employee_Subject es ON e.employee_id = es.employee_id
JOIN 
    Subject s ON es.subject_id = s.subject_id
WHERE 
    e.department_id = 1 -- змінити на ID кафедри для якої необхідно отримати список дисциплін які викладають доценти з цієї кафедри
AND 
    e.position_name = ('Доцент'); -- перевірка, що посада = доцент
