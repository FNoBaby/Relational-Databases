CREATE DATABASE Advanced_Diploma_DB;
GO

USE Advanced_Diploma_DB
GO

CREATE TABLE regions
( 
  region_id NUMERIC CONSTRAINT reg_id_pk PRIMARY KEY
                    CONSTRAINT region_id_nn NOT NULL, 
  region_name VARCHAR(25) 
);

CREATE TABLE countries 
( 
  country_id  CHAR(2) CONSTRAINT country_c_id_pk PRIMARY KEY 
	                  CONSTRAINT country_id_nn NOT NULL, 
  country_name VARCHAR(40), 
  region_id NUMERIC,
  CONSTRAINT countr_reg_fk FOREIGN KEY (region_id) REFERENCES regions(region_id)   
); 


CREATE TABLE locations
( 
  location_id NUMERIC(4) CONSTRAINT loc_id_pk PRIMARY KEY,
  street_address VARCHAR(40),
  postal_code VARCHAR(12),
  city VARCHAR(30) CONSTRAINT loc_city_nn NOT NULL,
  state_province VARCHAR(25),
  country_id CHAR(2),
  CONSTRAINT loc_c_id_fk FOREIGN KEY (country_id) REFERENCES countries(country_id) 
);

CREATE SEQUENCE locations_seq
 START WITH 3300
 INCREMENT BY 100
 MAXVALUE 9900
 NO CACHE
 NO CYCLE;

CREATE TABLE departments
( 
  department_id  NUMERIC(4) CONSTRAINT dept_id_pk PRIMARY KEY,
  department_name  VARCHAR(30) CONSTRAINT  dept_name_nn  NOT NULL,
  manager_id   NUMERIC(6),
  location_id  NUMERIC(4),
  CONSTRAINT dept_loc_fk FOREIGN KEY (location_id) REFERENCES locations (location_id)
);

CREATE SEQUENCE departments_seq
 START WITH 280
 INCREMENT BY   10
 MAXVALUE   9990
 NO CACHE
 NO CYCLE;

CREATE TABLE jobs
( 
  job_id VARCHAR(10) CONSTRAINT job_id_pk PRIMARY KEY(job_id), 
  job_title VARCHAR(35) CONSTRAINT job_title_nn  NOT NULL, 
  min_salary NUMERIC(6), 
  max_salary NUMERIC(6)
);

CREATE TABLE employees
( 
  employee_id  NUMERIC(6) CONSTRAINT emp_emp_id_pk PRIMARY KEY, 
  first_name VARCHAR(20), 
  last_name  VARCHAR(25) CONSTRAINT emp_last_name_nn  NOT NULL, 
  email  VARCHAR(25) CONSTRAINT emp_email_nn  NOT NULL
                     CONSTRAINT emp_email_uk UNIQUE, 
  phone_number   VARCHAR(20), 
  hire_date DATETIME CONSTRAINT emp_hire_DATETIME_nn  NOT NULL, 
  job_id   VARCHAR(10) CONSTRAINT emp_job_nn  NOT NULL, 
  salary   NUMERIC(8,2) CONSTRAINT emp_salary_min CHECK (salary > 0), 
  commission_pct NUMERIC(2,2), 
  manager_id NUMERIC(6), 
  department_id  NUMERIC(4),
  CONSTRAINT emp_dept_fk FOREIGN KEY (department_id) REFERENCES departments, 
  CONSTRAINT emp_job_fk FOREIGN KEY (job_id) REFERENCES jobs (job_id), 
  CONSTRAINT emp_manager_fk FOREIGN KEY (manager_id) REFERENCES employees(employee_id),  
) ;

CREATE SEQUENCE employees_seq
 START WITH 207
 INCREMENT BY 1
 NO CYCLE
 NO CACHE;

ALTER TABLE departments
ADD CONSTRAINT dep_mgr_fk
    FOREIGN KEY(manager_id)
	REFERENCES employees(employee_id);
 

CREATE TABLE job_history
( employee_id   NUMERIC(6) CONSTRAINT jhist_employee_nn NOT NULL,
  start_date  DATETIME CONSTRAINT  jhist_start_date_nn  NOT NULL, 
  end_date  DATETIME CONSTRAINT  jhist_end_date_nn  NOT NULL, 
  job_id  VARCHAR(10) CONSTRAINT  jhist_job_nn  NOT NULL, 
  department_id NUMERIC(4), 
  CONSTRAINT jhist_emp_id_st_DATETIME_pk PRIMARY KEY (employee_id, start_date),
  CONSTRAINT jhist_DATETIME_interval CHECK (end_date > start_date),
  CONSTRAINT jhist_job_fk FOREIGN KEY (job_id) REFERENCES jobs, 
  CONSTRAINT jhist_emp_fk FOREIGN KEY (employee_id) REFERENCES employees, 
  CONSTRAINT jhist_dept_fk FOREIGN KEY (department_id) REFERENCES departments
) ;

CREATE UNIQUE INDEX jhist_emp_id_st_DATETIME_idx 
ON job_history (employee_id, start_date) ;

CREATE TABLE job_grades
(
  grade_level CHAR(1) NOT NULL PRIMARY KEY,
  lowest_sal NUMERIC(9) NOT NULL,
  highest_sal NUMERIC(9) NOT NULL
);
