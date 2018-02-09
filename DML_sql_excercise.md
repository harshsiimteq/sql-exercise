# DML Exercise

#### 1. Write a SQL statement to insert a record with your own value into the table countries against each columns.

```SQL
  INSERT INTO `countries` values (11, 'India', 54);

  -- Countries table

  +------------+--------------+-----------+
  | country_id | country_name | region_id |
  +------------+--------------+-----------+
  |         11 | India        |        54 |
  +------------+--------------+-----------+
```
#### 2. Write a SQL statement to insert one row into the table countries against the column country_id and country_name.

```SQL
  INSERT INTO  `countries` (country_id, country_name)
  VALUES (12, 'Pakistan');

  -- Countries table

  +------------+--------------+-----------+
  | country_id | country_name | region_id |
  +------------+--------------+-----------+
  |         11 | India        |      54   |
  |         12 | Pakistan     |      NULL |
  +------------+--------------+-----------+
```

#### 3. Write a SQL statement to create duplicate of countries table named country_new with all structure and data.

```SQL
  CREATE TABLE `country_new` LIKE `countries`;

  -- Countries table

  +--------------+------------------+------+-----+---------+----------------+
  | Field        | Type             | Null | Key | Default | Extra          |
  +--------------+------------------+------+-----+---------+----------------+
  | country_id   | int(11) unsigned | NO   | PRI | NULL    | auto_increment |
  | country_name | varchar(30)      | NO   |     | N/A     |                |
  | region_id    | int(11) unsigned | YES  |     | NULL    |                |
  +--------------+------------------+------+-----+---------+----------------+

  -- Country_new table

  +--------------+------------------+------+-----+---------+----------------+
  | Field        | Type             | Null | Key | Default | Extra          |
  +--------------+------------------+------+-----+---------+----------------+
  | country_id   | int(11) unsigned | NO   | PRI | NULL    | auto_increment |
  | country_name | varchar(30)      | NO   |     | N/A     |                |
  | region_id    | int(11) unsigned | YES  |     | NULL    |                |
  +--------------+------------------+------+-----+---------+----------------+
```

#### 4. Write a SQL statement to insert NULL values against region_id column for a row of countries table.

```SQL
  INSERT INTO `countries` VALUES (13, 'SriLanka', null);

  +------------+--------------+-----------+
  | country_id | country_name | region_id |
  +------------+--------------+-----------+
  |         11 | India        |        54 |
  |         12 | Pakistan     |      NULL |
  |         13 | SriLanka     |      NULL |
  +------------+--------------+-----------+
```

#### 5. Write a SQL statement to insert 3 rows by a single insert statement.

```SQL
  INSERT INTO `countries` VALUES(11, 'India', 54),
                                (12, 'Pakistan', 55),
                                (13, 'Srilanka', 56);
-- Countries table

  +------------+--------------+-----------+
  | country_id | country_name | region_id |
  +------------+--------------+-----------+
  |         11 | India        |        54 |
  |         12 | Pakistan     |        55 |
  |         13 | Srilanka     |        56 |
  +------------+--------------+-----------+
```
#### 6. Write a SQL statement insert rows from country_new table to countries table.

```SQL
  INSERT INTO `countries` SELECT * from `country_new`;

-- Countries table

  +------------+--------------+-----------+
  | country_id | country_name | region_id |
  +------------+--------------+-----------+
  |         11 | India        |        54 |
  |         12 | Pakistan     |        55 |
  |         13 | Srilanka     |        56 |
  +------------+--------------+-----------+
```

#### 7. Write a SQL statement to insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column.

```SQL
  -- Here `jobs` table has already primary key on job_id so it will always takes unique value.

  INSERT INTO `jobs` VALUES ('A10', 'Developer', 3000, 6000);

  +--------+-----------+------------+------------+
  | job_id | job_title | min_salary | max_salary |
  +--------+-----------+------------+------------+
  | A10    | Developer |       3000 |       6000 |
  +--------+-----------+------------+------------+
```

#### 8. Write a SQL statement to insert a record into the table countries to ensure that, a country_id and region_id combination will be entered once in the table.

