/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT products.Name , categories.Name
 FROM products
 INNER JOIN categories
 ON products.CategoryID = categories.CategoryID
 Where categories.Name Like "%computer%"; 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT *
 FROM products
 INNER JOIN reviews
 ON products.ProductID = reviews.ProductID
 WHERE reviews.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
 SELECT e.FirstName, e.LastName, Sum(Quantity) AS total
 FROM sales AS s 
 INNER JOIN employees AS e 
 ON e.EmployeeID = s.EmployeeID
 GROUP BY e.EmployeeID
 ORDER BY total DESC
 LIMIT 2 ;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
 SELECT d.NAME AS 'Department Name', c.NAME AS 'Category Name'
 FROM departments AS d 
 INNER JOIN categories AS c
 ON c.DepartmentID = d.DepartmentID
 WHERE c.Name = 'Appliances' OR c.NAME = 'Games';
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT p.NAME, Sum(s.Quantity) as 'Total Units Sold', Sum(s.quantity * s.PricePerUnit) as 'Total Price'
 FROM products AS p
 INNER JOIN sales AS s
 ON s.productID = p.productID
 WHERE p.productID = 97;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
 SELECT p.Name, r.reviewer, r.ratingr.COMMENT 
  FROM products AS p
  INNER JOIN reviews AS r
  ON r.productID = p.ProductID
  WHERE p.productID = 857 AND r.rating = 1;
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.employeeID, e.firstname, e.lastname, p.Name,Sum(s.Quantity) AS "Total Sold"
FROM employees AS e
INNER JOIN sales AS s ON e.employeeID = s.employeeID
INNER JOIN products AS p ON p.productID = s.productID
GROUP BY e.employeeID, p.productID
ORDER BY e.FirstName;