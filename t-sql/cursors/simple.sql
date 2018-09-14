set nocount on

create table tq84_tab(col_1 int, col_2 varchar(10));

insert into tq84_tab values (1, 'one'  );
insert into tq84_tab values (2, 'two'  );
insert into tq84_tab values (3, 'three');
go

declare
   cur_tq84_tab cursor for select * from tq84_tab where col_2 like 't%' order by col_2
declare
   @val_1       integer,
   @val_2       varchar(10);

open cur_tq84_tab;

fetch next from cur_tq84_tab into @val_1, @val_2;
while @@fetch_status = 0 begin
      print('Fetched a record:'           );
      print('   col_1 = ' + str(@val_1, 1));
      print('   col_2 = ' +     @val_2    );

      fetch next from cur_tq84_tab into @val_1, @val_2;
end;

close      cur_tq84_tab;
deallocate cur_tq84_tab;
go

drop table tq84_tab;
go
