#!/bin/bash
# Example script to start your .NET application

cd /home/ubuntu/dotnet/Groko-Api/src/Groko-Api
dotnet run --project Groko-Api.csproj > /var/log/Groko-Api.log 2>&1 &
