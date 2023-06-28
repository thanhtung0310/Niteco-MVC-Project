# Niteco-Test-Project
## Description
1. MVC + Razor page Project to Manage Orders (Products, Customers, Categories) + Log-in/Log-out for Staffs
2. Framework: .NET 7
3. Total required coding time: 5 hours
3. Total real coding time: x hours

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
- Done creating DB and create code structure at 17:15PM at 26th June, 2023. > Total: 30mins
- Refactor code structure at 8:00 AM on 28th June, 2023.
- Done refactoring code + test code structure to work at 9:00 AM at 28th June, 2023. > Total: 30mins + 1hour = 1hour30mins
- Update code with BaseController (Authorize) + ErrorPage (return if cannot get accessed to Controllers). > Total: 1hour30mins + 20mins = 1hour50mins