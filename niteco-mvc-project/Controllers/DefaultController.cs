using niteco_mvc_project.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;
using System.Web.UI;

namespace niteco_mvc_project.Controllers
{
    public class DefaultController : BaseController
    {
        private niteco_test_dbEntities db = new niteco_test_dbEntities();

        // GET: Default
        public async Task<ActionResult> Index(OrderListModelRequest request)
        {
            var searchString = request.FullTextSearch;
            var pageNumber = request.PageNumber;
            var pageSize = request.PageSize;

            var query = db.orders
                .Include(o => o.product.category)
                .Include(o => o.customer)
                .Select(o => new
                {
                    ProductName = o.product.name,
                    CategoryName = o.product.category.name,
                    CustomerName = o.customer.name,
                    OrderDate = o.order_date,
                    OrderAmount = o.amount
                });

            if (!string.IsNullOrEmpty(searchString))
            {
                query = query.Where(o => o.ProductName.Contains(searchString));
            }

            var totalCount = await query.CountAsync();
            var totalPages = (int)Math.Ceiling((double)totalCount / pageSize);
            var skip = (pageNumber - 1) * pageSize;

            var result = await query
                .OrderByDescending(o => o.OrderDate)
                .Skip(skip)
                .Take(pageSize)
                .ToListAsync();

            var orderList = result.Select(o => new OrderListModel
            {
                ProductName = o.ProductName,
                CategoryName = o.CategoryName,
                CustomerName = o.CustomerName,
                OrderDate = o.OrderDate,
                Amount = o.OrderAmount
            }).ToList();

            var orderListModel = new OrderListResponse
            {
                Orders = orderList,
                TotalCount = totalCount,
                TotalPages = totalPages,
                CurrentPage = pageNumber,
                PageSize = pageSize
            };

            return View(orderListModel);
        }
    }
}