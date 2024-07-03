

create table icc_world_cup(
Team_1 varchar(20),
Team_2 varchar(20),
winner varchar(20)
);

insert into icc_world_cup values('India', 'SL', 'India');
insert into icc_world_cup values('SL', 'Aus', 'Aus');
insert into icc_world_cup values('SA', 'Eng', 'Eng');
insert into icc_world_cup values('Eng', 'NZ', 'NZ')
insert into icc_world_cup values('Aus', 'India', 'India');

select * from icc_world_cup

select team_name,
count(1) as no_of_matches_played,
sum(win_flag) as no_of_wins,
count(1) - sum(win_flag) as no_of_loss 
from (
select Team_1 as team_name, case when Team_1 = winner then 1 else 0 end as win_flag from icc_world_cup 
union all
select Team_2 as team_name, case when Team_2 = winner then 1 else 0 end as win_flag from icc_world_cup) A 
group by team_name;