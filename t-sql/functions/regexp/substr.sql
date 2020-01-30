drop   function if exists dbo.regexp_substr;
go

create function dbo.regexp_substr ( -- {
    @searchstring  varchar(4000),
    @pattern       varchar(4000),
    @occurence     integer
)
returns varchar(4000)
as
begin

    declare @objRegexExp int,
        @objErrorObj     int,
        @strErrorMessage varchar(255),
        @res             int,
        @mtcColl         int,
        @result          varchar(4000),
        @item varchar(100) = 'item(' + str(@occurence - 1) + ').value';

    if @searchstring is null or len(ltrim(rtrim(@searchstring))) = 0 begin
       return null
    end;

    set @result='';

    exec @res=sp_oaCreate 'VBScript.RegExp', @objRegexExp out;
    exec @res=sp_oaSetProperty @objRegexExp, 'Pattern'   , @pattern;
    exec @res=sp_oaSetProperty @objRegexExp, 'ignoreCase', 0;
    exec @res=sp_oaSetProperty @objRegexExp, 'global'    , 1;
    exec @res=sp_oaMethod      @objRegexExp, 'execute'   , @mtcColl out, @searchstring;
    exec @res=sp_oaGetProperty @mtcColl, @item, @result out;
    exec @res=sp_oaDestroy     @mtcColl;
    exec @res=sp_oaDestroy     @objRegexExp;

    return @result
end; -- }
go
