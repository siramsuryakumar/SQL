create table tab1 (
id1 integer
);

create table tab2 (
id2 integer
);

insert into tab1 values(2), (3), (3), (3);

insert into tab2 values(1), (1), (2), (2), (4), (null);

select * from tab1;
select * from tab2;

select * from tab1 inner join tab2 on id1 = id2;

select * from tab1 left join tab2 on id1 = id2;

select * from tab1 right join tab2 on id1 = id2;

select * from tab1 full join tab2 on id1 = id2;

select * from tab1 natural join tab2 on id1 = id2;

--select * from tab1 natural, tab2 ORDER BY id1;
select * from tab1 cross join tab2;


