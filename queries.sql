-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select Category.CategoryName, Product.ProductName
from Product
    join Category on Product.CategoryId = Category.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select o.Id, s.CompanyName
from [Order] as o
    join Shipper as s on o.ShipVia = s.Id
where OrderDate < date('2012-08-09');

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select [Order].Id, OrderDetail.Quantity, Product.ProductName
from OrderDetail
    join [Order] on OrderDetail.OrderId = [Order].Id
    join Product on OrderDetail.ProductId = Product.Id
where [Order].Id = 10251;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select [Order].Id, Customer.CompanyName, Employee.LastName
from [Order]
    join Customer on [Order].CustomerId = Customer.Id
    join Employee on [Order].EmployeeId = Employee.Id;

/* 
QUERIES USED TO ANSWER QUESTIONS
select * from Product;
select * from Category;

select c.CategoryName, p.ProductName 
from Product as p 
join Category as c on p.CategoryId = c.Id;

select * from [Order];
select * from Shipper;

select o.Id, s.CompanyName 
from [Order] as o 
join Shipper as s on o.ShipVia = s.Id where OrderDate < date('2012-08-09');

select * from Product;
select * from [Order];
select * from OrderDetail;

select * from [Order] where Id = 10251;

select [Order].Id, OrderDetail.Quantity, Product.ProductName
from OrderDetail 
join [Order] on OrderDetail.OrderId = [Order].Id 
join Product on OrderDetail.ProductId = Product.Id where [Order].Id = 10251;

select * from Customer;
select * from [Order];
select * from Employee;
select * from OrderDetail;

select [Order].Id, Customer.CompanyName, Employee.LastName
from [Order]
join Customer on [Order].CustomerId = Customer.Id
join Employee on [Order].EmployeeId = Employee.Id;
*/