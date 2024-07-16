# Use the official ASP.NET Core runtime image as a parent image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 5078

# Use the official ASP.NET Core SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["Groko.Api.csproj", "./"]
RUN dotnet restore "./Groko.Api.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "Groko.Api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Groko.Api.csproj" -c Release -o /app/publish

# Copy the build output to the runtime image
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Groko.Api.dll"]
