declare @tBeforeDeletion datetime2 = sysutcdatetime();

delete from timeTravel where id = 2;

declare @tBeforeUpdate datetime2 = sysutcdatetime();

update timeTravel set col_two = 'THREE' where col_one = 3;

declare @tBeforeInsert datetime2 = sysutcdatetime();

insert into timeTravel(col_one, col_two) values (2, 'TWO');


print('State of table before deletion:')
select * from dbo.timeTravel     for system_time as of @tBeforeDeletion order by id;

print('State of table before update:')
select * from dbo.timeTravel     for system_time as of @tBeforeUpdate   order by id;

print('State of table before insert:')
select * from dbo.timeTravel     for system_time as of @tBeforeInsert   order by id;

print('Current state:');
select * from dbo.timeTravel                                            order by id;

print('Total history:')
select * from dbo.timeTravel     for system_time all                    order by id;
