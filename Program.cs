using System;
using System.IO;

class Program
{
    static void Main(string[] args)
    {
        // Show help if -h or --help is provided
        if (args.Length == 1 && (args[0] == "-h" || args[0] == "--help"))
        {
            Console.Clear();  // Clear the screen before showing help
            ShowHelp();
            return;
        }

        // Require exactly 2 arguments (original and new name)
        if (args.Length != 2)
        {
            Console.WriteLine("Error: Invalid number of arguments.");
            ShowHelp();
            return;
        }

        string oldName = args[0];
        string newName = args[1];

        try
        {
            // Rename file
            if (File.Exists(oldName))
            {
                File.Move(oldName, newName);
                Console.WriteLine($"File renamed from '{oldName}' to '{newName}'");
            }
            // Rename directory
            else if (Directory.Exists(oldName))
            {
                Directory.Move(oldName, newName);
                Console.WriteLine($"Directory renamed from '{oldName}' to '{newName}'");
            }
            else
            {
                Console.WriteLine($"Error: '{oldName}' does not exist as a file or directory.");
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
        }
    }

    static void ShowHelp()
    {
        Console.Clear();  // Clear again to be safe
        Console.WriteLine("RIL - Rename In Linux");
        Console.WriteLine(" Made by execRooted");
        Console.WriteLine("Usage:");
        Console.WriteLine("  ren <originalName> <newName>   Rename a file or folder");
        Console.WriteLine("  ren -h | --help                Show this help message");
        Console.WriteLine();
        Console.WriteLine("Examples:");
        Console.WriteLine("  ren oldfile.txt newfile.txt");
        Console.WriteLine("  ren oldFolder newFolder");
    }
}
