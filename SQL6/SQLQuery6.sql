/*
Write a query to find PersonId, Name, number of friends, total score of frieds of a person
who have friends with total score greater than 100
*/

select * from friend;

select * from (
select distinct A.PersonId, A.Name, A.Score, 
count(1) over(partition by A.PersonId) as number_of_friends,
sum(B.Score) over(partition by A.PersonId) as total_friend_score 
from ( 
select 
A.*, FriendId 
from person A
join friend B on A.PersonId = B.PersonID) A join person B on A.FriendId = B.PersonId) A
where total_friend_score > 100

