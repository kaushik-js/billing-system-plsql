
create table billdetails (billid int,p_id int , qty int ,foreign key (p_id) references tbl_product);

 insert into billdetails values(1,1,2);

 insert into billdetails values(1,3,5);

 insert into billdetails values(1,5,2);

 insert into billdetails values(2,2,4);

insert into billdetails values(2,9,1);

 insert into billdetails values(2,7,2);

 insert into billdetails values(3,7,6);

 insert into billdetails values(3,1,2);

 insert into billdetails values(3,3,5);

 insert into billdetails values(3,3,5);

 insert into billdetails values(4,2,15);

insert into billdetails values(4,1,10);

