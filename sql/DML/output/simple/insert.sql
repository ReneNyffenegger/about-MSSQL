declare

   @insertedValues table (
      V1 integer,
      V2 varchar(10),
      V3 varchar(10)
   );

   insert tq84_table
   output
      inserted.*
   into
     @insertedValues
   select
      10    + val_1,
      val_2 + val_2,
      val_3 + val_3
   from
      tq84_table;

  select * from @insertedValues;

go
