set nocount on
insert into things values('abc', 'foo',  7, 8);
insert into things values('abc', 'foo',  1, 3);

insert into things values('abc', 'bar',  2, 7);

insert into things values('abc', 'baz',  6, 2);
insert into things values('abc', 'baz', 11, 4);
insert into things values('abc', 'baz',  4, 6);

----------------------------------------------

insert into things values('def', 'foo',  4, 5);
insert into things values('def', 'foo', 11, 4);

insert into things values('def', 'bar',  9, 2);
insert into things values('def', 'bar',  5, 5);

insert into things values('def', 'baz', 12, 3);
