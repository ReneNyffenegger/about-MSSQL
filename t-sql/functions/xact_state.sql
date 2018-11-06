set nocount on;

create table tq84_xact_state(col int);

select 'xact_state = ' + str(xact_state(), 2);
--
-- xact_state =  0
--

begin transaction;

select 'xact_state = ' + str(xact_state(), 2);
--
-- xact_state =  1
--

insert into tq84_xact_state values (1);

commit;

select 'xact_state = ' + str(xact_state(), 2);
--
-- xact_state =  0
--

drop table tq84_xact_state;

go
