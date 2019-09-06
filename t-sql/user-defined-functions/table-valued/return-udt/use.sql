declare
   @things tq84_udt;

insert into @things values(1, 'foo');
insert into @things values(2, 'bar');
insert into @things values(3, 'baz');

select * from dbo.filter_udt(@things, '%a%');
--
-- attr_1      attr_2
-- ----------- ----------
-- 2           bar
-- 3           baz
