-- query 5

SELECT 
    -- e.employee_id,
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
    (v.starting_date <= '2024-01-31' AND v.end_date >= '2024-01-01'); -- змінити рік та змінити місяць на той для якого необхідно отримати перелік співробітників у відпостці

    -- У попередній версії запиту могли б виникати проблеми з відпустками довжиною більше 2 місяців, тому що у такому випадку номер проміжного місяця не містився б у start_date та end_Date
    -- У оновленій версії запиту йде перевірка по датам, що дозволить уникнути цєїй проблеми
