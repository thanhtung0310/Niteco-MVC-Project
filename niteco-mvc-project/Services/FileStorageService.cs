using System.IO;
using System.Reflection;

namespace niteco_mvc_project.Services
{
    public static class FileStorageService
    {
        //TODO: Service to save file to storage
        public static string SaveFileToFilePath(byte[] fileBytes, string path)
        {
            File.WriteAllBytes(path, fileBytes);

            return path;
        }

        public static string GetFilePathFromFileName(string fileName)
        {
            string rootPath = Path.GetDirectoryName(Assembly.GetEntryAssembly().Location);
            string path = Path.Combine(rootPath, fileName);

            return path;
        }
    }
}