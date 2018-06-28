select
  @@version,
  serverproperty('EngineEdition')
;
--
-- The value of @@version is a multi line string which looks something like
--
--     Microsoft SQL Server 2014 (SP1-CU5) (KB3130926) - 12.0.4439.1 (X64)
--     	Feb 15 2016 12:12:43
--     	Copyright (c) Microsoft Corporation
--     	Enterprise Edition: Core-based Licensing (64-bit) on Windows NT 6.3 <X64> (Build 9600: )
--
