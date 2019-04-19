/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2019/4/13 18:25:31                           */
/*==============================================================*/


drop table if exists tb_address_detail;

drop table if exists tb_cart;

drop table if exists tb_city;

drop table if exists tb_collect_commodity;

drop table if exists tb_collect_seller;

drop table if exists tb_comment;

drop table if exists tb_comment_append;

drop table if exists tb_comment_image;

drop table if exists tb_commodity;

drop table if exists tb_commodity_extend_property;

drop table if exists tb_commodity_media_resource;

drop table if exists tb_commodity_select_property;

drop table if exists tb_commodity_variable;

drop table if exists tb_commodity_variety;

drop table if exists tb_history;

drop table if exists tb_order;

drop table if exists tb_order_commodity_select_property;

drop table if exists tb_order_detail;

drop table if exists tb_province;

drop table if exists tb_seller;

drop table if exists tb_user;

drop table if exists tb_variety;

/*==============================================================*/
/* Table: "tb_address_detail"                                   */
/*==============================================================*/
create table tb_address_detail
(
   id                   int not null auto_increment,
   user_id              int,
   city_id              int,
   detail_address       varchar(100),
   receiver             varchar(20),
   phone_number         varchar(20),
   primary key (id)
);

/*==============================================================*/
/* Table: tb_cart                                               */
/*==============================================================*/
create table tb_cart
(
   id                   int not null auto_increment,
   user_id              int,
   select_property_row                varchar(20),
   quantity             int,
   primary key (id),
	 unique user_row_unique (user_id, select_property_row)
);

/*==============================================================*/
/* Table: tb_city                                               */
/*==============================================================*/
create table tb_city
(
   id                   int not null auto_increment,
   province_id          int,
   city                 varchar(50),
   primary key (id)
);

/*==============================================================*/
/* Table: tb_collect_commodity                                  */
/*==============================================================*/
create table tb_collect_commodity
(
   id                   int not null auto_increment,
   user_id              int,
   commodity_id         int,
   primary key (id),
	 unique user_commodity_unique (user_id, commodity_id)
);

/*==============================================================*/
/* Table: tb_collect_seller                                     */
/*==============================================================*/
create table tb_collect_seller
(
   id                   int not null auto_increment,
   user_id              int,
   seller_id            int,
   primary key (id),
	 unique user_seller_unique (user_id, seller_id)
);

/*==============================================================*/
/* Table: tb_comment                                            */
/*==============================================================*/
create table tb_comment
(
   id                   int not null auto_increment,
   order_id             int,
   commodity_id         int,
	 primary key (id),
	 unique order_commodity_unique (order_id, commodity_id)
);

/*==============================================================*/
/* Table: tb_comment_append                                     */
/*==============================================================*/
create table tb_comment_append
(
   id                   int not null auto_increment,
   comment_id           int,
   comment              text,
	 reply								text,
   comment_time         datetime,
   primary key (id)
);

/*==============================================================*/
/* Table: tb_comment_image                                      */
/*==============================================================*/
create table tb_comment_image
(
   id                   int not null auto_increment,
   comment_append_id    int,
   comment_image        varchar(100),
   primary key (id),
	 unique comment_append_image_unique (comment_append_id, comment_image)
);

/*==============================================================*/
/* Table: tb_commodity                                          */
/*==============================================================*/
create table tb_commodity
(
   id                   int not null auto_increment,
   seller_id            int,
   title                varchar(200),
   subtitle             varchar(200),
   status               int,
   detail               text,
   is_delete            bool default false,
   cover_image          varchar(100),
   primary key (id)
);

/*==============================================================*/
/* Table: tb_commodity_extend_property                          */
/*==============================================================*/
create table tb_commodity_extend_property
(
   id                   int not null auto_increment,
   commodity_id         int,
   property_name        varchar(50),
   property_value       varchar(100),
   primary key (id),
	 unique commodity_property_name_unique (commodity_id, property_name)
);

