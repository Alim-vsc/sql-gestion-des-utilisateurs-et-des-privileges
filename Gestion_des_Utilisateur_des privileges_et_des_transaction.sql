/*------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*Creation de la base de donnée */
create database gestion_des_utilisateurs_des_privileges_et_des_transactions;
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* utilisation de la base de donnée crée */
use gestion_des_utilisateurs_des_privileges_et_des_transactions;
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*creation des tables utilisateur profil, privilege , utilisateur_profil, privilege_profil . */
create table Utilisateur(
	id_Utilisateur varchar(50) primary key,
    nom varchar(50),
    prenom varchar(50),
    email varchar(50) unique not null,
    login varchar(50) unique not null,
    mots_de_passe varchar(50),
    statut varchar(50),
    date_creation varchar(50)
);
  CREATE TABLE PROFIL ( id_profil VARCHAR(10) PRIMARY KEY,
     libelle  VARCHAR (50) UNIQUE NOT NULL,
	 descriptions  VARCHAR(100) 
);
CREATE TABLE PRIVILEGE (
    libelle VARCHAR(100) UNIQUE NOT NULL,
    descriptions VARCHAR(200),
    id_privilege VARCHAR(50) PRIMARY KEY
);
  CREATE TABLE UTILISATEUR_PROFIL( id_utilisateur VARCHAR(50) NOT NULL,
	id_profil VARCHAR(50) NOT NULL,
	date_attribution VARCHAR(50),
	PRIMARY KEY(id_utilisateur, id_profil),
    FOREIGN KEY (id_utilisateur) references Utilisateur(id_Utilisateur),
    FOREIGN KEY (id_profil) references PROFIL(id_profil)
	);
    CREATE TABLE PROFIL_PRIVILEGE ( id_profil VARCHAR (10),
id_privilege VARCHAR(50),
PRIMARY KEY(id_profil,id_privilege),
FOREIGN KEY (id_profil) REFERENCES PROFIL(id_profil),
FOREIGN KEY (id_privilege) REFERENCES PRIVILEGE(id_privilege)
);
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/* insertion des elements dans les differentes tables */
insert into Utilisateur(id_Utilisateur,nom,prenom,email,login,mots_de_passe,statut,date_creation)values
  ("U01","SAKO","Alim","alim@gmail.com","alim","ADMIS@01","ACTIF","12/10/2026"),
  ("U02","KINDA","Steve","Steve@gmail.com","steve","ADMIS@02","INACTIF","12/10/2026"),
  ("U03","OUEDRAOGO","Anicet","anicet@gmail.com","anicet","ADMIS@03","ACTIF","12/10/2026"),
  ("U04","AKPO","Nandja","nandja@gmail.com","nandja","ADMIS@04","INACTIF","12/10/2026"),
  ("U05","SOMMET","Ange","ange@gmail.com","ange","GESTION@01","ACTIF","15/10/2026"),
  ("U06","PARDEVANT","Devis","devis@gmail.com","devis","GESTION@02","INACTIF","15/10/2026"),
  ("U07","SAWADOGO","Safoura","safoura@gmail.com","safoura","GESTION@03","ACTIF","16/10/2026"),
  ("U08","KINDO","Blaise","blaise@gmail.com","blaise","GESTION@04","INACTIF","16/10/2026"),
  ("U09","LEYE","Abdul","abdul@gmail.com","abdul","GESTION@05","ACTIF","16/10/2026"),
  ("U10","BA","Karim","karim@gmail.com","karim","ENSEIGNANT@01","ACTIF","18/10/2026"),
  ("U11","BADO","Luc","luc@gmail.com","luc","ENSEIGNANT@02","INACTIF","18/10/2026"),
  ("U12","ZIO","Evrade","evrade@gmail.com","evrade","ENSEIGNANT@03","ACTIF","18/10/2026"),
  ("U13","GEYE","Mass","mass@gmail.com","mass","ENSEIGNANT@04","INACTIF","17/10/2026"),
  ("U14","KOMBO","Saviola","saviola@gmail.com","saviola","ENSEIGNANT@05","ACTIF","19/10/2026"),
  ("U15","OUATTARA","Ariel","ariel@gmail.com","ariel","ETUDIANT@01","ACTIF","19/10/2026"),
  ("U16","NIKIEMA","Hanifa","hanifa@gmail.com","hanifa","ETUDIANT@02","INACTIF","19/10/2026"),
  ("U17","AKKI","Lisa","lisa@gmail.com","lisa","ETUDIANT@03","ACTIF","20/10/2026"),
  ("U18","ZOUGRANA","Arséne","arsene@gmail.com","arsene","ETUDIANT@04","INACTIF","21/10/2026"),
  ("U19","DIALLO","Omar","omar@gmail.com","omar","ETUDIANT@05","ACTIF","21/10/2026"),
  ("U20","OUEDRAOGO","Entonio","entonio@gmail.com","entonio","ETUDIANT@06","INACTIF","21/10/2026"); 
