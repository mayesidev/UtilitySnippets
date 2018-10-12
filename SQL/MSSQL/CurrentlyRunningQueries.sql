-- This query itself will be included in the results, so we snapshot the time first,
-- then filter the results with a slight delay (<1 sec) in an attempt to exclude it.
-- Sometimes it's still too quick though, so it shows up anyway...
declare @now datetime;
set @now = GetDate();

select session_id, start_time, status, command, transaction_isolation_level, reqs.database_id, dbs.name, text
from sys.dm_exec_requests as reqs
join sys.databases as dbs on dbs.database_id = reqs.database_id
-- Get the query text
cross apply sys.dm_exec_sql_text(sql_handle)
-- Filter out non-active queries
where status not in ('background','sleeping')
	-- Filter out non-locking queries
	and (transaction_isolation_level not in (1,5))
	-- Filter with slight delay to exclude this query
	and start_time < DATEADD(ms, -200, @now)
go

-- information about 'sys.dm_exec_requests' here: https://msdn.microsoft.com/en-us/library/ms177648.aspx
--status can be:
	-- Background
	-- Running
	-- Runnable
	-- Sleeping
	-- Suspended
--transaction isolation level values:
	-- 0 = Unspecified
	-- 1 = ReadUncomitted
	-- 2 = ReadCommitted
	-- 3 = Repeatable
	-- 4 = Serializable
	-- 5 = Snapshot
