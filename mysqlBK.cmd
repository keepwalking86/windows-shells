for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set ldt=%ldt:~0,4%%ldt:~4,2%%ldt:~6,2%
set MYSQLUSER=root
set MYSQLPASS="P@ssw0rd"
set BACKUP_FOLDER=D:\mysql\backup\%ldt%
echo %BACKUP_FOLDER%
IF EXIST "%BACKUP_FOLDER%" (
exit
) ELSE (
md "%BACKUP_FOLDER%"
)
set MYSQL_BIN=C:\Program Files\MySQL\MySQL Server 5.6\bin\
C:
cd %MYSQL_BIN%
mysqldump -u%MYSQLUSER% -p%MYSQLPASS% --all-databases >%BACKUP_FOLDER%\full-databases.sql
exit
