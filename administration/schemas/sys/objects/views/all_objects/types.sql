select
   type_desc,
   type
-- count(*)     cnt
from
   sys.all_objects
group by
   type_desc,
   type
order by
   type_desc;

--
-- type_desc                                                    type
-- ------------------------------------------------------------ ----
-- AGGREGATE_FUNCTION                                           AF
-- CHECK_CONSTRAINT                                             C
-- CLR_SCALAR_FUNCTION                                          FS
-- CLR_STORED_PROCEDURE                                         PC
-- CLR_TABLE_VALUED_FUNCTION                                    FT
-- DEFAULT_CONSTRAINT                                           D
-- EXTENDED_STORED_PROCEDURE                                    X
-- FOREIGN_KEY_CONSTRAINT                                       F
-- INTERNAL_TABLE                                               IT
-- PRIMARY_KEY_CONSTRAINT                                       PK
-- RULE                                                         R
-- SERVICE_QUEUE                                                SQ
-- SQL_INLINE_TABLE_VALUED_FUNCTION                             IF
-- SQL_SCALAR_FUNCTION                                          FN
-- SQL_STORED_PROCEDURE                                         P
-- SQL_TABLE_VALUED_FUNCTION                                    TF
-- SYNONYM                                                      SN
-- SYSTEM_TABLE                                                 S
-- TYPE_TABLE                                                   TT
-- UNIQUE_CONSTRAINT                                            UQ
-- USER_TABLE                                                   U
-- VIEW                                                         V
