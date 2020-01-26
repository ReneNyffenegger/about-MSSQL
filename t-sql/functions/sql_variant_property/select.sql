select
   sql_variant_property(          1        , 'basetype'  ), -- int
   sql_variant_property(          1.1      , 'basetype'  ), -- numeric
   sql_variant_property(          1.1      , 'scale'     ), -- 1
   sql_variant_property(          1.1234   , 'scale'     ), -- 4
   sql_variant_property(  9999999999       , 'basetype'  ), -- numeric
   sql_variant_property(  9999999999       , 'precision' ), -- 10
   sql_variant_property( 12345678901       , 'precision' ), -- 11
   sql_variant_property( 12345678901       , 'scale'     ), -- 0
   sql_variant_property( cast(1 as bigint) , 'basetype'  ), -- bigint
   sql_variant_property( getDate()         , 'basetype'  ), -- datetime
   sql_variant_property( 'foo bar baz'     , 'basetype'  ), -- varchar
   sql_variant_property(N'foo bar baz'     , 'basetype'  ), -- nvarchar
   sql_variant_property( 'foo bar baz'     , 'totalBytes'), -- 19 (=  11 + 8)
   sql_variant_property(N'foo bar baz'     , 'totalBytes'); -- 30 (=2*11 + 8)
