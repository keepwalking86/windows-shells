set MONGODB_BIN=E:\mongodb\bin
E:
CD %MONGODB_BIN%
for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set ldt=%ldt:~0,4%%ldt:~4,2%%ldt:~6,2%
set BACKUP_FOLDER=D:\MongoDB\backup\%ldt%
echo %BACKUP_FOLDER%
IF EXIST "%BACKUP_FOLDER%" (
exit
) ELSE (
md "%BACKUP_FOLDER%"
mongodump.exe -h 127.0.0.1:27017 -o %BACKUP_FOLDER% --authenticationDatabase admin -u root -p 123456$
)
exit
