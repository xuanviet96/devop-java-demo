#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base

ARG BUILD_ENV=${BUILD_ENV}

WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["DevOpsTrainingDotnet.csproj", "."]
RUN dotnet restore "DevOpsTrainingDotnet.csproj"
COPY . .

COPY appsettings.${BUILD_ENV:-Development}.json ./appsettings.json

WORKDIR "/src"
RUN dotnet build "DevOpsTrainingDotnet.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "DevOpsTrainingDotnet.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
RUN apt update && apt install curl nano telnet -y

WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "DevOpsTrainingDotnet.dll"]