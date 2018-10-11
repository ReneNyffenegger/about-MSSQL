select
  @@spid            as ses_id,
  session_user      as ses_usr,
  current_user      as cur_usr,
  system_user       as sys_usr,
  user_name()       as nam_usr,
  user              as usr
;
