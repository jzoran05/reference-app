# 
FROM aksdemoreg.azurecr.io/dotnet:2.2.1-aspnetcore-runtime-nanoserver-sac2016

COPY .\\aspnet-web\\bin\\Debug\\netcoreapp2.2\ C:\\programs
ENTRYPOINT [ "dotnet.exe", "programs\\aspnet-web.dll" ]

