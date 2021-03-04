# Exercice 1

create database immobilier;

create table Agence(
idAgence int primary key auto_increment not null,
nom varchar(50),
adresse varchar(50)
);

create table demande(
idDemande int primary key auto_increment not null,
idPersonne int primary key auto_increment not null,
type varchar(50),
ville varchar(50),
budget int,
superficie int,
categorie varchar(50)
);

create table logement_agence(
idLogementAgence int primary key auto_increment not null,
idAgence int primary key auto_increment not null,
idLogement int auto_increment not null,
frais int,
foreign key (idAgence) references agence(idAgence),
foreign key (idLogement) references logement(idLogement)
);

create table logement(
idLogement int primary key auto_increment not null,
type varchar(50),
ville varchar(50),
prix int,
superficie int,
categorie varchar(50)
);

create table logement_personne(
idLogementPersonne int primary key auto_increment not null,
idPersonne int not null,
idLogement int not null,
foreign key (idPersonne) references demande(idPersonne),
foreign key (idLogement) references logement(idLogement)
);

# Exercice 2

insert into Agence(nom, adresse) values
('logic-imo', 'www.logic-immo.com'),
('century21', 'rue century'),
('laforet', 'rue laforet'),
('fnaim', 'rue fnaim'),
('orpi', 'rue orpi'),
('foncia', 'rue foncia'),
('guy-hoquet', 'rue guy-hoquet'),
('seloger', 'www.seloger.com'),
('bouygues immobilier', 'www.bouygues-immobilier.com');

insert into demande(type, ville, budget, superficie, categorie) values
('appartement','paris',530000,120,'vente'),
('appartement','bordeaux',120000,18,'vente'),
('appartement','bordeaux',145000,21,'vente'),
('appartement','bordeaux',152000,26,'vente'),
('appartement','lyon',200000,55,'vente'),
('appartement','paris',171000,40,'vente'),
('appartement','paris',163000,25,'vente'),
('appartement','paris',132000,15,'vente'),
('appartement','paris',350000,80,'vente'),
('appartement','lyon',600,20,'location'),
('appartement','lyon',188000,65,'vente'),
('appartement','paris',400,15,'location'),
('appartement','paris',330500,100,'vente'),
('appartement','paris',90000,15,'vente'),
('appartement','lyon',123000,21,'vente'),
('appartement','lyon',1200,70,'vente'),
('appartement','lyon',1500,100,'vente'),
('appartement','paris',600,20,'location'),
('appartement','paris',750,30,'location'),
('appartement','bordeaux',680,30,'location'),
('appartement','bordeaux',213000,40,'vente');

insert into logement_agence(frais) values (15000);

insert into logement(type, ville, prix, superficie, categorie) values
('appartement','paris',185000,61,'vente'),
('appartement','paris',115000,15,'vente'),
('maison','paris',510000,130,'vente'),
('appartement','bordeaux',550,17,'location'),
('appartement','lyon',420,14,'location'),
('appartement','paris',160000,40,'vente'),
('appartement','paris',670,35,'location'),
('appartement','lyon',110000,16,'vente'),
('appartement','bordeaux',161000,33,'vente'),
('appartement','paris',202000,90,'vente');

# Exercice 3

# Question 1

select nom from Agence;

# Question 2

select idAgence from Agence where nom = 'orpi';

# Question 3

select * from logement where id = 1;

# Question 4

select count(*) from logement;

# Question 5

select * from logement where prix < 150000 order by prix;

# QUestion 6

select count(*) from logement where categorie = 'location'

# Question 7

select ville from demande

#Question 8

select ville, count(Distinct ville) from logement;

# Question 9

select idLogement from logement where categorie = 'location';

# Question 10

select idLogement from logement where superficie => 20 and superficie =< 50;

# Question 11

select min(prix) from logement where categorie = 'vente';

# Question 12

select ville from logement where categorie = 'vente';

# Question 13

update logement_agence set frais = 730 where id = 3;

# Question 14

select * from logement where nom = 'seloger';

# Question 15



# Exercice 4

create USER 'afpa'@'localhost' IDENTIFIED BY 'afpa';
create USER 'cda314'@'localhost' IDENTIFIED BY 'cda314';
grant select, insert on table logement to 'afpa'@'localhost';
grant select, insert on table logement_personne to 'afpa'@'localhost';
grant delete on table logement to 'cda314'@'localhost';
grant delete on table demande to 'cda314'@'localhost';