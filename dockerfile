FROM mrc.microsoft.com /dotnet/sdk:3.1 as builder

WORKDIR /app

copy ./ ./

wordir /app/AppVenta.InfraestructuraAPI/

run dotnet restore

RUN dotnet publish -c release -o ./../build

from mcr.microsoft.com/dotnet/aspnet:3.1

workdir /app

copy --from=buider /app/build/ ./

expose 80

entryponit ["dotnet", "AppVenta.Infraestructura.API.dll"]