#removing older than 7 days
set BACKUP_FOLDER=D:\backup
forfiles -p %BACKUP_FOLDER% -d -7 -c "cmd /c IF @isdir == TRUE rd /S /Q @path"
