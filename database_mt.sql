--user name mt
-- test 1
create table tbl_stock(
    pk_int_stock serial primary key,
    vchr_name varchar(20),
    int_quantity bigint,
    int_price bigint
    );
alter table tbl_stock alter column int_price type float;


create table tbl_supplier (
    pk_int_supplier_id serial primary key,
    vchr_supplier_name varchar(20)
);

alter table tbl_supplier add column fk_int_supplier int;

alter table tbl_stock add constraint tbl_stock foreign key (fk_int_supplier) references tbl_supplier (pk_int_supplier_id);

create table tbl_debt(
    pk_int_dept_id serial primary key,
    vchr_dept_name varchar(20)
);

create table tbl_classes(
    pk_int_class_id serial primary key,
    vchr_class_name varchar(50),
    fk_int_dept_id int,
    foreign key (fk_int_dept_id) references tbl_debt (pk_int_dept_id) on delete cascade on update cascade
);

create table tbl_enrollment (
    pk_enrollment_id serial primary key,
    int_count int,
    fk_int_class__id int,
    foreign key (fk_int_class__id) references tbl_classes (pk_int_class_id) on delete cascade on update cascade
);

alter table tbl_classes add constraint unique_id unique (vchr_class_name);

alter table tbl_debt add column vchr_dept_description varchar(100);

insert into tbl_supplier (vchr_supplier_name) values ('Logitech'),('Samsung'), ('Iball'),('LG'),('Creative');

--test 2

insert into tbl_stock(vchr_name,int_quantity,int_price,fk_int_supplier) values ('Mouse',10,500,1),('Keyboard',5,450,3),('Modem',10,1200,2),('Memory',100,1500,5),('Headphone',50,750,4),('Memory',2,3500,4);
update tbl_stock set int_price = int_price + 1.50;
select * from tbl_stock where int_price > 1000;

select * from tbl_stock order by vchr_name ;
select * from tbl_stock order by vchr_name limit 3 ;
select * from tbl_stock order by vchr_name desc limit 3;



select (vchr_name,int_quantity,int_price,int_quantity*int_price) from tbl_stock;

insert into tbl_debt (vchr_dept_name,vchr_dept_description) values ('Computer Science','CS'),('Electronics','EC'),('Commerce','CC'),('Arts','AR');
select sum(int_price) as totalcost from tbl_stock ;

select count(*) from tbl_stock as total_number_product;

select upper(vchr_name) from tbl_stock;

select sum(int_quantity) from tbl_stock;

select count(vchr_name) from tbl_stock;
select max(int_price) from tbl_stock;

insert into tbl_classes (vchr_class_name,fk_int_dept_id) values ('CS100',1),('CS101',1),('CS102',1),('CS103',1),('EC200',2),('CC300',3),('AT400',4);
insert into tbl_enrollment (int_count,fk_int_class__id) values (40,1),(15,2),(10,3),(12,4),(60,2),(14,6),(200,7);

select sum(int_count) as total_enrollment from tbl_enrollment;

select count(pk_int_class_id) as no_of_classes from tbl_classes;

delete from tbl_supplier where vchr_supplier_name = 'Creative';

select(vchr_name , int_price) as product_price from tbl_stock;

create table tbl_student(
    
)