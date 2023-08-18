--Write a query to find PersonID, Name, number of friends, sum of marks of person having friends with total score greater than 100.

--select * from person
--select * from friend


with with_num_of_friends as (
select f.personID, sum(p.Score) as total_scores, count(*) as no_of_friends
from person p
inner join friend f on p.personID = f.FriendID
group by f.personID
having(sum(p.Score)) > 100)

select p.personID, p.Name, w.no_of_friends, w.total_scores
from person p
inner join with_num_of_friends w on p.personID = W.personID