using System;

namespace niteco_mvc_project.Models
{
    public class OrderListModel
    {
        public Guid Id { get; set; }

        public string ProductName { get; set; }

        public string CategoryName { get; set; }

        public string CustomerName { get; set; }

        public DateTime OrderDate { get; set; }

        public int Amount { get; set; }
    }
}