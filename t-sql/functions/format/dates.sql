select
   substring(format(sysdatetime(), 'hh:mm'            ), 1,   5) hour_min,
   substring(format(sysdatetime(), 'HH:mm'            ), 1,   5) hour24_min,
   substring(format(sysdatetime(), 'hh:mm tt'         ), 1,   8) hour_min_xM,
   substring(format(sysdatetime(), 'yyyy-MM-dd'       ), 1,  10) ymd,
   substring(format(sysdatetime(), 'd'       , 'de-CH'), 1,  10) swiss_date,
   substring(format(sysdatetime(), 'r'                ), 1,  29) rfc_1123,
   substring(format(sysdatetime(), 's'                ), 1,  19) sortable,          -- ISO 8601
   substring(format(sysdatetime(), 'u'                ), 1,  19) universal_sortable
--   
-- hour_min hour24_min hour_min_xM ymd        swiss_date rfc_1123                      sortable            universal_sortable
-- -------- ---------- ----------- ---------- ---------- ----------------------------- ------------------- -------------------
-- 03:01    15:01      03:01 PM    2019-09-24 24.09.2019 Tue, 24 Sep 2019 15:01:03 GMT 2019-09-24T15:01:03 2019-09-24 15:01:03   
