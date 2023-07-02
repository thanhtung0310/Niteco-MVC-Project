namespace niteco_mvc_project.Middlewares;

public class ErrorLoggingMiddleware
{
	private readonly RequestDelegate _next;

	public ErrorLoggingMiddleware(RequestDelegate next)
	{
		_next = next;
	}

	public async Task Invoke(HttpContext context)
	{
		try
		{
			await _next(context);
		}
		catch (Exception exception)
		{
			// Handle exception
			await HandleExceptionAsync(context, exception, HttpStatusCode.InternalServerError);
		}
	}


	private Task HandleExceptionAsync(HttpContext context, Exception exception, HttpStatusCode statusCode)
	{
		context.Response.StatusCode = (int)statusCode;

		// TO DO: Log exceptions : Azure AppInsights or File

		var message = "The requested resource was not found";

		var response = new
		{
			ErrorDescription = $"{(int)statusCode} - {message}",
			ErrorCode = message
		};

		string responseStringContent;

		context.Response.ContentType = Application.Json;
		responseStringContent =
			JsonSerializer.Serialize(response, new JsonSerializerOptions() { PropertyNamingPolicy = JsonNamingPolicy.CamelCase });

		return context.Response.WriteAsync(responseStringContent);
	}
}