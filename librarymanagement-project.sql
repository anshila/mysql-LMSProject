# Create database
Create database library;
use library;

#Create table branch
create table Branch(
Branch_no int PRIMARY KEY, 
Manager_Id int,
Branch_address varchar(65),
Contact_no int
);

#Create table employee
create table Employee(
Emp_Id int PRIMARY KEY, 
Emp_name varchar(20),
Position varchar(20),
Salary int,
Branch_no int,
foreign key(Branch_no) references branch(Branch_no) 
);

#Create table books
create table Books(
ISBN varchar(20) PRIMARY KEY, 
Book_title varchar(20),
Category varchar(20),
Rental_Price int,
Status ENUM('yes','no'),
Author varchar(20),
Publisher varchar(20)
);

#create table customer
create table Customer(
Customer_Id int PRIMARY KEY, 
Customer_name varchar(20),
Customer_address varchar(30),
Reg_date date
);

#create table issuestatus
create table IssueStatus(
Issue_Id int PRIMARY KEY,
Issued_cust int,
foreign key (Issued_cust) references customer(customer_id), 
Issued_book_name varchar(30),
Issue_date date,
Isbn_book varchar(30),
foreign key(Isbn_book) references books(isbn)
);

#create table returnstatus
create table ReturnStatus(
Return_Id int PRIMARY KEY,
Return_cust int,
foreign key (Return_cust) references customer(Customer_Id),
Return_book_name varchar(30),
Return_date date,
Isbn_book2 varchar(25),
foreign key(Isbn_book2) references books(isbn)
);

#Insert values into the 'Branch' table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, 'Kan St', '12345678'),
(2, 102, 'Clt St', '98765432'),
(3, 103, 'Ekm St', '32165409'),
(4, 104, 'Alp St', '45678901'),
(5, 105, 'Mal St', '78901234');

#Insert values into the 'Employee' table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(201, 'Anu', 'Manager', 50000, 1),
(202, 'John', 'Librarian', 65000, 2),
(203, 'Mary', 'Assistant Librarian', 35000, 3),
(204, 'Anju', 'Clerk', 30000, 4),
(205, 'Raju', 'Assistant Clerk', 25000, 5);
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(206, 'Anu jose', 'Manager', 50000, 2),
(207, 'John m', 'Librarian', 65000, 2),
(208, 'Mary l', 'Assistant Librarian', 35000, 3);

# Insert values into the 'Books' table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('ISBN-0061120084', 'Harry potter', 'Fiction', 150, 'yes', 'J.K Rowling', 'Scholastic Inc'),
('ISBN-0451524935', 'The Alchemist', 'Fiction', 203, 'yes', 'Paulo Coelho', 'Harperone'),
('ISBN-1451673319', 'The Great Gatsby', 'Fiction', 356, 'no', 'F. Scott Fitzgerald', 'Scribner'),
('ISBN-0143127550', 'The Secret', 'History', 147, 'yes', 'Donna tartt', 'Vintage'),
('ISBN-0143039433', 'The game of thorne', 'Fantasy', 212, 'yes', 'George R.R Martin', 'Harper');

# Insert values into the 'Customer' table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(301, 'Aishu', 'Ekm St', '2023-01-15'),
(302, 'Arjun', 'Alp St', '2023-02-20'),
(303, 'Rahul', 'Clt St', '2023-03-25'),
(304, 'David', 'Mal St', '2021-04-30'),
(305, 'Anju', 'Kan St', '2023-05-05'),
(306, 'Sanju', 'Plk St', '2021-05-05');

# Insert values into the 'IssueStatus' table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issue_date, Issued_book_name, Isbn_book) VALUES
(601, 301, '2024-06-01', 'Harry Potter', 'ISBN-0061120084'),
(602, 302, '2024-05-02', 'The Alchemist', 'ISBN-0451524935'),
(603, 303, '2024-06-03', 'The Great Gatsby', 'ISBN-1451673319'),
(604, 304, '2024-03-04', 'The Secret', 'ISBN-0143127550'),
(605, 305, '2024-06-05', 'The Game of Thrones', 'ISBN-0143039433');

# Insert values into the 'ReturnStatus' table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_date, Return_book_name, Isbn_book2) VALUES
(701, 301, '2024-06-15', 'Harry Potter', 'ISBN-0061120084'),
(702, 302, '2024-06-20', 'The Alchemist', 'ISBN-0451524935'),
(703, 303, '2024-06-25', 'The Great Gatsby', 'ISBN-1451673319'),
(704, 304, '2024-06-30', 'The Secret', 'ISBN-0143127550'),
(705, 305, '2024-07-05', 'The Game of Thrones', 'ISBN-0143039433');


# Display all the tables and Write the queries for the following :
select * from Branch;
select * from Employee;
select * from Books;
select * from Customer;
select * from IssueStatus;
select * from ReturnStatus;



#1. Retrieve the book title, category, and rental price of all available books
select book_title,category,rental_price from books where status="yes";

#2. List the employee names and their respective salaries in descending order of salary.
select emp_name, salary from employee order by Salary DESC;

#3. Retrieve the book titles and the corresponding customers who have issued those books.
select b.Book_title, c.Customer_name 
from Books b
join IssueStatus i on b.ISBN = i.Isbn_book
join Customer c on i.Issued_cust = c.Customer_Id;

#4. Display the total count of books in each category.
select Category, COUNT(*) as Total_Count from Books group by Category;

#5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.40,000.
select emp_name,position,salary from employee where salary > 50000;

#6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
select Customer_name
from Customer
where Reg_date < '2023-01-01'
and Customer_Id not in (
    select Issued_cust
    from IssueStatus
);
# or
select c.customer_id,c.customer_name,c.reg_date,i.issue_id
from customer c left join issuestatus i
on c.customer_id=i.issued_cust
where c.reg_date < '2023-01-01' and i.issue_id is null;

#7. Display the branch numbers and the total count of employees in each branch.
select Branch_no, COUNT(*) as Total_Employees
from Employee
group by Branch_no;

#8. Display the names of customers who have issued books in the month of June 2023.
select distinct c.Customer_name
from Customer c
join IssueStatus i on c.Customer_Id = i.Issued_cust
where year(i.Issue_date) = 2024 and month(i.Issue_date) = 6;
#or
select c.customer_name,i.issue_date
from customer c join issuestatus i
on c.customer_id= i.issued_cust
where issue_date between '2024-06-01' and '2024-06-30';

#9. Retrieve book_title from book table containing history.
select Book_title from Books where Category = 'History';
#or
select Book_title from Books where Category like '%History%';

#10.Retrieve the branch numbers along with the count of employees for branches having more than 2 employees
select Branch_no, COUNT(*) as Employee_Count
from Employee
group by Branch_no
having COUNT(*) > 2;

#or
select Branch_no, Employee_Count
from (
    select Branch_no, COUNT(*) as Employee_Count
    from Employee
    group by Branch_no
) as Branch_Employee_Count
where Employee_Count > 2;