INSERT INTO PROFIL(id_profil,libelle,descriptions) VALUES
("P01","ADMINISTRATEUR","gere les utilisateurs et les parametres du systeme "),
("P02","GESTIONNAIRE","gere les informations administratives ainsi que la vie scolaire"),
("P03","ENSEIGNANT"," gere les dispenses de cours, l'evaluation des etudiants ainsi que leurs notes"),
("P04","ETUDIANT","consulte ses informations personnelles et ses notes , participe aux cours et aux evaluations");
INSERT INTO PRIVILEGE (libelle, descriptions,id_privilege) VALUES
('CREER_UTILISATEUR', 'Permet de créer un nouvel utilisateur','PV01'),
('MODIFIER_UTILISATEUR', 'Permet de modifier les informations d un utilisateur','PV02'),
('SUPPRIMER_UTILISATEUR', 'Permet de supprimer un utilisateur','PV03'),
('CONSULTER_UTILISATEUR', 'Permet de consulter les informations des utilisateurs','PV04'),
('GERER_PROFILS', 'Permet de créer et de gérer les profils','PV05'),
('CONSULTER_DONNEES', 'Permet de consulter les données de la base','PV06');
INSERT INTO UTILISATEUR_PROFIL(id_utilisateur, id_profil, date_attribution) VALUES
	('U01','P01','12/10/2026'),
	('U02','P01','12/10/2026'),
	('U03','P01','12/10/2026'),
	('U04','P01','12/10/2026'),
	('U05','P02','15/10/2026'),
    ('U06','P02','16/10/2026'),
    ('U07','P02','15/10/2026'),
    ('U08','P02','16/10/2026'),
    ('U09','P02','15/10/2026'),
    ('U10','P03','14/10/2026'),
    ('U11','P03','14/10/2026'),
    ('U12','P03','13/10/2026'),
    ('U13','P03','20/10/2026'),
    ('U14','P03','16/10/2026'),
    ('U15','P04','15/10/2026'),
    ('U16','P04','15/10/2026'),
    ('U17','P04','14/10/2026'),
    ('U18','P04','15/10/2026'),
    ('U19','P04','15/10/2026'),
    ('U20','P04','17/10/2026');
INSERT INTO PROFIL_PRIVILEGE ( id_profil,id_privilege) VALUES
("P01","PV01"),
("P01","PV02"),
("P01","PV03"),
("P01","PV04"),
("P01","PV05"),
("P01","PV06"),
("P02","PV01"),
("P02","PV02"),
("P02","PV04"),
("P02","PV06"),
("P03","PV04"),
("P03","PV06"),
("P04","PV04"),
("P04","PV06");
/*-------------------------------------------------------------------------------------------------------------*/
/*Transaction de creation d'un utilisateur*/
/*START TRANSACTION;
insert into Utilisateur(id_Utilisateur,nom,prenom,email,login,mots_de_passe,statut,date_creation)values
("U21","MACRON","Manu","manu@gmail.com","manu","ETUDIANT@07","INACTIF","16/10/2026");
INSERT INTO UTILISATEUR_PROFIL(id_utilisateur, id_profil, date_attribution) VALUES
("U21","P04","16/10/2026");
commit;
/*---------------------------------------------------------------------------------------------------------*/
/*scenario d une transaction d'annulation */
start transaction;
insert into Utilisateur(id_Utilisateur,nom,prenom,email,login,mots_de_passe,statut,date_creation)values
("U22","TRUMP","Donald","dooooo@gmail.com","donoale","ETUDIANT@07","INACTIF","16/10/2026");
INSERT INTO UTILISATEUR_PROFIL(id_utilisateur, id_profil, date_attribution) VALUES
("U22","P04","16/10/2026");
rollback;
commit ;
/*-----------------------------------------------------------------------------------------------------------*/
/*scenario d une transaction de madification */
start transaction ;
update Utilisateur
set email="blaise01@gmail.com", nom="Kando"
where id_Utilisateur= "U08";
commit ;

start transaction ;
update Utilisateur
set email="blaise@gmail.com", nom="KANDO"
where id_Utilisateur= "U08";
commit ;
/*------------------------------------------------------------------------------------------------------------------------*/
/*les methodes*/
/* pour la selection des etudiants */
select nom,prenom from Utilisateur u,UTILISATEUR_PROFIL p
where u.id_utilisateur=p.id_utilisateur and id_profil="P04";*/