select
   name                          name,
   substring(description, 1, 95) description,
   cast(minimum as integer)      minimum,
   cast(maximum as integer)      maximum,
   is_dynamic,
   is_advanced
from
   sys.configurations
order by
   name;

go

-- name                                description                                                                                     minimum     maximum     is_dynamic is_advanced
-- ----------------------------------- ----------------------------------------------------------------------------------------------- ----------- ----------- ---------- -----------
-- access check cache bucket count     Default hash bucket count for the access check result security cache                                      0       65536          1           1
-- access check cache quota            Default quota for the access check result security cache                                                  0  2147483647          1           1
-- Ad Hoc Distributed Queries          Enable or disable Ad Hoc Distributed Queries                                                              0           1          1           1
-- affinity I/O mask                   affinity I/O mask                                                                               -2147483648  2147483647          0           1
-- affinity mask                       affinity mask                                                                                   -2147483648  2147483647          1           1
-- affinity64 I/O mask                 affinity64 I/O mask                                                                             -2147483648  2147483647          0           1
-- affinity64 mask                     affinity64 mask                                                                                 -2147483648  2147483647          1           1
-- Agent XPs                           Enable or disable Agent XPs                                                                               0           1          1           1
-- allow updates                       Allow updates to system tables                                                                            0           1          1           0
-- backup checksum default             Enable checksum of backups by default                                                                     0           1          1           0
-- backup compression default          Enable compression of backups by default                                                                  0           1          1           0
-- blocked process threshold (s)       Blocked process reporting threshold                                                                       0       86400          1           1
-- c2 audit mode                       c2 audit mode                                                                                             0           1          0           1
-- clr enabled                         CLR user code execution enabled in the server                                                             0           1          1           0
-- common criteria compliance enabled  Common Criteria compliance mode enabled                                                                   0           1          0           1
-- contained database authentication   Enables contained databases and contained authentication                                                  0           1          1           0
-- cost threshold for parallelism      cost threshold for parallelism                                                                            0       32767          1           1
-- cross db ownership chaining         Allow cross db ownership chaining                                                                         0           1          1           0
-- cursor threshold                    cursor threshold                                                                                         -1  2147483647          1           1
-- Database Mail XPs                   Enable or disable Database Mail XPs                                                                       0           1          1           1
-- default full-text language          default full-text language                                                                                0  2147483647          1           1
-- default language                    default language                                                                                          0        9999          1           0
-- default trace enabled               Enable or disable the default trace                                                                       0           1          1           1
-- disallow results from triggers      Disallow returning results from triggers                                                                  0           1          1           1
-- EKM provider enabled                Enable or disable EKM provider                                                                            0           1          1           1
-- filestream access level             Sets the FILESTREAM access level                                                                          0           2          1           0
-- fill factor (%)                     Default fill factor percentage                                                                            0         100          0           1
-- ft crawl bandwidth (max)            Max number of full-text crawl buffers                                                                     0       32767          1           1
-- ft crawl bandwidth (min)            Number of reserved full-text crawl buffers                                                                0       32767          1           1
-- ft notify bandwidth (max)           Max number of full-text notifications buffers                                                             0       32767          1           1
-- ft notify bandwidth (min)           Number of reserved full-text notifications buffers                                                        0       32767          1           1
-- index create memory (KB)            Memory for index create sorts (kBytes)                                                                  704  2147483647          1           1
-- in-doubt xact resolution            Recovery policy for DTC transactions with unknown outcome                                                 0           2          1           1
-- lightweight pooling                 User mode scheduler uses lightweight pooling                                                              0           1          0           1
-- locks                               Number of locks for all users                                                                          5000  2147483647          0           1
-- max degree of parallelism           maximum degree of parallelism                                                                             0       32767          1           1
-- max full-text crawl range           Maximum  crawl ranges allowed in full-text indexing                                                       0         256          1           1
-- max server memory (MB)              Maximum size of server memory (MB)                                                                      128  2147483647          1           1
-- max text repl size (B)              Maximum size of a text field in replication.                                                             -1  2147483647          1           0
-- max worker threads                  Maximum worker threads                                                                                  128       65535          1           1
-- media retention                     Tape retention period in days                                                                             0         365          1           1
-- min memory per query (KB)           minimum memory per query (kBytes)                                                                       512  2147483647          1           1
-- min server memory (MB)              Minimum size of server memory (MB)                                                                        0  2147483647          1           1
-- nested triggers                     Allow triggers to be invoked within triggers                                                              0           1          1           0
-- network packet size (B)             Network packet size                                                                                     512       32767          1           1
-- Ole Automation Procedures           Enable or disable Ole Automation Procedures                                                               0           1          1           1
-- open objects                        Number of open database objects                                                                           0  2147483647          0           1
-- optimize for ad hoc workloads       When this option is set, plan cache size is further reduced for single-use adhoc OLTP workload.           0           1          1           1
-- PH timeout (s)                      DB connection timeout for full-text protocol handler (s)                                                  1        3600          1           1
-- precompute rank                     Use precomputed rank for full-text query                                                                  0           1          1           1
-- priority boost                      Priority boost                                                                                            0           1          0           1
-- query governor cost limit           Maximum estimated cost allowed by query governor                                                          0  2147483647          1           1
-- query wait (s)                      maximum time to wait for query memory (s)                                                                -1  2147483647          1           1
-- recovery interval (min)             Maximum recovery interval in minutes                                                                      0       32767          1           1
-- remote access                       Allow remote access                                                                                       0           1          0           0
-- remote admin connections            Dedicated Admin Connections are allowed from remote clients                                               0           1          1           0
-- remote login timeout (s)            remote login timeout                                                                                      0  2147483647          1           0
-- remote proc trans                   Create DTC transaction for remote procedures                                                              0           1          1           0
-- remote query timeout (s)            remote query timeout                                                                                      0  2147483647          1           0
-- Replication XPs                     Enable or disable Replication XPs                                                                         0           1          1           1
-- scan for startup procs              scan for startup stored procedures                                                                        0           1          0           1
-- server trigger recursion            Allow recursion for server level triggers                                                                 0           1          1           0
-- set working set size                set working set size                                                                                      0           1          0           1
-- show advanced options               show advanced options                                                                                     0           1          1           0
-- SMO and DMO XPs                     Enable or disable SMO and DMO XPs                                                                         0           1          1           1
-- transform noise words               Transform noise words for full-text query                                                                 0           1          1           1
-- two digit year cutoff               two digit year cutoff                                                                                  1753        9999          1           1
-- user connections                    Number of user connections allowed                                                                        0       32767          0           1
-- user options                        user options                                                                                              0       32767          1           0
-- xp_cmdshell                         Enable or disable command shell                                                                           0           1          1           1