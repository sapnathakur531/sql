
 create table Employeedetail(empid int, Firstname varchar(max), Lastname varchar(max), Salary int,JoiningDate datetime,
 department varchar(max), Gender varchar(max))

 insert into Employeedetail values
(1, 'vikas', 'Ahlawat', 600000, '2/12/2013 11:16', 'IT', 'Male'),
(2, 'Nikita', 'Jain', 530000, '2/14/2013 11:16', 'HR', 'Female'),
(3, 'Ashish','Kumar',1000000, '2/14/2013 11:16','IT','Male'),
(4, 'Nikhil','Sharma',480000,'2/15/2013 11:16','HR','Male'),
(5, 'Anish','Kadian',500000,'2/16/2013 11:16','Payroll','Male')

---1) Write a query to get all employee detail from "EmployeeDetail" table
select * from Employeedetail

---2) Write a query to get only "FirstName" column from "EmployeeDetail" table
select FirstName from Employeedetail

---3) Write a query to get FirstName in upper case as "First Name".
select Upper(Firstname) as "First Name" from Employeedetail

---4) Write a query to get FirstName in upper case as "First Name".
select Upper(Firstname) as "First Name" from Employeedetail

---5) Write a query for combine FirstName and LastName and display it as "Name" (also include white space between first name & last name)
select CONCAT(firstname,' ',lastname) as "Name" from Employeedetail

---6) Select employee detail whose name is "Vikas
select * from Employeedetail where Firstname='vikas'

---7) Get all employee detail from EmployeeDetail table whose "FirstName" start with letter 'a'.
select * from Employeedetail where Firstname like 'a%'

---9) Get all employee detail from EmployeeDetail table whose "FirstName" ends with letter 'h'.
select * from Employeedetail where Firstname like '%h'

---10) Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-p'
select * from Employeedetail where firstname like '[a-p]%'

---11) Get all employee detail from EmployeeDetail table whose "FirstName" not start with any single character between 'a-p'
select * from Employeedetail where firstname not like '[a-p]%'

---12) Get all employee detail from EmployeeDetail table whose "Gender" end with 'le' and contain 4 letters. 
---The Underscore(_) Wildcard Character represents any single character
select * from Employeedetail where gender like '__le'

---13) Get all employee detail from EmployeeDetail table whose "FirstName" start with 'A' and contain 5 letters
select * from Employeedetail where firstname like 'A____'

---14)Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:-"Vik%as".
select * from Employeedetail where firstname like '%\%%'

---15) Get all unique "Department" from EmployeeDetail table
select distinct Department from Employeedetail

---16) Get the highest "Salary" from EmployeeDetail table.
select max(salary) as 'Highestsalary' from Employeedetail

---17) Get the lowest "Salary" from EmployeeDetail table
select min(salary) as 'lowestsalary' from Employeedetail

---18)	 Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013
select convert(varchar(50),Joiningdate,106) from Employeedetail

---19)	Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15"
select convert(varchar(50),Joiningdate,111) from Employeedetail

---20)	 Show only time part of the "JoiningDate"
select convert(varchar(50),Joiningdate,108) from Employeedetail

---21)	Get only Year part of "JoiningDate"
select datepart(year, joiningdate) from Employeedetail 

---22)	Get only Month part of "JoiningDate”
select datepart(month, joiningdate) from Employeedetail

---23)	Get system date
select getdate()

---24)	Get UTC date.
select getutcdate()

--a-Get the first name, current date, joiningdate and diff between current date and joining date in months.
SELECT FirstName, GETDATE() [Current Date], JoiningDate,DATEDIFF(MM,JoiningDate,GETDATE()) AS [Total Months] FROM EmployeeDetail

---25)	Get the first name, current date, joiningdate and diff between current date and joining date in days.
SELECT FirstName, GETDATE() [Current Date], JoiningDate,DATEDIFF(DD,JoiningDate,GETDATE()) AS [Total DAYS] FROM EmployeeDetail


--26)Get all employee details from EmployeeDetail table whose joining year is 2013
select * from Employeedetail where datepart(yyyy,joiningdate) = '2013'

---27)	Get all employee details from EmployeeDetail table whose joining month is Jan(1)
select * from Employeedetail where datepart(mm,joiningdate) = '1'

---29)	Get how many employee exist in "EmployeeDetail" table
select count(*) from Employeedetail

---31. Select only one/top 1 record from "EmployeeDetail" table
select top 1 * from Employeedetail

---32. Select all employee detail with First name "Vikas","Ashish", and "Nikhil".
select * from Employeedetail where firstname in ('vikas','ashish','nikhil')

---33. Select all employee detail with First name not in "Vikas","Ashish", and "Nikhil"
select * from Employeedetail where firstname not in ('vikas','ashish','nikhil')

---34. Select first name from "EmployeeDetail" table after removing white spaces from right side
select RTRIM (firstname) as FirstName from Employeedetail

