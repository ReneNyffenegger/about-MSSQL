create table tq84_tab (
  id  integer,
  txt varchar(10)
);

insert into tq84_tab values (5, 'five' );
insert into tq84_tab values (8, 'eight');
insert into tq84_tab values (2, 'two'  );
insert into tq84_tab values (4, 'four' );
insert into tq84_tab values (9, 'nine' );

select * from tq84_tab for xml auto;

-- The query produces:
--
--    <tq84_tab id="5" txt="five" />
--    <tq84_tab id="8" txt="eight" />
--    <tq84_tab id="2" txt="two" />
--    <tq84_tab id="4" txt="four" />
--    <tq84_tab id="9" txt="nine" />
--
