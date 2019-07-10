drop   function dbo.regexp_replace;

create function dbo.regexp_replace (
 --
 -- https://stackoverflow.com/a/38462603/180275
 --
 -- These match exactly the parameters of RegExp
 --
    @searchstring  varchar(4000),
    @pattern       varchar(4000),
    @replacestring varchar(4000) 
)
returns varchar(4000)
as
begin

    declare @objRegexExp int, 
        @objErrorObj     int,
        @strErrorMessage varchar(255),
        @res             int,
        @result          varchar(4000)

    if @searchstring is null or len(ltrim(rtrim(@searchstring))) = 0 begin
       return null
    end;

    set @result='';

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

    exec @res=sp_OAMethod @objRegexExp, 'Replace', @result out, @searchstring, @replacestring;

    if @res <> 0 begin
       return 'Bad search string!';
    end;

    exec @res=sp_OADestroy @objRegexExp;

    return @result
end;
