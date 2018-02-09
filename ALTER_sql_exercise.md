## Alter commands

#### 1. Write a SQL statement to rename the table countries to country_new.
```SQL
alter table `countries` RENAME `country_new`;
```

#### 2. Write a SQL statement to add a column region_id to the table locations.
```SQL
alter table `location` ADD COLUMN `region_id` int not null;
```
#### 3. Write a SQL statement to add a columns ID as the first column of the table locations.
```SQL
alter table `locations` add column `id` int unsigned not null primary key auto_increment FIRST;
```
#### 4. Write a SQL statement to add a column region_id after state_province to the table locations.
```SQL
alter table `locations` add column `region_id` int not null after `state_province`;
```
#### 5. Write a SQL statement change the data type of the column country_id to integer in the table locations.
```SQL
alter table `locations` modify `country_id` int;
```
#### 6. Write a SQL statement to drop the column city from the table locations.
```SQL
alter table `location` drop `city`;
```
#### 7. Write a SQL statement to change the name of the column state_province to state, keeping the data type and size same.
```SQL
alter table `locations` change `state_province` `state` varchar(255) not null;
```
#### 8. Write a SQL statement to add a primary key for the columns location_id in the locations table.
```SQL
alter table `locations` add primary key(`location_id`);
```
#### 9. Write a SQL statement to add a primary key for a combination of columns location_id and country_id.
```SQL
alter table `locations` add primary key(`location_id`, `country_id`);
```
#### 10. Write a SQL statement to drop the existing primary from the table locations on a combination of columns location_id and country_id.
```SQL
alter table `locations` drop primary key, add primary key(`location_id`, `country_id`);
```
#### 11. Write a SQL statement to add a foreign key on job_id column of job_history table referencing to the primary key job_id of jobs table.
```SQL
alter table `job_history` add foreign key(`job_id`) references `jobs`(`job_id`);
```
#### 12. Write a SQL statement to add a foreign key constraint named fk_job_id on job_id column of job_history table referencing to the primary key job_id of jobs table.
```SQL
alter table `job_history` add constraint fk_job_id foreign key(`job_id`) references `jobs`(`job_id`);
```
#### 13. Write a SQL statement to drop the existing foreign key fk_job_id from job_history table on job_id column which is referencing to the job_id of jobs table.
```SQL
alter table `job_history` drop foreign key `fk_job_id`;
```
#### 14. Write a SQL statement to add an index named indx_job_id on job_id column in the table job_history.
```SQL
alter table `job_history` add index `indx_job_id` (`job_id`);
```
#### 15. Write a SQL statement to drop the index indx_job_id from job_history table.
```SQL
alter table `job_history` drop index `indx_job_id`;
drop index `indx_job_id` on `job_history`;
```
