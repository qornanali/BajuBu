/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     4/28/2017 8:41:30 AM                         */
/*==============================================================*/

/*
drop index RELATIONSHIP_12_FK;

drop index PRICE_PK;

drop table PRICE;

drop index PRODUCT_PK;

drop table PRODUCT;

drop index PROMO_PK;

drop table PROMO;

drop index RELATIONSHIP_14_FK;

drop index RELATIONSHIP_13_FK;

drop index RATE_PK;

drop table RATE;

drop index RELATIONSHIP_11_FK;

drop index SIZE_PK;

drop table SIZE;

drop index RELATIONSHIP_10_FK;

drop index STOCK_PK;

drop table STOCK;

drop index RELATIONSHIP_4_FK;

drop index RELATIONSHIP_3_FK;

drop index TRANSACTION_PK;

drop table TRANSACTION;

drop index RELATIONSHIP_18_FK;

drop index RELATIONSHIP_15_FK;

drop index RELATIONSHIP_8_FK;

drop index TRANSACTION_STOCK_PK;

drop table TRANSACTION_STOCK;

drop index USER_PK;

drop table "USER";

drop index RELATIONSHIP_9_FK;

drop index VARIANT_PK;

drop table VARIANT;

drop index RELATIONSHIP_17_FK;

drop index VARIANT_IMAGE_PK;

drop table VARIANT_IMAGE;

drop index RELATIONSHIP_16_FK;

drop index VIEW_PK;

drop table VIEW;

drop index VOUCHER_PK;

drop table VOUCHER;

/*==============================================================*/
/* Table: PRICE                                                 */
/*==============================================================*/
create table PRICE (
   PRICE_ID             INT4                 AUTO_INCREMENT not null,
   SIZE_ID              INT4                 null,
   PRICE_TAX            FLOAT8               null,
   PRICE_STARTTIME      DATE                 null,
   PRICE_VALUE          FLOAT8               null,
   constraint PK_PRICE primary key (PRICE_ID)
);