---35. Select first name from "EmployeeDetail" table after removing white spaces from left side
select LTRIM (firstname) as FirstName from Employeedetail

---36. Display first name and Gender as M/F.(if male then M, if Female then F)
Select firstname, 
case when gender='male' then 'M' when gender='Female' then 'F' 
end as
Gender
from Employeedetail

---37. Select first name from "EmployeeDetail" table prifixed with "Hello
Select 'Hello ' + firstname from Employeedetail

---38. Get employee details from "EmployeeDetail" table whose Salary greater than 600000
select * from Employeedetail where salary>600000

---39. Get employee details from "EmployeeDetail" table whose Salary less than 700000
select * from Employeedetail where salary<700000

---40. Get employee details from "EmployeeDetail" table whose Salary between 500000 than 600000
select * from Employeedetail where salary between 500000 and 600000

create table Projectdetail(projectdetailid int, Employeedetailid int, ProjectName varchar(max))
insert into Projectdetail values
(1, 1, 'TaskTrack'),
(2, 2, 'CLP'),
(3, 3, 'Survey Management'),
(4, 4, 'HR Management'),
(5, 5, 'Task track'),
(6, 6, 'GRS'),
(7, 7, 'DDS'),
(8, 8, 'HR Management'),
(9, 9, 'GL Management')


---41. Give records of ProjectDetail table
select * from projectdetail

---42. Write the query to get the department and department wise total(sum) salary from "EmployeeDetail" table.
select department, sum(salary) as 'Department wise Total'
from Employeedetail
Group by department;

---43. Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary.
select department, sum(salary) as 'Department wise total'
from employeedetail
group by department
order by 'Department wise total' asc

---44. Write the query to get the department and department wise total(sum) salary, display it in descending order according to salary
select department, sum(salary) as 'Department wise Total'
from employeedetail
group by department
order by 'Department wise Total' desc

---45. Write the query to get the department, total no. of departments, total(sum) salary with respect to department from "EmployeeDetail" table.
select department, count(department) as 'Total no. of departments', sum(salary) as 'Department wise Total'
from employeedetail
group by department

---46. Get department wise average salary from "EmployeeDetail" table order by salary ascending
select department, avg(salary) as 'Department wise avg salary'
from employeedetail
group by department
order by 'Department wise avg salary' asc

---47 . Get department wise maximum salary from "EmployeeDetail" table order by salary ascending
select department, max(salary) as 'Department wise Max salary'
from employeedetail
group by department
order by 'Department wise max salary' asc

---48.Get department wise minimum salary from "EmployeeDetail" table order by salary ascending.
select department, min(salary) as 'Department wise min salary'
from employeedetail
group by department
order by 'Department wise min salary' asc

---50. Join both the table that is Employee and ProjectDetail based on some common parameter
select * from Employeedetail
join projectdetail
on empid=projectdetailid

---51. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for those employee which have assigned project already.
select E.Firstname, P.Projectname 
from employeedetail as E 
JOIN Projectdetail as P
on E.Empid = P.Employeedetailid
order by firstname

---52. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" 
---for all employee even they have not assigned project.
select e.firstname, P.projectname 
from Employeedetail as E
LEFT JOIN Projectdetail as P
on E.Empid = P.Employeedetailid
order by firstname


---53) Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" 
---for all employee if project is not assigned then display "-No Project Assigned"

select e.firstname, coalesce(p.projectname, 'no project assigned') as projectname 
from Employeedetail as E
LEFT JOIN Projectdetail as P
on E.Empid = P.Employeedetailid
order by firstname


---54.Get all project name even they have not matching any employeeid, in left table, order by firstname from "EmployeeDetail" and "ProjectDetail
select e.firstname, P.projectname 
from Employeedetail as E
right JOIN Projectdetail as P
on E.Empid = P.Employeedetailid
order by firstname

---55. Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL
select E.firstname, P.projectname
from Employeedetail as E
full outer JOIN Projectdetail as P
on E.Empid = P.Employeedetailid
order by firstname

---58.Write down the query to fetch EmployeeName & Project who has assign more than one project

select concat(E.Firstname,' ',E.lastname) as 'Employee Name', P.Projectname 
from Employeedetail as E
full outer join Projectdetail as P
on E.Empid = P.Employeedetailid
Group by E.Empid, concat(E.Firstname,' ',E.lastname), P.Projectname 
having count(p.projectname)>1

---59. Write down the query to fetch ProjectName on which more than one employee are working along with EmployeeName
select P.Projectname , concat(E.Firstname,' ',E.lastname) as 'Employee Name'
from  projectdetail as p
join  EmployeeDetail as E
on E.Empid = P.Employeedetailid
group by P.projectname, concat(E.Firstname,' ',E.lastname)
having count(e.empid)>1

---60. Apply Cross Join in Both the tables
select E.Empid, E.firstname, P.Projectname
from EmployeeDetail as E
cross join projectdetail as P 






