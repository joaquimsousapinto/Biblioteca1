using System;
using System.IO;
using System.Reflection;

namespace Biblioteca1.Models.Common
{
    public class BuildInfo
    {
        public DateTime BuildDate { get; }

        public BuildInfo()
        {
            var assemblyPath = Assembly.GetExecutingAssembly().Location;
            BuildDate = File.GetLastWriteTime(assemblyPath);
        }
    }
}