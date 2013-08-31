# --- !Ups

create table "t_category" ("id" INTEGER GENERATED BY DEFAULT AS IDENTITY(START WITH 1) PRIMARY KEY,"name" VARCHAR NOT NULL,"parent" INTEGER NOT NULL);
create table "t_products" ("id" INTEGER GENERATED BY DEFAULT AS IDENTITY(START WITH 1) PRIMARY KEY,"reference" VARCHAR NOT NULL,"label" VARCHAR NOT NULL,"description" VARCHAR,"image_url" VARCHAR,"unity" VARCHAR NOT NULL,"category_id" INTEGER,"supplier_id" INTEGER NOT NULL,"manufacture" VARCHAR,"reference_supplier" VARCHAR,"multi_price" BOOLEAN NOT NULL,"tva_rate" DOUBLE NOT NULL,"price_supplier" DOUBLE NOT NULL,"base_price" DOUBLE NOT NULL);

create sequence s_user_id;

create table t_user(
id INT default nextval ('s_user_id'),
login varchar(128),
pass varchar(128),
email varchar(128),
admin int,
customer_id int
);

create sequence s_order_id;
create sequence s_orderlines_id;



create table t_order (
id int DEFAULT nextval('s_order_id'),
ref  VARCHAR(128),
fk_soc  int,
order_date DATE,
date_creation timestamp,
date_modif timestamp,
fk_uther_author int,
fk_statut  int,
tva  DOUBLE,
total_ht DOUBLE,
total_ttc DOUBLE,
note VARCHAR(255),
sent boolean,
sent_date timestamp
);

create table t_orderlines (
  id    INT DEFAULT nextval('s_orderlines_id'),
  fk_order_id INT references t_order(id),
  product_id  INT,
  product_ref VARCHAR(128),
  label VARCHAR(128),
  tva DOUBLE,
  qty  DOUBLE,
  unity  VARCHAR(128),
  prix_ht  DOUBLE,
  prix_ttc  DOUBLE
);

create sequence s_supplier_id;
create table t_supplier (
     id INT default nextval ('s_supplier_id'),
     name  varchar(128),
     address  varchar(128),
     tel  varchar(128),
     email varchar(128)
);

create sequence s_customer_discount_id;
create table t_customer_discount(
    id INT default nextval ('s_customer_discount_id'),
    customer_id int,
    supplier_id int,
    discount double
);


# --- !Downs

drop table "t_category";
drop table "t_products";
drop sequence s_user_id;
drop table t_user;
drop sequence s_order_id;
drop sequence s_orderlines_id;
drop table t_order;
drop table t_orderlines;
drop sequence s_supplier_id;
drop table t_supplier;
drop sequence s_customer_discount_id;
drop t_customer_discount;
