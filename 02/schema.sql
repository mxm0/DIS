drop table makler
drop table estate
drop table house
drop table appartment
drop table person
drop table purchase_contract
drop table contract
drop table tenancy_contract
drop table sells
drop table rents
drop table manages

CREATE TABLE makler(id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1, NO CACHE) PRIMARY KEY, name varchar(255), address varchar(255), login varchar(40) not NULL unique, password varchar(40))


CREATE TABLE estate(id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1, NO CACHE) PRIMARY KEY, city varchar(255), postalcode varchar(40), street varchar(40), street_number varchar(40), square_area varchar(40))


CREATE TABLE house(id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1, NO CACHE) PRIMARY KEY, floors varchar(255), price varchar(40), garden varchar(40), estate_id int, constraint house_constraint foreign key (estate_id) references estate(id) on delete cascade)


CREATE TABLE appartment(id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1, NO CACHE) PRIMARY KEY, floors varchar(255), price varchar(40), garden varchar(40), rooms integer, balcony smallint, builtinKitchen smallint, estate_id int, constraint appartment_constraint foreign key (estate_id) references estate(id) on delete cascade)


CREATE TABLE person(id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1, NO CACHE) PRIMARY KEY, fist_name varchar(255), name varchar(255), address varchar(255))


CREATE TABLE contract(id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1, NO CACHE) PRIMARY KEY, date varchar(255), place_id varchar(255))


CREATE TABLE purchase_contract(id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1, NO CACHE) PRIMARY KEY, installment varchar(255), intetrest_rate varchar(255), contract_id int, constraint purchase_contract_constraint foreign key (contract_id) references contract(id) on delete cascade)


CREATE TABLE tenancy_contract(id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1, NO CACHE) PRIMARY KEY, start_date date, duration varchar(8),additional_costs varchar(8),contract_id int, constraint tenancy_contract_constraint foreign key (contract_id) references contract(id) on delete cascade)


CREATE TABLE manages(PRIMARY KEY(makler_id,estate_id), makler_id int not null, estate_id int not null, constraint makler_id_constraint foreign key (makler_id) references makler(id) on delete cascade, constraint estate_id_constraint foreign key (estate_id) references estate(id) on delete cascade, constraint uniquename unique (estate_id))


CREATE TABLE rents(PRIMARY KEY(appartment_id,person_id,tenancy_contract_id), tenancy_contract_id int not null, appartment_id int not null, person_id int not null, constraint appartment_id_constraint foreign key (appartment_id) references appartment(id) on delete cascade, constraint estate_id_constraint foreign key (person_id) references person(id) on delete cascade, constraint tenancy_id_constraint foreign key (tenancy_contract_id) references tenancy_contract(id) on delete cascade)


CREATE TABLE sells(PRIMARY KEY(house_id,person_id,purchase_contract_id), house_id int not null, person_id int not null, purchase_contract_id int not null, constraint house_id_constraint foreign key (house_id) references house(id) on delete cascade, constraint estate_id_constraint foreign key (person_id) references person(id) on delete cascade, constraint purchase_contract_id foreign key (purchase_contract_id) references purchase_contract(id) on delete cascade)
