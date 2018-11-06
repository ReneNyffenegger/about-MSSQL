print '@@trancount = ' + str(@@trancount) -- 0

begin transaction;
--
-- Starting a transaction increments the transaction counter
--
print '@@trancount = ' + str(@@trancount); -- 1

begin transaction;
print '@@trancount = ' + str(@@trancount); -- 2

save transaction sp_tq84;
--
-- A savepoint does not increase the transaction counter
--
print '@@trancount = ' + str(@@trancount); -- 2

begin transaction;
print '@@trancount = ' + str(@@trancount); -- 3

begin transaction;
print '@@trancount = ' + str(@@trancount); -- 4

commit;
print '@@trancount = ' + str(@@trancount); -- 3

rollback transaction sp_tq84;
--
-- Rolling back to a savepoint does not decrease the
-- transaction counter:
--
print '@@trancount = ' + str(@@trancount); -- 3

go
--
-- Apparently, a 'go' has no effect on active transactions:
--
print '@@trancount = ' + str(@@trancount); -- 3

rollback;
--
-- A rollback sets the transaction counter to 0:
--
print '@@trancount = ' + str(@@trancount); -- 0
