select
   convert(varchar(15),      1.0/3.0                    ), -- 0.333333
   convert(varchar(15), cast(1.0/3.0 as decimal(15, 12)))  -- 0.333333000000
