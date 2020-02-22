create table some_data (
   id  integer,
   txt varchar(10)
);

insert into some_data values
  (3, 'three'),
  (5, 'five' ),
  (9, 'nine' );

if not exists (select * from some_data where id between 6 and 8) begin
   print('No record found, insert one');
   insert into some_data values (7, 'seven');
end;

select * from some_data;
