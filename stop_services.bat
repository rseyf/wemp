@ECHO OFF
ECHO Stoping NGINX... 
Taskkill /IM nginx.exe /F

ECHO Stoping PHP FastCGI... 
Taskkill /IM php-cgi.exe /F