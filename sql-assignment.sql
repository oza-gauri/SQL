

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `finaltest_gaurioza`
--

-- --------------------------------------------------------

-- DROP QUERY
DROP SCHEMA IF EXISTS finaltest_gaurioza;
CREATE SCHEMA finaltest_gaurioza;
USE finaltest_gaurioza;

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `dept_id` int(11) NOT NULL,
  `dept_no` int(11) NOT NULL,
  `salary` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`dept_id`, `dept_no`, `salary`) VALUES
(1, 10, '6000.00'),
(2, 20, '4000.00'),
(3, 30, '2000.00'),
(4, 40, '3000.00'),
(5, 50, '1000.00'),
(6, 10, '2000.00'),
(7, 20, '3000.00'),
(8, 30, '5000.00'),
(9, 40, '4000.00'),
(10, 50, '1000.00'),
(11, 10, '3000.00'),
(12, 20, '4000.00'),
(13, 30, '1000.00'),
(14, 40, '2000.00'),
(15, 50, '7000.00'),
(16, 10, '1000.00'),
(17, 20, '2000.00'),
(18, 30, '3000.00'),
(19, 40, '4000.00'),
(20, 50, '5000.00');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(15) NOT NULL,
  `job_name` varchar(15) NOT NULL,
  `hire_date` date NOT NULL,
  `dept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `emp_name`, `job_name`, `hire_date`, `dept_id`) VALUES
(1, 'ALAN', 'MANAGER', '1990-01-05', 1),
(2, 'CLAY', 'MANAGER', '1990-02-02', 6),
(3, 'BRYCE', 'MANAGER', '1990-03-04', 11),
(4, 'SAMSON', 'MANAGER', '1990-04-19', 2),
(5, 'HANNAH', 'MANAGER', '1990-05-23', 7),
(6, 'STEVEN', 'SUPPORT', '1990-07-16', 12),
(7, 'HARRY', 'SUPPORT', '1990-07-23', 3),
(8, 'RON', 'SUPPORT', '1990-07-21', 8),
(9, 'DRACO', 'DEVELOPER', '1990-07-28', 13),
(10, 'SLATE', 'DEVELOPER', '1990-07-11', 18),
(11, 'ALEX', 'DEVELOPER', '1990-08-08', 4),
(12, 'SCARLET', 'DEVELOPER', '1990-09-05', 9),
(13, 'JOE', 'DEVELOPER', '1990-10-02', 14),
(14, 'PRICK', 'CLERK', '1990-11-25', 5),
(15, 'SMITH', 'CLERK', '1990-12-07', 10),
(16, 'JONAS', 'CLERK', '1991-01-10', 15),
(17, 'SUSAN', 'ANALYST', '1991-02-18', 20),
(18, 'KRYSTLE', 'ANALYST', '1991-03-17', 3),
(19, 'ROHAN', 'SALESMAN', '1991-04-27', 8),
(20, 'PIPER', 'SALESMAN', '1991-05-14', 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`);
COMMIT;


/* QUERIES FOR TEST */
/*1*/

SELECT
   employees.emp_id AS ID,
   employees.emp_name AS EMPLOYEE,
   employees.hire_date AS DATE 
FROM
   employees 
WHERE
   employees.hire_date < '1990-06-30' 
   OR employees.hire_date > '1990-12-31';
   
/* OUTPUT */
/*
+----+----------+------------+
| ID | EMPLOYEE | DATE       |
+----+----------+------------+
|  1 | ALAN     | 1990-01-05 |
|  2 | CLAY     | 1990-02-02 |
|  3 | BRYCE    | 1990-03-04 |
|  4 | SAMSON   | 1990-04-19 |
|  5 | HANNAH   | 1990-05-23 |
| 16 | JONAS    | 1991-01-10 |
| 17 | SUSAN    | 1991-02-18 |
| 18 | KRYSTLE  | 1991-03-17 |
| 19 | ROHAN    | 1991-04-27 |
| 20 | PIPER    | 1991-05-14 |
+----+----------+------------+
*/

/* 2 */

SELECT
   employees.emp_name AS EMPLOYEE_NAME 
FROM
   employees 
   INNER JOIN
      departments 
      ON employees.dept_id = departments.dept_id 
WHERE
   departments.dept_no IN 
   (
      10,
      20,
      40 
   )
   OR employees.job_name IN 
   (
      'CLERK',
      'SALESMAN',
      'ANALYST' 
   )
;

/* OUTPUT */
/*
+---------------+
| EMPLOYEE_NAME |
+---------------+
| ALAN          |
| CLAY          |
| BRYCE         |
| SAMSON        |
| HANNAH        |
| STEVEN        |
| ALEX          |
| SCARLET       |
| JOE           |
| PRICK         |
| SMITH         |
| JONAS         |
| SUSAN         |
| KRYSTLE       |
| ROHAN         |
| PIPER         |
+---------------+
*/

/* 3 */
SELECT
   employees.emp_name AS EMPLOYEE_NAME 
FROM
   employees 
WHERE
   employees.emp_name LIKE 'S%';
   
/* OUTPUT */
/*
+---------------+
| EMPLOYEE_NAME |
+---------------+
| SAMSON        |
| STEVEN        |
| SLATE         |
| SCARLET       |
| SMITH         |
| SUSAN         |
+---------------+
*/

/* 4 */
SELECT
   employees.emp_name AS EMPLOYEES,
   departments.salary AS SALARY 
FROM
   employees 
   INNER JOIN
      departments 
      ON employees.dept_id = departments.dept_id 
WHERE
   departments.salary > (
   SELECT
      MIN(departments.salary) 
   FROM
      departments 
   WHERE
      departments.dept_no IN 
      (
         30
      )
);

/* OUTPUT */
/*
+-----------+---------+
| EMPLOYEES | SALARY  |
+-----------+---------+
| ALAN      | 6000.00 |
| CLAY      | 2000.00 |
| BRYCE     | 3000.00 |
| SAMSON    | 4000.00 |
| HANNAH    | 3000.00 |
| STEVEN    | 4000.00 |
| HARRY     | 2000.00 |
| RON       | 5000.00 |
| SLATE     | 3000.00 |
| ALEX      | 3000.00 |
| SCARLET   | 4000.00 |
| JOE       | 2000.00 |
| JONAS     | 7000.00 |
| SUSAN     | 5000.00 |
| KRYSTLE   | 2000.00 |
| ROHAN     | 5000.00 |
| PIPER     | 7000.00 |
+-----------+---------+
*/

/* 5 */   
SELECT
   employees.emp_name AS EMPLOYEE,
   departments.salary AS SALARY 
FROM
   employees 
   INNER JOIN
      departments 
      ON employees.dept_id = departments.dept_id 
WHERE
   departments.salary > (
   SELECT
      MAX(departments.salary) 
   FROM
      departments 
   WHERE
      departments.dept_no IN 
      (
         30
      )
);

/* OUTPUT */
/*
+----------+---------+
| EMPLOYEE | SALARY  |
+----------+---------+
| ALAN     | 6000.00 |
| JONAS    | 7000.00 |
| PIPER    | 7000.00 |
+----------+---------+
*/

