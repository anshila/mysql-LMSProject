README.md

# Library Management System

The Library Management System is a software application designed to help libraries efficiently manage their operations, including book management, customer management, and issue tracking. This project provides a database schema and SQL queries to demonstrate the functionality of the system.

## Database Schema

The database schema includes the following tables:

1. **Branch**: Stores information about library branches, including branch number, manager ID, address, and contact number.
2. **Employee**: Contains details of library employees, such as employee ID, name, position, salary, and branch number.
3. **Books**: Stores information about books available in the library, including ISBN, title, category, rental price, status, author, and publisher.
4. **Customer**: Holds details of library customers, including customer ID, name, address, and registration date.
5. **IssueStatus**: Tracks issued books, including issue ID, customer ID, book name, issue date, and ISBN.
6. **ReturnStatus**: Tracks returned books, including return ID, customer ID, book name, return date, and ISBN.

## SQL Queries

The project includes various SQL queries to perform operations such as retrieving information, adding data, and generating reports:

1.Retrieve the book title, category, and rental price of all available books.
2.List the employee names and their respective salaries in descending order of salary.
3.Retrieve the book titles and the corresponding customers who have issued those books.
4.Display the total count of books in each category.
5.Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
6.List the customer names who registered before 2022-01-01 and have not issued any books yet.
7.Display the branch numbers and the total count of employees in each branch.
8.Display the names of customers who have issued books in the month of June 2023.
9.Retrieve book titles from the book table containing history.
10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.

## Conclusion

The Library Management System helps libraries keep everything organized and running smoothly. It's like a big filing system for books, employees, and customers. With this system, librarians can easily find information about books, who borrowed them, and when they're due back. The system also keeps track of employees and helps managers see how many years they've been working. Using simple commands, like asking questions, librarians can find out lots of useful information, making their jobs much easier. Overall, the Library Management System is like a helpful assistant for libraries, making sure everything is in the right place and easy to find.

## Contributing

Contributions to the project are welcome! Feel free to submit pull requests or open issues if you encounter any problems or have suggestions for improvements.

