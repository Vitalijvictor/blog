
--CREATE DATABASE
create database transact_sql;

--USE DATABASE
use transact_sql;

--DROP DATABASE transact_sql;


--CREATE TABLE
create table universities
(
    id   serial primary key,
    name text
);

create table students
(
    id            serial primary key,
    name          text,
    course        int,
    budget        bool,
    speciality    text,
    enroll_date   timestamp,
    university_id int references universities (id)
);

create table fauna (
    id serial primary key,
    name text,
    avg_age int,
    discovery_date date
);


-- INSERT
insert into universities(name)
values ('U1');
insert into universities(name)
values ('U2');
insert into universities(name)
values ('U3');
insert into universities(name)
values ('U4');
insert into universities(name)
values ('U5');

insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('AB', 1, true, 'S1', date '2020-09-01', 1);
insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('AC', 2, true, 'S1', date '2019-09-02', 1);
insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('AD', 3, true, 'M1', date '2018-09-03', 1);
insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('AE', 4, false, 'Z1', date '2017-09-04', 1);
insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('AF', 5, false, 'E1', date '2016-09-05', 1);

insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('BC', 1, true, 'Q2', date '2020-09-01', 2);
insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('BD', 2, true, 'R2', date '2019-09-02', 2);
insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('BE', 3, false, 'T2', date '2018-09-03', 2);
insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('BF', 4, false, 'Y2', date '2017-09-04', 2);
insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('BG', 5, false, 'U2', date '2016-09-05', 2);

insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('CD', 1, true, 'A3', date '2020-09-01', 3);
insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('CE', 2, true, 'D3', date '2019-09-01', 3);
insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('CF', 3, false, 'F3', date '2018-09-01', 3);
insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('CG', 4, false, 'G3', date '2017-09-01', 3);
insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('CH', 5, true, 'H3', date '2016-09-01', 3);

insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('DE', 1, false, 'Z4', date '2020-09-01', 4);
insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('DF', 2, true, 'X4', date '2019-09-01', 4);
insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('DG', 3, true, 'C4', date '2018-09-01', 4);
insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('DH', 4, false, 'V4', date '2017-09-01', 4);
insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('DJ', 5, true, 'V4', date '2016-09-01', 4);

insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('EF', 1, true, 'P5', date '2020-09-01', 5);
insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('EG', 2, true, 'O5', date '2019-09-01', 5);
insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('EH', 3, false, 'I5', date '2018-09-01', 5);
insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('EJ', 4, true, 'J5', date '2017-09-01', 5);
insert into students(name, course, budget, speciality, enroll_date, university_id)
values ('EI', 5, true, 'K5', date '2016-09-01', 5);

insert into fauna(name, avg_age, discovery_date) values ('Monkey', 11, '1798-11-28');
insert into fauna(name, avg_age, discovery_date) values ('Bear', 8, '1398-10-02');
insert into fauna(name, avg_age, discovery_date) values ('Zebra', 16, '1698-09-12');
insert into fauna(name, avg_age, discovery_date) values ('Cut fish', 3, '1100-04-17');
insert into fauna(name, avg_age, discovery_date) values ('Bacillus permians', 25000, '1956-12-02');
insert into fauna(name, avg_age, discovery_date) values ('Xestospongia muta', 50000 , null);


--SELECT
--DESCRIBE
--GROUP BY
--ORDER BY
--WHERE
--BETWEEN
--AND / OR
--< > - +
--LIKE / NOT LIKE
--NULL / NOT NULL
--'%[a-y] [^kqo]_30!%%' escape '!';
--SUM()
--HAVING
--JOIN

describe fauna;

select * from fauna where name like '%fish';

select * from fauna where avg_age between 10000
and 25000;

select * from fauna where discovery_date is null;

select * from fauna where discovery_date <'1950-00-0';

select * from students where enroll_date
between  '2018-01-01' and  '2019-01-01';

select name, discovery_date from fauna
where name in ('Zebra', 'Bear', 'Monkey');

select name, course from students
where name like '%ei%';

select name, course from students
where name not like '%ei%';

select * from fauna
where name like '%[a-y] [^kqo]_30!%%' escape '!';

select name, discovery_date from fauna
where name is null;

select name, discovery_date from fauna
where name is not null;

select name, avg_age, sum(avg_age) from fauna
group by name
order by discovery_date;

select name, avg_age, sum(avg_age) from fauna
group by name
having  avg_age between 3 and 16;  -- операция
--отличается от WHERE тем что мы работаем с
--результатом
--после GROUP BY

select count(course),  count(budget) from  students
group by course, budget;

select count(course),  count(budget) from  students
order by count(*) desc;

--JOIN

-- SIMPLE "JOIN" WITH *WHERE* он не маштабируется
select u.name, s.name
from transact_sql.universities as u, transact_sql.students as s
where u.id = s.id

--INNER JOIN
select u.name, s.name
from transact_sql.universities u
inner join transact_sql.students s --can be JOIN without INNER
on u.id = s.id

--LEFT--RIGHT JOIN

select u.name, s.name, s.course, s.budget, s.speciality, s.enroll_date
from transact_sql.universities u
left join transact_sql.students s
on u.id = s.id

select u.name, s.name, s.course, s.budget
from transact_sql.universities u
right join transact_sql.students s
on u.id = s.id

select u.name
from transact_sql.universities u
right outer join transact_sql.students s
on u.id = s.id