namespace niteco_mvc_project.UserSession;

public class UserSessionModel
{
	public Guid Id { get; set; }

	public string UserName { get; set; }

	public string FullName { get; set; }

	public bool IsSuperAdmin { get; set; }
}

