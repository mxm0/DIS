create table VSISP01.employee(id integer not null GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1), name varchar(50),jobrole varchar(30), joindate date);

insert into VSISP01.employee(name, jobrole, joindate) values('Mao Zedong', 'President', '1943-03-20');
insert into VSISP01.employee(name, jobrole, joindate) values('Jiang Zemin', 'President', '1989-06-24');
insert into VSISP01.employee(name, jobrole, joindate) values('Hu Jintao', 'President', '2002-11-15');
insert into VSISP01.employee(name, jobrole, joindate) values('Xi Jinping', 'President', '2012-11-15');
insert into VSISP01.employee(name, jobrole, joindate) values('rob', 'peon', null);

commit work;
