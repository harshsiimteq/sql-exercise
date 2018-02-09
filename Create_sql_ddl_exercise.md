### DDL command exercise

#### CREATE

##### 1. Write a SQL statement to create a simple table countries including columns country_id, country_name and region_id.

```SQL
  DROP TABLE IF EXISTS `countries`;
  CREATE TABLE `countries` (
    `country_id` INT UNIQUE UNSIGNED NOT NULL PRIMARY KEY,
    `country_name` VARCHAR(30) COLLATE 'utf8_unicode_ci' NOT NULL,
    `region_id` INT UNSIGNED NOT NULL
  ) ENGINE=InnoDB  CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci;
```
##### 2. Write a SQL statement to create a simple table countries including columns country_id, country_name and region_id which is already exists.

```SQL
  CREATE TABLE IF NOT EXISTS `countries` (
    `country_id` INT UNIQUE UNSIGNED NOT NULL PRIMARY KEY,
    `country_name` VARCHAR(30) COLLATE 'utf8_unicode_ci' NOT NULL,
    `region_id` INT UNSIGNED NOT NULL
  ) ENGINE=InnoDB  CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci;
```
##### 3. Write a SQL statement to create the structure of a table dup_countries similar to countries.

```SQL
One way ------------------------------------
  CREATE TABLE IF NOT EXISTS `dup_countries` SELECT * FROM `countries`;
but if we use this query the key CONSTRAINTs will not be copied.

Another way --------------------------------------
  CREATE TABLE IF NOT EXISTS `dup_countries` LIKE `countries`;
this is the right way to copy the data structures, all key CONSTRAINTs will be copied.
```
##### 4. Write a SQL statement to create a duplicate copy of countries table including structure and data by name dup_countries.

```SQL
  CREATE TABLE `dup_countries` AS SELECT * FROM `countries`;
```

##### 5. Write a SQL statement to create a table countries set a constraint NULL.

```SQL
  CREATE TABLE IF NOT EXISTS `countries` (
    `country_id` INT UNIQUE UNSIGNED NOT NULL PRIMARY KEY,
    `country_name` VARCHAR(30) COLLATE 'utf8_unicode_ci' NULL,
    `region_id` INT UNSIGNED NULL
  ) ENGINE=InnoDB  CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci;
```

##### 6. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary and check whether the max_salary amount exceeding the upper limit 25000.

```SQL
  CREATE TABLE IF NOT EXISTS `jobs` (
    `job_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `job_title` ENUM('title1', 'title2', 'title3') NOT NULL,
    `min_salary` FLOAT(10,2) UNSIGNED NOT NULL,
    `max-salary` FLOAT(10,2) UNSIGNED NOT NULL CHECK('max-salary' <= 25000)
  )ENGINE=InnoDB  CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci;
```

##### 7. Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that no countries except Italy, India and China will be entered in the table.

```SQL

One way ----------------------------------------------------------

  CREATE TABLE `countries` (
    `country_id` INT UNIQUE UNSIGNED NOT NULL PRIMARY KEY,
    `country_name` VARCHAR(30) COLLATE 'utf8_unicode_ci' NOT NULL CHECK(`country_name` IN ('Italy', 'India', 'China')),
    `region_id` INT UNSIGNED NOT NULL
  )ENGINE=InnoDB  CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci;

Another way -----------------------------------------------------

  CREATE TABLE `countries` (
    `country_id` INT UNIQUE UNSIGNED NOT NULL PRIMARY KEY,
    `country_name` ENUM('Italy', 'India', 'China') NOT NULL,
    `region_id` INT UNSIGNED NOT NULL
  )ENGINE=InnoDB  CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci;

```

##### 8. Write a SQL statement to create a table named job_history including columns employee_id, start_date, end_date, job_id and department_id and make sure that the value against column end_date will be entered at the time of insertion to the format like '--/--/----'.

```SQL
  CREATE TABLE `job_history` (
    `employee_id` INT UNIQUE UNSIGNED NOT NULL PRIMARY KEY,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL CHECK('end_date' LIKE='--/--/----'),
    `job_id` INT UNSIGNED NOT NULL,
    `department_id` INT UNSIGNED NOT NULL
  )ENGINE=InnoDB  CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci;
