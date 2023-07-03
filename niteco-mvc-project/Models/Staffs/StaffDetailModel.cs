using System;

namespace niteco_mvc_project.Staffs
{
    public class StaffDetailModel
    {
        public Guid Id { get; set; }

        public string UserName { get; set; }

        public string Name { get; set; }

        public bool IsSuperAdmin { get; set; }
    }
}