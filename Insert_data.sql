USE employee_performance;

INSERT INTO departments VALUES
(10,'HR'),
(20,'IT'),
(30,'Finance'),
(40,'Sales');

INSERT INTO employees VALUES
(1,'Amit Sharma','Male',35,20,'Software Engineer','2019-03-10',NULL,'No'),
(2,'Neha Verma','Female',29,30,'Financial Analyst','2020-06-15',NULL,'No'),
(3,'Rohit Singh','Male',41,40,'Sales Manager','2018-01-20','2023-12-31','Yes'),
(4,'Pooja Mehta','Female',26,20,'Junior Developer','2021-09-05','2024-02-28','Yes'),
(5,'Rahul Jain','Male',38,30,'Account Manager','2017-07-01',NULL,'No'),
(6,'Anita Rao','Female',33,10,'HR Executive','2020-11-12',NULL,'No');

INSERT INTO salaries VALUES
(101,1,65000),
(102,2,58000),
(103,3,72000),
(104,4,42000),
(105,5,60000),
(106,6,50000);

INSERT INTO performance_reviews VALUES
(201,1,2023,4),
(202,2,2023,3),
(203,3,2023,5),
(204,4,2023,2),
(205,5,2023,4),
(206,6,2023,3);
