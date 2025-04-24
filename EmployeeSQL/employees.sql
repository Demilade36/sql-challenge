-- Create titles table first (no foreign key dependencies)
CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(30) NOT NULL
);
SELECT * FROM titles

-- Then create the employees table
DROP TABLE IF EXISTS employees_staging;
CREATE TABLE employees_staging (
    emp_no INT,
    emp_title_id VARCHAR(5),
    birth_date TEXT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    sex VARCHAR(1),
    hire_date TEXT
);
SELECT * FROM employees_staging LIMIT 5;

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

INSERT INTO employees (
    emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date
)

SELECT 
    emp_no,
    emp_title_id,
    TO_DATE(birth_date, 'MM/DD/YYYY'),
    first_name,
    last_name,
    sex,
    TO_DATE(hire_date, 'MM/DD/YYYY')
FROM employees_staging;

SELECT * FROM employees

DROP TABLE IF EXISTS employees_staging;


-- Create departments table (no foreign key dependencies)
CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(30) NOT NULL
);
-- Create department manager junction table
CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create department employee junction table
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create salaries table
CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);