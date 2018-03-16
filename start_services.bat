@ECHO OFF
CD /D C:\wemp\nginx
ECHO Starting PHP FastCGI...
set PATH=C:\wemp\php;%PATH%
c:\wemp\RunHiddenConsole.exe C:\wemp\php\php-cgi.exe -b 127.0.0.1:9123
ECHO Starting NGINX Webserver...
c:\wemp\RunHiddenConsole.exe nginx.exe