```

##### 9. Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that no duplicate data against column country_id will be allowed at the time of insertion.

```SQL
  CREATE TABLE `countries` (
    `country_id` INT UNIQUE UNSIGNED NOT NULL PRIMARY KEY,
    `country_name` VARCHAR(30) NOT NULL COLLATE 'utf8_unicode_ci',
    `region_id` INT UNSIGNED NOT NULL
  )ENGINE=InnoDB  CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci;
```

##### 10. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary and max_salary, and make sure that, the default value for job_title is blank and min_salary is 8000 and max_salary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.

```SQL
  CREATE TABLE `jobs` (
    `job_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `job_title` VARCHAR(20) NOT NULL COLLATE 'utf8_unicode_ci' DEFAULT ' ',
    `min_salary` FLOAT(10,2) UNSIGNED NOT NULL DEFAULT 8000,
    `max_salary` FLOAT(10,2) UNSIGNED NOT NULL DEFAULT NULL
  )ENGINE=InnoDB  CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci;
```

##### 11.  Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that the country_id column will be a key field which will not contain any duplicate data at the time of insertion.

```SQL
  CREATE TABLE `countries` (
    `country_id` INT UNSIGNED NOT NULL PRIMARY KEY,
    `country_name` VARCHAR(30) COLLATE 'utf8_unicode_ci' NOT NULL,
    `region_id` INT NOT NULL
  )ENGINE=InnoDB  CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci;
```

##### 12. Write a SQL statement to create a table countries including columns country_id, country_name and region_id and make sure that the column country_id will be unique and store an auto incremented value.

```SQL
  CREATE TABLE `countries` (
    `country_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `country_name` VARCHAR(30) COLLATE 'utf8_unicode_ci' NOT NULL,
    `region_id` INT NOT NULL
  )ENGINE=InnoDB  CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci;
```

##### 13. Write a SQL statement to create a table countries including columns country_id, country_name and region_id and make sure that the combination of columns country_id and region_id will be unique.

```SQL
  CREATE TABLE `countries` (
    `country_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `country_name` VARCHAR(30) COLLATE 'utf8_unicode_ci' NOT NULL,
    `region_id` INT NOT NULL PRIMARY KEY
  )ENGINE=InnoDB  CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci;
```
##### 14. Write a SQL statement to create a table job_history including columns employee_id, start_date, end_date, job_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key column job_id contain only those values which are exists in the jobs table.

```SQL

  CREATE TABLE `jobs` (
    `job_id` VARCHAR(10) NOT NULL PRIMARY KEY,
    `job_title` VARCHAR(35) NOT NULL,
    `min_salary` DECIMAL(6,0) NULL DEFAULT NULL,
    `max_salary` DECIMAL(6,0) NULL DEFAULT NULL
  )ENGINE=InnoDB  CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci;

  CREATE TABLE `job_history` (
    `employee_id` INT UNSIGNED NOT NULL PRIMARY KEY,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL CHECK('end_date' LIKE '--/--/----'),
    `job_id` VARCHAR(10) NOT NULL,
    `department_id` INT UNSIGNED NOT NULL,
    FOREIGN KEY (`job_id`) REFERENCES `jobs`(`job_id`)
  )ENGINE=InnoDB  CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci;
```
##### 15.  Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key columns combined by department_id and manager_id columns contain only those unique combination values, which combinations are exists in the departments table.

```SQL
  CREATE TABLE `employees` (
    `employee_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(50) COLLATE 'utf8_unicode_ci' NOT NULL,
    `last_name` VARCHAR(50) COLLATE 'utf8_unicode_ci' NOT NULL,
    `email` VARCHAR(50) COLLATE 'utf8_unicode_ci' NOT NULL,
    `phone_number` VARCHAR(21) COLLATE 'utf8_unicode_ci' NOT NULL,
    `hire_date` DATE NOT NULL,
    `job_id` INT NOT NULL,
    `salary` FLOAT(10,2) UNSIGNED NOT NULL,
    `commission` FLOAT(7,2) UNSIGNED DEFAULT NULL,
    `manager_id` INT UNSIGNED NOT NULL,
    `department_id` INT UNSIGNED NOT NULL,
    FOREIGN KEY (`manager_id`) REFERENCES `managers`(`manager_id`),
    FOREIGN KEY (`department_id`) REFERENCES `departments`(`department_id`)
  );
