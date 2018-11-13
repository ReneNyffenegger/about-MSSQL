--
--  Wait 27 minutes
--
select sysdatetime();
waitfor delay '00:27';
select sysdatetime();

--
--  Wait 2 hours and 13  minutes
--
select sysdatetime();
waitfor delay '02:13';
select sysdatetime();

--
--  Wait 4 seconds
--
select sysdatetime();
waitfor delay '00:00:04';
select sysdatetime();


--
--  Wait 123 milliseconds
--
select sysdatetime();
waitfor delay '00:00:00.999';
select sysdatetime();
