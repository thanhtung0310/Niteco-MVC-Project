# Niteco-Test-Project

## Description

1. MVC + Razor page Project to Manage Orders (Products, Customers, Categories) + Log-in/Log-out for Staffs
2. Framework: .NET 7
3. Total required coding time: 5 hours
4. Total real coding time: 4 hours

### List of functions

1. List all orders (Search + Pagination + Sort by Column) - ProductName, CategoryName, CustomerName, OrderDate, Amount
2. Create new Order - OrderName, ProductId, CustomerId, OrderDate, Amount
3. Create new Product - ProductName, CategoryId, Price, Description, ImportedQuantity
4. Create new Category - CategoryName, Description
5. Create new Customer - CustomerName, Address, IsActive status
6. Log-in/Log-out as Staff (Authentication, Authorization)
7. Log and Error handling - Save to log file
8. Unit-test: for GetAllOrders only

### Logged time

- Start coding at 16:45PM on 26th June, 2023.
- Done creating DB and create code structure at 17:15PM on 26th June, 2023. > Total: 30mins
- Refactor code structure at 8:00 AM on 28th June, 2023.
- Done refactoring code + test code structure to work at 9:00 AM on 28th June, 2023. > Total: 30mins + 1hour = 1hour30mins
- Update code with BaseController (Authorize) + ErrorPage (return if cannot get accessed to Controllers). > Total: 1hour30mins + 20mins = 1hour50mins
- Implement Authorization/Auuthentication for SessionController (need better self test) from 3:00 PM to 3:40PM on 2nd July, 2023. > Total: 1h50m + 40m = 2h40m
- Update code to handle error exception (middleware) for request from 4:00 PM to 4:20PM on 2nd July, 2023. > Total += 20m = 3h
- Update code + test + resolve conflict from 5:30 PM to 6:30PM on 3nd July, 2023. > Total += 1h = 4h
- Self-test (1h) - In Progress

### Task branches

1. Task 1: Create db script - Done

- File: niteco_db_script.sql

2. Task 2: Feature `Manage Orders` - In Progress (90%)

- Branch `https://github.com/thanhtung0310/Niteco-MVC-Project/tree/feature/default-order-page`
- Create Controller + View for this feature

3. Task 3: Authentication + Authorization - In Progress (90%)

- Branch `https://github.com/thanhtung0310/Niteco-MVC-Project/tree/feature/login-logout`
- Implement AuthorizationAttribute + Session Authentication

4. Task 4: Error handling + Logging module - In Progress (60%)

- Branch `https://github.com/thanhtung0310/Niteco-MVC-Project/tree/feature/logging-module`
- Implement Error handling middleware

5. Task 5: Unit Test for `Manage Orders` (80%)

- Branch `https://github.com/thanhtung0310/Niteco-MVC-Project/tree/feature/unit-test`
- Create UnitTestController for this