/*==============================================================*/
/* Table: tb_commodity_media_resource                           */
/*==============================================================*/
create table tb_commodity_media_resource
(
   id                   int not null auto_increment,
   commodity_id         int,
   media_type           int,
   location             varchar(100),
   primary key (id)
);

/*==============================================================*/
/* Table: tb_commodity_select_property                          */
/*==============================================================*/
create table tb_commodity_select_property
(
   id                   int not null auto_increment,
   commodity_id         int,
   select_property_row                varchar(20),
   media_type           int,
   property_name        varchar(50),
   property_value       varchar(100),
   primary key (id), 
	 index row_index (select_property_row)
);

/*==============================================================*/
/* Table: tb_commodity_variable                                 */
/*==============================================================*/
create table tb_commodity_variable
(
   id                   int not null auto_increment,
   select_property_row                varchar(20),
   stock                int,
   price                float(20,2),
   promotion_price      float(20,2),
   primary key (id),
	 unique row_unique (select_property_row)
);

/*==============================================================*/
/* Table: tb_commodity_variety                                  */
/*==============================================================*/
create table tb_commodity_variety
(
   id                   int not null auto_increment,
   commodity_id         int,
   variety_id           int,
   primary key (id), 
	 unique commodity_variety_unique (commodity_id, variety_id)
);

/*==============================================================*/
/* Table: tb_history                                            */
/*==============================================================*/
create table tb_history
(
   id                   int not null auto_increment,
   user_id              int,
   commodity_id         int,
   browse_time          datetime,
   primary key (id), 
	 unique user_commodity_unique (user_id, commodity_id)
);

/*==============================================================*/
/* Table: tb_order                                              */
/*==============================================================*/
create table tb_order
(
   id                   int not null auto_increment,
   user_id              int,
   seller_id            int,
   order_number         varchar(20),
   user_name            varchar(20),
   store_name           varchar(20),
   generate_time        datetime default now(),
   status               int,
   is_delete            bool default false,
   receive_address      char(200),
   primary key (id),
	 unique order_number_unique (order_number)
);

/*==============================================================*/
/* Table: tb_order_commodity_select_property                    */
/*==============================================================*/
create table tb_order_commodity_select_property
(
   id                   int not null auto_increment,
   order_detail_id        int,
   property_name        varchar(50),
   property_value       varchar(100),
   primary key (id)
);

/*==============================================================*/
/* Table: tb_order_detail                                       */
/*==============================================================*/
create table tb_order_detail
(
   id                   int not null auto_increment,
   order_id             int,
   commodity_id         int,
   commotity_name       varchar(200),
   commodity_cover      varchar(100),
   price                float(20,2),
   promotion_price      float(20,2),
   quantity		int,
   primary key (id),
);

/*==============================================================*/
/* Table: tb_province                                           */
/*==============================================================*/
create table tb_province
(
   id                   int not null auto_increment,
   province             varchar(20),
   primary key (id)
);

/*==============================================================*/
/* Table: tb_seller                                             */
/*==============================================================*/
create table tb_seller
(
   id                   int not null auto_increment,
   city_id              int,
   username             varchar(20),
   password             varchar(20),
   store_name           varchar(20),
   store_cover          varchar(100),
   store_status         int,
   register_time        datetime,
   activity             text,
   detail_address       varchar(100),
   primary key (id),
	 unique username_unique (username)
);

/*==============================================================*/
/* Table: tb_user                                               */
/*==============================================================*/
create table tb_user
(
   id                   int not null auto_increment,
   username             varchar(20),
   password             varchar(20),
   name                 varchar(20),
   gender               int,
   profile_photo        varchar(100),
   primary key (id),
	 unique username_unique (username)
);

/*==============================================================*/
/* Table: tb_variety                                            */
/*==============================================================*/
create table tb_variety
(
   id                   int not null auto_increment,
   parent_id            int,
   name                 varchar(10),
   primary key (id)
);

