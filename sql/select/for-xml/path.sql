create table tq84_tab (
  id  integer,
  txt varchar(10)
);

insert into tq84_tab values (5, 'five' );
insert into tq84_tab values (8, 'eight');
insert into tq84_tab values (2, 'two'  );
insert into tq84_tab values (4, 'four' );
insert into tq84_tab values (9, 'nine' );

select * from tq84_tab for xml path('RRR')

--  The select statement produces
--
--     <RRR>
--       <id>5</id>
--       <txt>five</txt>
--     </RRR>
--     <RRR>
--       <id>8</id>
--       <txt>eight</txt>
--     </RRR>
--     <RRR>
--       <id>2</id>
--       <txt>two</txt>
--     </RRR>
--     <RRR>
--       <id>4</id>
--       <txt>four</txt>
--     </RRR>
--     <RRR>
--       <id>9</id>
--       <txt>nine</txt>
--     </RRR>
