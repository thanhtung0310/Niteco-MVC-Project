using System.Collections.Generic;

namespace niteco_mvc_project.Models
{
    public class OrderListResponse
    {
        public List<OrderListModel> Orders { get; set; }

        public int TotalCount { get; set; }

        public int TotalPages { get; set; }

        public int CurrentPage { get; set; }

        public int PageSize { get; set; }

        public string SearchString { get; set; }
    }
}