```SQL
  -- TO do so, we have to make both columns as primary key as primary keys are unique, or make region_id unique. So it will take only unique values.

  +--------------+------------------+------+-----+---------+----------------+
  | Field        | Type             | Null | Key | Default | Extra          |
  +--------------+------------------+------+-----+---------+----------------+
  | country_id   | int(11) unsigned | NO   | PRI | NULL    | auto_increment |
  | country_name | varchar(30)      | NO   |     | N/A     |                |
  | region_id    | int(10) unsigned | YES  | UNI | NULL    |                |
  +--------------+------------------+------+-----+---------+----------------+

  INSERT INTO `countries` VALUES(11, 'India', 54),
                                (12, 'Pakistan', 55),
                                (13, 'Srilanka', 56);

```

#### 9.  Write a SQL statement to insert rows into the table countries in which the value of country_id column will be unique and auto incremented.

```SQL
  -- Here in `countries` table country_id is primary key hence it is unique and also auto_incremented so we do not need to insert the country_id, we must mentioned the rest of the column names in INSERT statement in order to enter the date.

  INSERT INTO `countries` (country_name, region_id) VALUES ('India', 88);

  +------------+--------------+-----------+
  | country_id | country_name | region_id |
  +------------+--------------+-----------+
  |         11 | India        |        54 |
  |         12 | Pakistan     |        55 |
  |         13 | Srilanka     |        56 |
  |         14 | India        |        88 |
  +------------+--------------+-----------+
```

#### 10. Write a SQL statement to insert records into the table countries to ensure that the country_id column will not contain any duplicate data and this will be automatically incremented and the column country_name will be filled up by 'N/A' if no value assigned for that column.

```SQL
  CREATE TABLE `countries` (
    `country_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `country_name` VARCHAR(30) NOT NULL DEFAULT 'N/A',
    `region_id` INT UNSIGNED NOT NULL
  )ENGINE=InnoDB  CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci;

  +--------------+------------------+------+-----+---------+----------------+
  | Field        | Type             | Null | Key | Default | Extra          |
  +--------------+------------------+------+-----+---------+----------------+
  | country_id   | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
  | country_name | varchar(30)      | NO   |     | N/A     |                |
  | region_id    | int(10) unsigned | NO   |     | NULL    |                |
  +--------------+------------------+------+-----+---------+----------------+

  -- Here in `countries` table the country_id column is AUTO_INCREMENT and PRIMARY KEY so it will take unique as well as auto generated value.
  -- In country_name coulmn there's DEFAULT 'N/A', so if we do not enter the value in country_name, it will take 'N/A' value by default.

  INSERT INTO `countries` (region_id) VALUES (22);

  +------------+--------------+-----------+
  | country_id | country_name | region_id |
  +------------+--------------+-----------+
  |          1 | N/A          |        22 |
  +------------+--------------+-----------+
```
#### 11. Write a SQL statement to insert rows in the job_history table in which one column job_id is containing those values which are exists in job_id column of jobs table.

```SQL
  mysql> select * from jobs;
  +--------+----------------+------------+------------+
  | job_id | job_title      | min_salary | max_salary |
  +--------+----------------+------------+------------+
  | A1     | Developer      |       2000 |       6000 |
  | A2     | SEO            |       4000 |       8000 |
  | A3     | Data Analytics |       5000 |       7000 |
  +--------+----------------+------------+------------+

  insert into job_history values(1, '2017-12-02', '2020-12-02','A1', 21);

  mysql> select * from job_history;
  +-------------+------------+------------+--------+---------------+
  | employee_id | start_date | end_date   | job_id | department_id |
  +-------------+------------+------------+--------+---------------+
  |           1 | 2017-12-02 | 2020-12-02 | A1     |            21 |
  +-------------+------------+------------+--------+---------------+