```

##### 16. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column department_id, reference by the column department_id of departments table, can contain only those values which are exists in the departments table and another foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables.

```SQL
  CREATE TABLE IF NOT EXISTS `departments` (
    `department_id` DECIMAL(4,0) UNSIGNED NOT NULL PRIMARY KEY DEFAULT 0,
    `departmant_name` VARCHAR(30) NOT NULL,
    `manager_id` DECIMAL(6,0) UNIQUE NOT NULL,
    `location_id` DECIMAL(4,0)
  )ENGINE=InnoDB  CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci;

-- Departments table

  +-----------------+-----------------------+------+-----+---------+-------+
  | Field           | Type                  | Null | Key | Default | Extra |
  +-----------------+-----------------------+------+-----+---------+-------+
  | department_id   | decimal(4,0) unsigned | NO   | PRI | 0       |       |
  | departmant_name | varchar(30)           | NO   |     | NULL    |       |
  | manager_id      | decimal(6,0)          | NO   | UNI | NULL    |       |
  | location_id     | decimal(4,0)          | YES  |     | NULL    |       |
  +-----------------+-----------------------+------+-----+---------+-------+

  CREATE TABLE IF NOT EXISTS `jobs` (
  `job_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `job_title` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `min_salary` decimal(6,0) DEFAULT NULL,
  `max_salary` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`job_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Jobs table

  +------------+--------------+------+-----+---------+-------+
  | Field      | Type         | Null | Key | Default | Extra |
  +------------+--------------+------+-----+---------+-------+
  | job_id     | varchar(10)  | NO   | PRI | NULL    |       |
  | job_title  | varchar(35)  | NO   |     | NULL    |       |
  | min_salary | decimal(6,0) | YES  |     | NULL    |       |
  | max_salary | decimal(6,0) | YES  |     | NULL    |       |
  +------------+--------------+------+-----+---------+-------+

  CREATE TABLE IF NOT EXISTS `employees` (
  `employee_id` int(8) unsigned NOT NULL,
  `first_name` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` bigint(11) unsigned NOT NULL,
  `hire_date` date NOT NULL,
  `job_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `salary` int(11) unsigned NOT NULL,
  `commission` int(11) unsigned DEFAULT NULL,
  `manager_id` decimal(6,0) DEFAULT NULL,
  `department_id` decimal(4,0) NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_emp_dep` (`department_id`),
  KEY `fk_man_dep` (`manager_id`),
  CONSTRAINT `fk_emp_dep` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  CONSTRAINT `fk_man_dep` FOREIGN KEY (`manager_id`) REFERENCES `departments` (`manager_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Employees table

  +---------------+---------------------+------+-----+---------+-------+
  | Field         | Type                | Null | Key | Default | Extra |
  +---------------+---------------------+------+-----+---------+-------+
  | employee_id   | int(8) unsigned     | NO   | PRI | NULL    |       |
  | first_name    | varchar(15)         | NO   |     | NULL    |       |
  | last_name     | varchar(15)         | NO   |     | NULL    |       |
  | email         | varchar(255)        | NO   |     | NULL    |       |
  | phone_number  | bigint(11) unsigned | NO   |     | NULL    |       |
  | hire_date     | date                | NO   |     | NULL    |       |
  | job_id        | varchar(10)         | NO   |     | NULL    |       |
  | salary        | int(11) unsigned    | NO   |     | NULL    |       |
  | commission    | int(11) unsigned    | YES  |     | NULL    |       |
  | manager_id    | decimal(6,0)        | YES  | MUL | NULL    |       |
  | department_id | decimal(4,0)        | NO   | MUL | NULL    |       |
  +---------------+---------------------+------+-----+---------+-------+
```

#### 17.  Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, job_id, salary and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables. The specialty of the statement is that, The ON UPDATE CASCADE action allows you to perform cross-table update and ON DELETE RESTRICT action reject the deletion. The default action is ON DELETE RESTRICT.

```SQL
  CREATE TABLE IF NOT EXISTS `employees` (
  `employee_id` int(8) unsigned NOT NULL,
  `first_name` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` bigint(11) unsigned NOT NULL,
  `hire_date` date NOT NULL,
  `job_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `salary` int(11) unsigned NOT NULL,
  `commission` int(11) unsigned DEFAULT NULL,
  `manager_id` decimal(6,0) DEFAULT NULL,
  `department_id` decimal(4,0) NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_emp_dep` (`department_id`),
  KEY `fk_man_dep` (`manager_id`),
  CONSTRAINT `fk_emp_dep` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  CONSTRAINT `fk_man_dep` FOREIGN KEY (`manager_id`) REFERENCES `departments` (`manager_id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
```
#### 18. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, job_id, salary and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables. The specialty of the statement is that, The ON DELETE CASCADE that lets you allow to delete records in the employees(child) table that refer to a record in the jobs(parent) table when the record in the parent table is deleted and the ON UPDATE RESTRICT actions reject any updates.

```SQL
  CREATE TABLE IF NOT EXISTS `employees` (
  `employee_id` int(8) unsigned NOT NULL,
  `first_name` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` bigint(11) unsigned NOT NULL,
  `hire_date` date NOT NULL,
  `job_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `salary` int(11) unsigned NOT NULL,
  `commission` int(11) unsigned DEFAULT NULL,
  `manager_id` decimal(6,0) DEFAULT NULL,
  `department_id` decimal(4,0) NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_emp_dep` (`department_id`),
  KEY `fk_man_dep` (`manager_id`),
  CONSTRAINT `fk_emp_dep` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
  ON DELETE CASCADE
  ON UPDATE RESTRICT,
  CONSTRAINT `fk_man_dep` FOREIGN KEY (`manager_id`) REFERENCES `departments` (`manager_id`)
  ON DELETE CASCADE
  ON UPDATE RESTRICT
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
```
#### 19. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, job_id, salary and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables. The specialty of the statement is that, The ON DELETE SET NULL action will set the foreign key column values in the child table(employees) to NULL when the record in the parent table(jobs) is deleted, with a condition that the foreign key column in the child table must accept NULL values and the ON UPDATE SET NULL action resets the values in the rows in the child table(employees) to NULL values when the rows in the parent table(jobs) are updated.

```SQL
  CREATE TABLE IF NOT EXISTS `employees` (
  `employee_id` int(8) unsigned NOT NULL,
  `first_name` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` bigint(11) unsigned NOT NULL,
  `hire_date` date NOT NULL,
  `job_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `salary` int(11) unsigned NOT NULL,
  `commission` int(11) unsigned DEFAULT NULL,
  `manager_id` decimal(6,0) DEFAULT NULL,
  `department_id` decimal(4,0) NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_emp_dep` (`department_id`),
  KEY `fk_man_dep` (`manager_id`),
  CONSTRAINT `fk_emp_dep` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
  ON DELETE SET NULL
  ON UPDATE SET NULL,
  CONSTRAINT `fk_man_dep` FOREIGN KEY (`manager_id`) REFERENCES `departments` (`manager_id`)
  ON DELETE SET NULL
  ON UPDATE SET NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
```

#### 20. Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, job_id, salary and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. The InnoDB Engine have been used to create the tables. The specialty of the statement is that, The ON DELETE NO ACTION and the ON UPDATE NO ACTION actions will reject the deletion and any updates.

```SQL
  CREATE TABLE IF NOT EXISTS `employees` (
  `employee_id` int(8) unsigned NOT NULL,
  `first_name` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` bigint(11) unsigned NOT NULL,
  `hire_date` date NOT NULL,
  `job_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `salary` int(11) unsigned NOT NULL,
  `commission` int(11) unsigned DEFAULT NULL,
  `manager_id` decimal(6,0) DEFAULT NULL,
  `department_id` decimal(4,0) NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_emp_dep` (`department_id`),
  KEY `fk_man_dep` (`manager_id`),
  CONSTRAINT `fk_emp_dep` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  CONSTRAINT `fk_man_dep` FOREIGN KEY (`manager_id`) REFERENCES `departments` (`manager_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
```
