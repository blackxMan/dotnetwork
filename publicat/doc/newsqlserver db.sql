/*==============================================================*/
/* Nom de SGBD :  Microsoft SQL Server 2008                     */
/* Date de cr�ation :  04/03/2014 23:41:58                      */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('ARTICLE')
            and   type = 'U')
   drop table ARTICLE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AUTEUR')
            and   type = 'U')
   drop table AUTEUR
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CORRECTEUR')
            and   type = 'U')
   drop table CORRECTEUR
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PUBLIE')
            and   type = 'U')
   drop table PUBLIE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('THEME')
            and   type = 'U')
   drop table THEME
go

/*==============================================================*/
/* Table : ARTICLE                                              */
/*==============================================================*/
create table ARTICLE (
   ID_ARTICLE           int                  not null,
   ID_TH                int                  not null,
   ID_CORR              int                  not null,
   DATE_CREATION        datetime             null,
   DATE_MODIFICATION    datetime             null,
   TITRE                varchar(200)         null,
   DESCIPTION           text                 null,
   constraint PK_ARTICLE primary key nonclustered (ID_ARTICLE)
)
go

/*==============================================================*/
/* Table : AUTEUR                                               */
/*==============================================================*/
create table AUTEUR (
   ID_AUT               int                  not null,
   MDP_AUT              varchar(30)          null,
   NOM_AUT              varchar(40)          null,
   PRENOM_AUT           varchar(40)          null,
   EMAIL_AUT            varchar(40)          null,
   constraint PK_AUTEUR primary key nonclustered (ID_AUT)
)
go

/*==============================================================*/
/* Table : CORRECTEUR                                           */
/*==============================================================*/
create table CORRECTEUR (
   ID_CORR              int                  not null,
   PRENOM_CORR          varchar(256)         null,
   NOM_CORR             varchar(256)         null,
   EMAIL_CORR           varchar(256)         null,
   constraint PK_CORRECTEUR primary key nonclustered (ID_CORR)
)
go

/*==============================================================*/
/* Table : PUBLIE                                               */
/*==============================================================*/
create table PUBLIE (
   ID_AUT               int                  not null,
   ID_ARTICLE           int                  not null,
   PRINCIPALE           bit                  null,
   constraint PK_PUBLIE primary key nonclustered (ID_AUT, ID_ARTICLE)
)
go

/*==============================================================*/
/* Table : THEME                                                */
/*==============================================================*/
create table THEME (
   ID_TH                int                  not null,
   LIBELLE              varchar(40)          null,
   constraint PK_THEME primary key nonclustered (ID_TH)
)
go

