drop   function dbo.regexp_like;

create function dbo.regexp_like (
 --
 -- Returns 1 if matched, 0 otherwise
 --
    @sourceString varchar(4000),
    @pattern      varchar(4000)
)
returns int
as
begin

    declare
        @objRegexExp int, 
        @res         int,
        @result      int;

    if @sourceString is null /* or len(ltrim(rtrim(@sourceString))) = 0 */ begin
       return null;
    end;

    exec @res = sp_OACreate 'VBScript.RegExp', @objRegexExp out;

    if @res <> 0 begin
       return 'VBScript did not initialize!';
    end;

    exec @res=sp_OASetProperty @objRegexExp, 'Pattern', @pattern;

    if @res <> 0 begin
       return 'Pattern property set failed!';
    end;

    exec @res=sp_OASetProperty @objRegexExp, 'IgnoreCase', 0;

    if @res <> 0 begin
       return 'IgnoreCase option failed!';
    end;

    exec @res=sp_OAMethod @objRegexExp, 'Test', @result out, @sourceString;

    if @res <> 0 begin
       return 'Calling Test failed';
    end;

    exec @res=sp_OADestroy @objRegexExp;

    return @result
end;
