/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  04/03/2014 23:41:14                      */
/*==============================================================*/


drop table if exists ARTICLE;

drop table if exists AUTEUR;

drop table if exists CORRECTEUR;

drop table if exists PUBLIE;

drop table if exists THEME;

/*==============================================================*/
/* Table : ARTICLE                                              */
/*==============================================================*/
create table ARTICLE
(
   ID_ARTICLE           int not null,
   ID_TH                int not null,
   ID_CORR              int not null,
   DATE_CREATION        datetime,
   DATE_MODIFICATION    datetime,
   TITRE                varchar(200),
   DESCIPTION           text,
   primary key (ID_ARTICLE)
);

/*==============================================================*/
/* Table : AUTEUR                                               */
/*==============================================================*/
create table AUTEUR
(
   ID_AUT               int not null,
   MDP_AUT              varchar(30),
   NOM_AUT              varchar(40),
   PRENOM_AUT           varchar(40),
   EMAIL_AUT            varchar(40),
   primary key (ID_AUT)
);

/*==============================================================*/
/* Table : CORRECTEUR                                           */
/*==============================================================*/
create table CORRECTEUR
(
   ID_CORR              int not null,
   PRENOM_CORR          varchar(256),
   NOM_CORR             varchar(256),
   EMAIL_CORR           varchar(256),
   primary key (ID_CORR)
);

/*==============================================================*/
/* Table : PUBLIE                                               */
/*==============================================================*/
create table PUBLIE
(
   ID_AUT               int not null,
   ID_ARTICLE           int not null,
   PRINCIPALE           bool,
   primary key (ID_AUT, ID_ARTICLE)
);

/*==============================================================*/
/* Table : THEME                                                */
/*==============================================================*/
create table THEME
(
   ID_TH                int not null,
   LIBELLE              varchar(40),
   primary key (ID_TH)
);

