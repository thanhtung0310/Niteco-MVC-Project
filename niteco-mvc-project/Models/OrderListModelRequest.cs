namespace niteco_mvc_project.Models
{
    public class OrderListModelRequest
    {
        public string FullTextSearch { get; set; }

        public int PageNumber { get; set; } = 1;

        public int PageSize { get; set; } = 6;
    }
}