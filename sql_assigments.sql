
CREATE SCHEMA IF NOT EXISTS `sql_assigments`;

USE `sql_assigments`;

CREATE TABLE IF NOT EXISTS `departments` (
  `department_id` DECIMAL(4,0) UNSIGNED NOT NULL PRIMARY KEY DEFAULT 0,
  `departmant_name` VARCHAR(30) NOT NULL,
  `manager_id` DECIMAL(6,0) UNIQUE NOT NULL,
  `location_id` DECIMAL(4,0)
)ENGINE=InnoDB  CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

+-----------------+-----------------------+------+-----+---------+-------+
| Field           | Type                  | Null | Key | Default | Extra |
+-----------------+-----------------------+------+-----+---------+-------+
| department_id   | decimal(4,0) unsigned | NO   | PRI | 0       |       |
| departmant_name | varchar(30)           | NO   |     | NULL    |       |
| manager_id      | decimal(6,0)          | NO   | UNI | NULL    |       |
| location_id     | decimal(4,0)          | YES  |     | NULL    |       |
+-----------------+-----------------------+------+-----+---------+-------+

-------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `jobs` (
`job_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
`job_title` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
`min_salary` decimal(6,0) DEFAULT NULL,
`max_salary` decimal(6,0) DEFAULT NULL,
PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| job_id     | varchar(10)  | NO   | PRI | NULL    |       |
| job_title  | varchar(35)  | NO   |     | NULL    |       |
| min_salary | decimal(6,0) | YES  |     | NULL    |       |
| max_salary | decimal(6,0) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+

---------------------------------------------------------------------
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

-----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `job_history` (
  `employee_id` int(10) unsigned NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `job_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `department_id` DECIMAL(4,0) unsigned NOT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `job_history_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`),
  CONSTRAINT `job_history_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

+---------------+-----------------------+------+-----+---------+-------+
| Field         | Type                  | Null | Key | Default | Extra |
+---------------+-----------------------+------+-----+---------+-------+
| employee_id   | int(10) unsigned      | NO   | PRI | NULL    |       |
| start_date    | date                  | NO   |     | NULL    |       |
| end_date      | date                  | NO   |     | NULL    |       |
| job_id        | varchar(10)           | NO   | MUL | NULL    |       |
| department_id | decimal(4,0) unsigned | NO   | MUL | NULL    |       |
+---------------+-----------------------+------+-----+---------+-------+

-----------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `countries` (
`country_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
`country_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N/A',
`region_id` int(11) unsigned NULL,
PRIMARY KEY (`country_id`, `region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

+--------------+------------------+------+-----+---------+----------------+
| Field        | Type             | Null | Key | Default | Extra          |
+--------------+------------------+------+-----+---------+----------------+
| country_id   | int(11) unsigned | NO   | PRI | NULL    | auto_increment |
| country_name | varchar(30)      | NO   |     | N/A     |                |
| region_id    | int(11) unsigned | NO   | PRI | NULL    |                |
+--------------+------------------+------+-----+---------+----------------+
---------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dup_contries` (
`country_id` int(11) NOT NULL,
`country_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
`region_id` int(11) NOT NULL,
PRIMARY KEY (`country_id`),
UNIQUE KEY `country_id` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| country_id   | int(11)     | NO   | PRI | NULL    |       |
| country_name | varchar(30) | NO   |     | NULL    |       |
| region_id    | int(11)     | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
