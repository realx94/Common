
Declare @TBname nvarchar(255),
        @SQL nvarchar(max) 


select @TBname = min(TABLE_NAME) from INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE'

while @TBname is not null

BEGIN
    set @SQL='ALTER INDEX ALL ON [' + @TBname + '] REBUILD;'
    --print @SQL
    EXEC SP_EXECUTESQL @SQL
    select @TBname = min(TABLE_NAME) from INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' and TABLE_NAME > @TBname          
END