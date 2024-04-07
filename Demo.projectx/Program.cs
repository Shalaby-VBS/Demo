using System;
using Demo.ClassLibrary;
using Demo.Hyper.Asia.Japan;

internal class Program
{
    private static void Main(string[] args)
    {
        Console.WriteLine("Hello, World! [Demo.ConsoleApplication1]");
        object value = Demo.ClassLibrary.Payroll();
        Console.ReadKey();
    }
}