#!/bin/bash
# Example script to start your .NET application

cd /home/ubuntu/your-app-name/src/YourDotNetProject
dotnet run --project YourDotNetProject.csproj > /var/log/your-app.log 2>&1 &
