set nocount on

create table exp_test_p (
   id    integer primary key,
   txt   varchar(10)
);

create table exp_test_c (
   id_p  integer references exp_test_p,
   val   decimal(4,1)
);

select * into imp_test_p from exp_test_p;
select * into imp_test_c from exp_test_c;
