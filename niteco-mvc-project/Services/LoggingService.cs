using System.IO;
using System.Reflection;
using System;

namespace niteco_mvc_project.Services
{
    public static class LoggingService
    {
        private static string m_exePath = string.Empty;

        public static void LogWrite(string logMessage, bool needFilePath = false)
        {
            m_exePath = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
            var loggingFolderPath = m_exePath + "\\" + "Logs";
            if (!Directory.Exists(loggingFolderPath))
            {
                Directory.CreateDirectory(m_exePath + "\\" + "Logs");
            }
            var currentDate = DateTime.Now;
            string loggingFilePath = loggingFolderPath + "\\" + $"Log-{currentDate.Year}-{currentDate.Month}-{currentDate.Day}.txt";

            try
            {
                using (StreamWriter w = File.AppendText(loggingFilePath))
                {
                    if (needFilePath)
                    {
                        var logFilePath = loggingFilePath.Replace("\\", "/");
                        Log(logMessage, w, logFilePath);
                    }
                    else
                    {
                        Log(logMessage, w);
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }

        public static void Log(string logMessage, TextWriter txtWriter, string filePath = "")
        {
            try
            {
                if (!string.IsNullOrWhiteSpace(filePath))
                {
                    txtWriter.WriteLine("{0} {1} {2} {3}",
                        DateTime.Now.ToString("MM/dd/yyyy"),
                        DateTime.Now.ToString("HH:mm:ss tt"),
                        logMessage,
                        filePath);
                }
                else
                {
                    txtWriter.WriteLine("{0} {1} {2}",
                        DateTime.Now.ToString("MM/dd/yyyy"),
                        DateTime.Now.ToString("HH:mm:ss tt"),
                        logMessage);
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}