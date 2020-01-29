declare

   @someUpdatedValues table (
      V1_before integer,
      V1_after  integer,
      V2_before varchar(10),
      v2_after  varchar(10)
   );

   update tq84_table
   set
      val_1 =  20 + val_1 +  20,
      val_2 = 'u' + val_2,
      val_3 = 'v' + val_3
   output
      deleted. val_1,
      inserted.val_1,
      deleted. val_2,
      inserted.val_2
   into
     @someUpdatedValues
   where
      val_1 > 7;

   select * from @someUpdatedValues;

go
