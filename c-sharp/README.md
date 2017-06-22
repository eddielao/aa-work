# Intro

This repo is a collection of C# experiences I thought worth noting. If you know Java, C# is very much similar to it. C# is very much Microsoft's version of Java. Since C# is developed by Microsoft, it makes sense to choose Visual Studio as the choice of IDE (integrated development environment).

## Visual Studio Installation

The edition that will be used is the Visual Studio Community mainly because it is free. It can be download from [here at Visual Studio's own website](https://www.visualstudio.com/downloads/). After the download is completed, simply double click and follow the instruction to install.

## Workflow

Here are the general steps for creating the famous "Hello World" program.

1. Create new project
  * This option should be somewhere on screen after the IDE opens
2. Select the console template
3. Use `HelloWorld` for project name
  * No need to change any default option
4. To run codes, press `command` + `enter`
  * Or select `Run` -> `Start Debugging`

To open an existing project, select `File` -> `Open`.
  * Navigate to project root directory
  * Select file with extension `.sin`

```CSharp
using System;

namespace MtSac
{
    class MyProgram
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
        }
    }
}
```

The `namespace` wraps around the `class` which wraps around the `method Main`.

## Project Organization

The starting structure depends on what template was used for the project.

## .NET Framework

The `.NETFramework` is a library of codes developed by Microsoft with many common functions already built for developers to use.
