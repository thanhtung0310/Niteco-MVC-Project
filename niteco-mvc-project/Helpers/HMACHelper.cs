namespace niteco_mvc_project.Helpers;

public static class HMACHelper
{
	public static void CreateHashSalt(string password, out byte[] passwordHash, out byte[] passwordSalt)
	{
		using var hmac = new HMACSHA512();
		passwordSalt = hmac.Key;
		passwordHash = hmac.ComputeHash(Encoding.UTF8.GetBytes(password));
	}

	public static bool VerifyHashSalt(string password, byte[] passwordHash, byte[] passwordSalt)
	{
		using var hmac = new HMACSHA512(passwordSalt);
		var computedHash = hmac.ComputeHash(Encoding.UTF8.GetBytes(password));

		return computedHash.SequenceEqual(passwordHash);
	}
}

