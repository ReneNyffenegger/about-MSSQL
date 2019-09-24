select
  cast('2001-02-03 04:05:06.789' as datetime2) dt,
  cast('23:59'                   as time     ) almost_midnight,
  cast(0x0104                    as integer  ) CCLX,
  cast(0x843f0b                  as date     ) april_8th_2019,
  cast(0x520065006e00e900        as nvarchar ) name,
  cast(0x604f7d59                as nvarchar ) ni_hao
;
--
-- dt                           almost_midnight   CCLX         april_8th_2019 name      ni_hao
-- ---------------------------  ----------------  -----------  -------------- --------  --------
-- 2001-02-03 04:05:06.7890000  23:59:00.0000000  260          2019-04-08     René      你好
