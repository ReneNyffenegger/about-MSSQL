select
   count(distinct error    )  cnt_error                                          , --  11514
   count(distinct msglangid)  cnt_lang                                           , --     22
   count(distinct error    ) * count(distinct msglangid) cnt_error_times_cnt_lang, -- 253308
   count(*                 )  cnt_total                                            -- 253308
from
   dbo.sysmessages;
