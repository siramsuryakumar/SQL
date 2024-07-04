-- Write a query to provide the nth occurrence of Sunday from the given day
-- Sunday - 1
-- Monday - 2
-- Saturday - 7

declare @today_date date;
declare @future_date date;
declare @occurrence int;
set @today_date = '2024-07-04';
set @occurrence = 2;

select DATEPART(WEEKDAY, @today_date) as current_day, 
DATEADD(day, 8 - DATEPART(WEEKDAY, @today_date) + ((@occurrence -1)*7), @today_date) as future_date;

