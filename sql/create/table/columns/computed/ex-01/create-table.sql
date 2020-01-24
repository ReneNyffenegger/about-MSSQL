create table math (
   val_1     decimal(6,2)  not null,
   op        char(1)       not null,
   val_2     decimal(6,2)  not null,
   ------
   result as case op 
     when '+' then val_1 + val_2
     when '-' then val_1 - val_2
     when '*' then val_1 * val_2
     when '/' then val_1 / val_2
   end
);
