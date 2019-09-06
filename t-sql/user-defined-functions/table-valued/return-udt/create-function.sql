create function filter_udt(
         @things tq84_udt
                 readonly  -- Note: table-valued parameters must be declare with the
     ,
     @attr_2_like varchar(max)
     )
     returns @ret table
     --
     --  SQL Server does not allow to return user defined types.
     --  Thus, we need to resort to a Multi statement table valued
     --  function which is why we have to duplicate the column
     --  definitions of someThings
       --
     (
        attr_1 integer,
        attr_2 varchar(10)
     )
as
begin

   insert into @ret
   select
      *
   from
      @things
   where
      attr_2 like '%a%';

   return;
end
;

go
