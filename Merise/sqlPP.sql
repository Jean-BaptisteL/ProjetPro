#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: zui5e_usersTypes
#------------------------------------------------------------

CREATE TABLE zui5e_usersTypes(
        id   Int  Auto_increment  NOT NULL ,
        name Varchar (50) NOT NULL
	,CONSTRAINT zui5e_usersTypes_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: zui5e_users
#------------------------------------------------------------

CREATE TABLE zui5e_users(
        id                  Int  Auto_increment  NOT NULL ,
        name                Varchar (50) NOT NULL ,
        email               Varchar (70) NOT NULL ,
        password            Char (255) NOT NULL ,
        id_zui5e_usersTypes Int NOT NULL
	,CONSTRAINT zui5e_users_PK PRIMARY KEY (id)

	,CONSTRAINT zui5e_users_zui5e_usersTypes_FK FOREIGN KEY (id_zui5e_usersTypes) REFERENCES zui5e_usersTypes(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: zui5e_forumTopics
#------------------------------------------------------------

CREATE TABLE zui5e_forumTopics(
        id             Int  Auto_increment  NOT NULL ,
        tittle         Text NOT NULL ,
        date           Date NOT NULL ,
        id_zui5e_users Int NOT NULL
	,CONSTRAINT zui5e_forumTopics_PK PRIMARY KEY (id)

	,CONSTRAINT zui5e_forumTopics_zui5e_users_FK FOREIGN KEY (id_zui5e_users) REFERENCES zui5e_users(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: zui5e_forumDiscussions
#------------------------------------------------------------

CREATE TABLE zui5e_forumDiscussions(
        id                   Int  Auto_increment  NOT NULL ,
        tittle               Text NOT NULL ,
        date                 Datetime NOT NULL ,
        id_zui5e_users       Int NOT NULL ,
        id_zui5e_forumTopics Int NOT NULL
	,CONSTRAINT zui5e_forumDiscussions_PK PRIMARY KEY (id)

	,CONSTRAINT zui5e_forumDiscussions_zui5e_users_FK FOREIGN KEY (id_zui5e_users) REFERENCES zui5e_users(id)
	,CONSTRAINT zui5e_forumDiscussions_zui5e_forumTopics0_FK FOREIGN KEY (id_zui5e_forumTopics) REFERENCES zui5e_forumTopics(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: zui5e_forumPublications
#------------------------------------------------------------

CREATE TABLE zui5e_forumPublications(
        id                        Int  Auto_increment  NOT NULL ,
        content                   Text NOT NULL ,
        date                      Datetime NOT NULL ,
        id_zui5e_users            Int NOT NULL ,
        id_zui5e_forumDiscussions Int NOT NULL
	,CONSTRAINT zui5e_forumPublications_PK PRIMARY KEY (id)

	,CONSTRAINT zui5e_forumPublications_zui5e_users_FK FOREIGN KEY (id_zui5e_users) REFERENCES zui5e_users(id)
	,CONSTRAINT zui5e_forumPublications_zui5e_forumDiscussions0_FK FOREIGN KEY (id_zui5e_forumDiscussions) REFERENCES zui5e_forumDiscussions(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: zui5e_flightSpots
#------------------------------------------------------------

CREATE TABLE zui5e_flightSpots(
        id             Int  Auto_increment  NOT NULL ,
        name           Varchar (50) NOT NULL ,
        longitude      Varchar (20) NOT NULL ,
        latitude       Varchar (20) NOT NULL ,
        description    Text ,
        id_zui5e_users Int NOT NULL
	,CONSTRAINT zui5e_flightSpots_PK PRIMARY KEY (id)

	,CONSTRAINT zui5e_flightSpots_zui5e_users_FK FOREIGN KEY (id_zui5e_users) REFERENCES zui5e_users(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: _zui5e_articleType
#------------------------------------------------------------

CREATE TABLE _zui5e_articleType(
        id   Int  Auto_increment  NOT NULL ,
        type TinyText NOT NULL
	,CONSTRAINT _zui5e_articleType_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: zui5e_articles
#------------------------------------------------------------

CREATE TABLE zui5e_articles(
        id                    Int  Auto_increment  NOT NULL ,
        title                 Varchar (70) NOT NULL ,
        content               Text NOT NULL ,
        date                  Date NOT NULL ,
        id_zui5e_users        Int NOT NULL ,
        id__zui5e_articleType Int NOT NULL
	,CONSTRAINT zui5e_articles_PK PRIMARY KEY (id)

	,CONSTRAINT zui5e_articles_zui5e_users_FK FOREIGN KEY (id_zui5e_users) REFERENCES zui5e_users(id)
	,CONSTRAINT zui5e_articles__zui5e_articleType0_FK FOREIGN KEY (id__zui5e_articleType) REFERENCES _zui5e_articleType(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: zui5e_comments
#------------------------------------------------------------

CREATE TABLE zui5e_comments(
        id                Int  Auto_increment  NOT NULL ,
        content           Text NOT NULL ,
        date              Date NOT NULL ,
        id_zui5e_users    Int NOT NULL ,
        id_zui5e_articles Int NOT NULL
	,CONSTRAINT zui5e_comments_PK PRIMARY KEY (id)

	,CONSTRAINT zui5e_comments_zui5e_users_FK FOREIGN KEY (id_zui5e_users) REFERENCES zui5e_users(id)
	,CONSTRAINT zui5e_comments_zui5e_articles0_FK FOREIGN KEY (id_zui5e_articles) REFERENCES zui5e_articles(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: zui5e_reportedPublications
#------------------------------------------------------------

CREATE TABLE zui5e_reportedPublications(
        id                         Int  Auto_increment  NOT NULL ,
        reason                     Text NOT NULL ,
        date                       Datetime NOT NULL ,
        id_zui5e_users             Int NOT NULL ,
        id_zui5e_articles          Int ,
        id_zui5e_comments          Int ,
        id_zui5e_forumDiscussions  Int ,
        id_zui5e_forumPublications Int ,
        id_zui5e_flightSpots       Int
	,CONSTRAINT zui5e_reportedPublications_PK PRIMARY KEY (id)

	,CONSTRAINT zui5e_reportedPublications_zui5e_users_FK FOREIGN KEY (id_zui5e_users) REFERENCES zui5e_users(id)
	,CONSTRAINT zui5e_reportedPublications_zui5e_articles0_FK FOREIGN KEY (id_zui5e_articles) REFERENCES zui5e_articles(id)
	,CONSTRAINT zui5e_reportedPublications_zui5e_comments1_FK FOREIGN KEY (id_zui5e_comments) REFERENCES zui5e_comments(id)
	,CONSTRAINT zui5e_reportedPublications_zui5e_forumDiscussions2_FK FOREIGN KEY (id_zui5e_forumDiscussions) REFERENCES zui5e_forumDiscussions(id)
	,CONSTRAINT zui5e_reportedPublications_zui5e_forumPublications3_FK FOREIGN KEY (id_zui5e_forumPublications) REFERENCES zui5e_forumPublications(id)
	,CONSTRAINT zui5e_reportedPublications_zui5e_flightSpots4_FK FOREIGN KEY (id_zui5e_flightSpots) REFERENCES zui5e_flightSpots(id)
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: zui5e_usersTypes Remplissage
#------------------------------------------------------------

INSERT INTO `zui5e_usersTypes` (`name`)
VALUES ('user'), ('moderator'), ('administrator');
