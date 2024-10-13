DROP DATABASE IF EXISTS lab2;

CREATE ROLE testuser LOGIN;

--For linux
CREATE DATABASE lab2 ENCODING 'UTF-8' LC_COLLATE 'en_US.UTF-8' LC_CTYPE 'en_US.UTF-8' TEMPLATE template0 OWNER testuser;

\c lab2

SET ROLE testuser;

CREATE TYPE order_type_enum AS ENUM ('Зарахування', 'Звільнення', 'Переведення', 'Зміна посади');
CREATE TYPE academic_degree_enum AS ENUM ('Доктор філософії', 'Доктор наук');
CREATE TYPE position_enum AS ENUM ('Профессор', 'Доцент', 'Старший викладач', 'Асистент к.н.', 'Асистент');

CREATE TABLE StateAward (
    stateAward_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    award_name TEXT NOT NULL
);
CREATE TABLE AcademicDegree (
    academicDegree_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    degree_name academic_degree_enum NOT NULL
);
CREATE TABLE Position (
    position_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    position_name position_enum NOT NULL
);
CREATE TABLE Subject (
    subject_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    subject_name TEXT NOT NULL
);
CREATE TABLE Department (
    department_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    department_name TEXT NOT NULL
);
CREATE TABLE Employee (
    employee_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    academicDegree_id INTEGER REFERENCES AcademicDegree(academicDegree_id) NULL,
    department_id INTEGER REFERENCES Department(department_id),
    position_id INTEGER REFERENCES Position(position_id),
    individual_tax_number TEXT NOT NULL,
    active_bool BOOLEAN DEFAULT TRUE
);
CREATE TABLE Workbook (
    workbook_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employee_id INTEGER REFERENCES Employee(employee_id) ON DELETE CASCADE,
    workbook_number TEXT NOT NULL,
    date_of_issue DATE NOT NULL,
    current_year_workload INTEGER,
    years_of_teaching_experience INTEGER NOT NULL
);
CREATE TABLE OrderType (
    orderType_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    type_name order_type_enum NOT NULL
);
CREATE TABLE TransferOrder (
    transferOrder_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    workbook_id INTEGER REFERENCES Workbook(workbook_id),
    orderType_id INTEGER REFERENCES OrderType(orderType_id),
    from_department_id INTEGER REFERENCES Department(department_id) NULL,
    to_department_id INTEGER REFERENCES Department(department_id) NOT NULL,
    order_number TEXT NOT NULL,
    order_date DATE NOT NULL
);
CREATE TABLE Employee_StateAwards (
    employee_id INTEGER REFERENCES Employee(employee_id) ON DELETE CASCADE NOT NULL,
    stateAward_id INTEGER REFERENCES StateAward(stateAward_id) ON DELETE CASCADE NOT NULL,
    PRIMARY KEY (employee_id, stateAward_id)
);
CREATE TABLE Employee_Subject (
    employee_id INTEGER REFERENCES Employee(employee_id) ON DELETE CASCADE NOT NULL,
    subject_id INTEGER REFERENCES Subject(subject_id) ON DELETE CASCADE NOT NULL,
    PRIMARY KEY (employee_id, subject_id)
);
CREATE TABLE PassportData (
    passportData_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employee_id INTEGER REFERENCES Employee(employee_id) ON DELETE CASCADE,
    full_name TEXT NOT NULL,
    passport_number TEXT NOT NULL,
    authority TEXT,
    date_of_birth DATE NOT NULL
);
CREATE TABLE Contract (
    contract_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employee_id INTEGER REFERENCES Employee(employee_id) ON DELETE CASCADE NOT NULL,
    signing_date DATE NOT NULL,
    end_date DATE NOT NULL
);
CREATE TABLE Vacation (
    vacation_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employee_id INTEGER REFERENCES Employee(employee_id) ON DELETE CASCADE NOT NULL,
    starting_date DATE NOT NULL,
    end_date DATE NOT NULL
);
