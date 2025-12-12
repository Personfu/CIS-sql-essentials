**SQL** (Structured Query Language) is the **database management language** used with relational databases. To understand and practice using SQL, you need to understand a little about relational databases.

A **relational database** is used to collect data used in an organization. The data must be organized in such a way that reports and other information can be created that is useful, timely, and accurate. SQL is the query language used to manage this data.

A well-designed relational database will have many **tables** that collect data about a person, place, or event. In the tables, there are **data** columns that are used to collect one type of data. For example:

* Employee
    * first name
    * last name
	* street address
	* city
	* zip code
	* email address
* Department
	* department name, 
	* department manager
	* department location
	* department email contact
	* department phone contact

As the data is collected, a new **row** is added for every new employee or department. For example:

### Employee Table
Emp_ID# | First_name | Last_name | Street_address | City | State | Zip_code | Email_address |
-------|-------|-------|-------|-------|-------|-------|-------| 
00100 | Juan | Smith | 111 El Paso Rd | Avenel | NJ	| 07001	| jsmith@email.com
00200 | Jana | Perez | 200 Broadway St. | New York | NY	| 10001 | jperez@email.com


### Department Table
Dept_ID# | Name | Manager |	Location | Email_contact | Phone_contact
-------|-------|-------|-------|-------|-------|
001 | Payroll | 00500 | Center 101 | payroll@company.com | 555-123-4567
002 | HR | 00832 | Adjacent 505 | hr@company.com | 555-987-6543