```
#### 12. Write a SQL statement to insert rows into the table employees in which a set of columns department_id and manager_id contains a unique value and that combined values must have exists into the table departments.

```SQL
  +-----------------+--------------+------+-----+---------+-------+
  | Field           | Type         | Null | Key | Default | Extra |
  +-----------------+--------------+------+-----+---------+-------+
  | department_id   | decimal(4,0) | NO   | PRI | 0       |       |
  | department_name | varchar(30)  | NO   |     | NULL    |       |
  | manager_id      | decimal(6,0) | YES  |     | NULL    |       |
  | location_id     | decimal(4,0) | YES  |     | NULL    |       |
  +-----------------+--------------+------+-----+---------+-------+
  mysql> desc employees;
  +---------------+---------------------+------+-----+---------+-------+
  | Field         | Type                | Null | Key | Default | Extra |
  +---------------+---------------------+------+-----+---------+-------+
  | employee_id   | int(8) unsigned     | NO   | PRI | NULL    |       |
  | first_name    | varchar(15)         | NO   |     | NULL    |       |
  | last_name     | varchar(15)         | NO   |     | NULL    |       |
  | email         | varchar(255)        | NO   |     | NULL    |       |
  | phone_number  | bigint(11) unsigned | NO   |     | NULL    |       |
  | hire_date     | date                | NO   |     | NULL    |       |
  | job_id        | varchar(8)          | NO   |     | NULL    |       |
  | salary        | int(11) unsigned    | NO   |     | NULL    |       |
  | commission    | int(11) unsigned    | YES  |     | NULL    |       |
  | manager_id    | decimal(6,0)        | YES  | MUL | NULL    |       |
  | department_id | decimal(4,0)        | NO   | MUL | NULL    |       |
  +---------------+---------------------+------+-----+---------+-------+
  +---------------+-----------------+------------+-------------+
  | department_id | department_name | manager_id | location_id |
  +---------------+-----------------+------------+-------------+
  |           101 | Computer        |        551 |         221 |
  |           102 | Civil           |        552 |         222 |
  |           103 | Mech            |        553 |         223 |
  +---------------+-----------------+------------+-------------+
  INSERT INTO `employees` VALUES (1111, 'Harsh', 'Shah', 'hgshah021@gmail.com', 7817828290, '2017-12-02', 'A5102', 10000, 2000, 551, 101);
  INSERT INTO `employees` VALUES (1112, 'Rahul', 'Dhamecha', 'rahul021@gmail.com', 7815558290, '2017-12-02', 'A5103', 8000, 1500, 552, 102);

  +-------------+------------+-----------+---------------------+--------------+------------+--------+--------+------------+------------+---------------+
  | employee_id | first_name | last_name | email               | phone_number | hire_date  | job_id | salary | commission | manager_id | department_id |
  +-------------+------------+-----------+---------------------+--------------+------------+--------+--------+------------+------------+---------------+
  |        1111 | Harsh      | Shah      | hgshah021@gmail.com |   7817828290 | 2017-12-02 | A5102  |  10000 |       2000 |        551 |           101 |
  |        1112 | Rahul      | Dhamecha  | rahul021@gmail.com  |   7815558290 | 2017-12-02 | A5103  |   8000 |       1500 |        552 |           102 |
  +-------------+------------+-----------+---------------------+--------------+------------+--------+--------+------------+------------+---------------+
```

#### 13. Write a SQL statement to insert rows into the table employees in which a set of columns department_id and job_id contains the values which must have exists into the table departments and jobs.

```SQL

-- Department table

  +-----------------+-----------------------+------+-----+---------+-------+
  | Field           | Type                  | Null | Key | Default | Extra |
  +-----------------+-----------------------+------+-----+---------+-------+
  | department_id   | decimal(4,0) unsigned | NO   | PRI | 0       |       |
  | departmant_name | varchar(30)           | NO   |     | NULL    |       |
  | manager_id      | decimal(6,0)          | NO   | UNI | NULL    |       |
  | location_id     | decimal(4,0)          | YES  |     | NULL    |       |
  +-----------------+-----------------------+------+-----+---------+-------+

-- Employee table

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

  INSERT INTO `departments` VALUES (101, 'Computer', 111, 1001),
                                   (102, 'Civil', 112, 1002),
                                   (103, 'Mechanical', 113, 1003);
  INSERT INTO `employees` VALUES (1111, 'Harsh', 'Shah', 'hgshah021@gmail.com', 7817828290, '2017-12-02', 'A5102', 10000, 2000, 111, 101),
  (1112, 'Raj', 'Sanghvi', 'raj021@gmail.com', 7815268290, '2017-12-02', 'A5103', 10000, 2000, 112, 102);

  +-------------+------------+-----------+---------------------+--------------+------------+--------+--------+------------+------------+---------------+
  | employee_id | first_name | last_name | email               | phone_number | hire_date  | job_id | salary | commission | manager_id | department_id |
  +-------------+------------+-----------+---------------------+--------------+------------+--------+--------+------------+------------+---------------+
  |        1111 | Harsh      | Shah      | hgshah021@gmail.com |   7817828290 | 2017-12-02 | A5102  |  10000 |       2000 |        111 |           101 |
  |        1112 | Raj        | Sanghvi   | raj021@gmail.com    |   7815268290 | 2017-12-02 | A5103  |  10000 |       2000 |        112 |           102 |
  +-------------+------------+-----------+---------------------+--------------+------------+--------+--------+------------+------------+---------------+
```