/*==============================================================*/
/* Index: PRICE_PK                                              */
/*==============================================================*/
create unique index PRICE_PK on PRICE (
PRICE_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_12_FK on PRICE (
SIZE_ID
);

/*==============================================================*/
/* Table: PRODUCT                                               */
/*==============================================================*/
create table PRODUCT (
   PRODUCT_ID           INT4                 AUTO_INCREMENT not null,
   PRODUCT_NAME         VARCHAR(60)          null,
   PRODUCT_DESCRIPTION  TEXT                 null,
   PRODUCT_VIEW         INT4                 null,
   PRODUCT_CREATETIME   DATE                 null,
   constraint PK_PRODUCT primary key (PRODUCT_ID)
);

/*==============================================================*/
/* Index: PRODUCT_PK                                            */
/*==============================================================*/
create unique index PRODUCT_PK on PRODUCT (
PRODUCT_ID
);

/*==============================================================*/
/* Table: PROMO                                                 */
/*==============================================================*/
create table PROMO (
   PROMO_ID             INT4                 AUTO_INCREMENT not null,
   PROMO_TITLE          TEXT                 null,
   PROMO_BG_COLOR       TEXT                 null,
   PROMO_DESCRIPTION    TEXT                 null,
   PROMO_LINK           TEXT                 null,
   PROMO_STARTTIME      DATE                 null,
   PROMO_ENDTIME        DATE                 null,
   PROMO_TEXT_COLOR     TEXT                 null,
   constraint PK_PROMO primary key (PROMO_ID)
);

/*==============================================================*/
/* Index: PROMO_PK                                              */
/*==============================================================*/
create unique index PROMO_PK on PROMO (
PROMO_ID
);

/*==============================================================*/
/* Table: RATE                                                  */
/*==============================================================*/
create table RATE (
   RATE_ID              INT4                 AUTO_INCREMENT not null,
   PRODUCT_ID           INT4                 null,
   USER_ID              INT4                 null,
   RATE_VALUE           FLOAT8               null,
   RATE_COMMENT         TEXT                 null,
   constraint PK_RATE primary key (RATE_ID)
);

/*==============================================================*/
/* Index: RATE_PK                                               */
/*==============================================================*/
create unique index RATE_PK on RATE (
RATE_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_13_FK on RATE (
USER_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_14_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_14_FK on RATE (
PRODUCT_ID
);

/*==============================================================*/
/* Table: SIZE                                                  */
/*==============================================================*/
create table SIZE (
   SIZE_ID              INT4                 AUTO_INCREMENT not null,
   VARIANT_ID           INT4                 null,
   SIZE_NAME            TEXT                 null,
   constraint PK_SIZE primary key (SIZE_ID)
);

/*==============================================================*/
/* Index: SIZE_PK                                               */
/*==============================================================*/
create unique index SIZE_PK on SIZE (
SIZE_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on SIZE (
VARIANT_ID
);

/*==============================================================*/
/* Table: STOCK                                                 */
/*==============================================================*/
create table STOCK (
   STOCK_ID             INT4                 AUTO_INCREMENT not null,
   SIZE_ID              INT4                 null,
   STOCK_ADDTIME        DATE                 null,
   STOCK_QUANTITY       INT4                 null,
   constraint PK_STOCK primary key (STOCK_ID)
);

/*==============================================================*/
/* Index: STOCK_PK                                              */
/*==============================================================*/
create unique index STOCK_PK on STOCK (
STOCK_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on STOCK (
SIZE_ID
);

/*==============================================================*/
/* Table: TRANSACTION                                           */
/*==============================================================*/
create table TRANSACTION (
   TRANSACTION_ID       INT4                 AUTO_INCREMENT not null,
   VOUCHER_ID           INT4                 null,
   USER_ID              INT4                 null,
   TRANSACTION_CREATE_TIME DATE                 null,
   TRANSACTION_BUY_IMAGE TEXT                 null,
   TRANSACTION_USER_PHONE TEXT                 null,
   TRANSACTION_USER_NAME TEXT                 null,
   TRANSACTION_USER_ADDRESS TEXT                 null,
   TRANSACTION_UPDATE_TIME DATE                 null,
   TRANSACTION_STATUS   TEXT                 null,
   constraint PK_TRANSACTION primary key (TRANSACTION_ID)
);

/*==============================================================*/
/* Index: TRANSACTION_PK                                        */
/*==============================================================*/
create unique index TRANSACTION_PK on TRANSACTION (
TRANSACTION_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on TRANSACTION (
VOUCHER_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_4_FK on TRANSACTION (
USER_ID
);

/*==============================================================*/
/* Table: TRANSACTION_STOCK                                     */
/*==============================================================*/
create table TRANSACTION_STOCK (
   TRANSACTION_STOCK_QUANTITY INT4                 null,
   TRANSACTION_STOCK_ID INT4                 AUTO_INCREMENT not null,
   TRANSACTION_ID       INT4                 null,
   STOCK_ID             INT4                 null,
   PRICE_ID             INT4                 null,
   constraint PK_TRANSACTION_STOCK primary key (TRANSACTION_STOCK_ID)
);

/*==============================================================*/
/* Index: TRANSACTION_STOCK_PK                                  */
/*==============================================================*/
create unique index TRANSACTION_STOCK_PK on TRANSACTION_STOCK (
TRANSACTION_STOCK_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on TRANSACTION_STOCK (
TRANSACTION_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_15_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_15_FK on TRANSACTION_STOCK (
PRICE_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_18_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_18_FK on TRANSACTION_STOCK (
STOCK_ID
);

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
create table USER (
   USER_ID              INT4                 AUTO_INCREMENT not null,
   USER_FULLNAME        TEXT                 null,
   USER_JOINTIME        DATE                 null,
   USER_TYPE            INT4                 null,
   USER_PASSWORD        TEXT                 null,
   USER_EMAIL           TEXT                 null,
   USER_GENDER          VARCHAR(1)           null,
   USER_PHONE           TEXT                 null,
   USER_NAME            TEXT                 null,
   USER_ADDRESS         TEXT                 null,
   constraint PK_USER primary key (USER_ID)
);

/*==============================================================*/
/* Index: USER_PK                                               */
/*==============================================================*/
create unique index USER_PK on USER (
USER_ID
);

/*==============================================================*/
/* Table: VARIANT                                               */
/*==============================================================*/
create table VARIANT (
   VARIANT_ID           INT4                 AUTO_INCREMENT not null,
   PRODUCT_ID           INT4                 null,
   VARIANT_NAME         TEXT                 null,
   constraint PK_VARIANT primary key (VARIANT_ID)
);

/*==============================================================*/
/* Index: VARIANT_PK                                            */
/*==============================================================*/
create unique index VARIANT_PK on VARIANT (
VARIANT_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_9_FK on VARIANT (
PRODUCT_ID
);

/*==============================================================*/
/* Table: VARIANT_IMAGE                                         */
/*==============================================================*/
create table VARIANT_IMAGE (
   VARIANT_IMAGE_ID     INT4                 AUTO_INCREMENT not null,
   VARIANT_ID           INT4                 null,
   VARIANT_IMAGE_LINK   TEXT                 null,
   constraint PK_VARIANT_IMAGE primary key (VARIANT_IMAGE_ID)
);

/*==============================================================*/
/* Index: VARIANT_IMAGE_PK                                      */
/*==============================================================*/
create unique index VARIANT_IMAGE_PK on VARIANT_IMAGE (
VARIANT_IMAGE_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_17_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_17_FK on VARIANT_IMAGE (
VARIANT_ID
);

/*==============================================================*/
/* Table: VIEW                                                  */
/*==============================================================*/
create table VIEW (
   VIEW_ID              INT4                 AUTO_INCREMENT not null,
   PRODUCT_ID           INT4                 null,
   VIEW_TIME            DATE                 null,
   constraint PK_VIEW primary key (VIEW_ID)
);

/*==============================================================*/
/* Index: VIEW_PK                                               */
/*==============================================================*/
create unique index VIEW_PK on VIEW (
VIEW_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_16_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_16_FK on VIEW (
PRODUCT_ID
);

/*==============================================================*/
/* Table: VOUCHER                                               */
/*==============================================================*/
create table VOUCHER (
   VOUCHER_STARTTIME    DATE                 null,
   VOUCHER_ENDTIME      DATE                 null,
   VOUCHER_DISC         FLOAT8               null,
   VOUCHER_KEY          TEXT                 null,
   VOUCHER_ID           INT4                 AUTO_INCREMENT not null,
   constraint PK_VOUCHER primary key (VOUCHER_ID)
);

/*==============================================================*/
/* Index: VOUCHER_PK                                            */
/*==============================================================*/
create unique index VOUCHER_PK on VOUCHER (
VOUCHER_ID
);

alter table PRICE
   add constraint FK_PRICE_RELATIONS_SIZE foreign key (SIZE_ID)
      references SIZE (SIZE_ID)
      on delete restrict on update restrict;

alter table RATE
   add constraint FK_RATE_RELATIONS_USER foreign key (USER_ID)
      references USER (USER_ID)
      on delete restrict on update restrict;

alter table RATE
   add constraint FK_RATE_RELATIONS_PRODUCT foreign key (PRODUCT_ID)
      references PRODUCT (PRODUCT_ID)
      on delete restrict on update restrict;

alter table SIZE
   add constraint FK_SIZE_RELATIONS_VARIANT foreign key (VARIANT_ID)
      references VARIANT (VARIANT_ID)
      on delete restrict on update restrict;

alter table STOCK
   add constraint FK_STOCK_RELATIONS_SIZE foreign key (SIZE_ID)
      references SIZE (SIZE_ID)
      on delete restrict on update restrict;

alter table TRANSACTION
   add constraint FK_TRANSACT_RELATIONS_VOUCHER foreign key (VOUCHER_ID)
      references VOUCHER (VOUCHER_ID)
      on delete restrict on update restrict;

alter table TRANSACTION
   add constraint FK_TRANSACT_RELATIONS_USER foreign key (USER_ID)
      references USER (USER_ID)
      on delete restrict on update restrict;

alter table TRANSACTION_STOCK
   add constraint FK_TRANSACT_RELATIONS_PRICE foreign key (PRICE_ID)
      references PRICE (PRICE_ID)
      on delete restrict on update restrict;

alter table TRANSACTION_STOCK
   add constraint FK_TRANSACT_RELATIONS_STOCK foreign key (STOCK_ID)
      references STOCK (STOCK_ID)
      on delete restrict on update restrict;

alter table TRANSACTION_STOCK
   add constraint FK_TRANSACT_RELATIONS_TRANSACT foreign key (TRANSACTION_ID)
      references TRANSACTION (TRANSACTION_ID)
      on delete restrict on update restrict;

alter table VARIANT
   add constraint FK_VARIANT_RELATIONS_PRODUCT foreign key (PRODUCT_ID)
      references PRODUCT (PRODUCT_ID)
      on delete restrict on update restrict;

alter table VARIANT_IMAGE
   add constraint FK_VARIANT__RELATIONS_VARIANT foreign key (VARIANT_ID)
      references VARIANT (VARIANT_ID)
      on delete restrict on update restrict;

alter table VIEW
   add constraint FK_VIEW_RELATIONS_PRODUCT foreign key (PRODUCT_ID)
      references PRODUCT (PRODUCT_ID)
      on delete restrict on update restrict;
