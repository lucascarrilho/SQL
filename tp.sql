create database Exercice;

# Exercice 1

create table Representation(
Num_Rep INT NOT NULL primary key,
titre_Rep varchar(50),
lieu varchar(50)
);

create table Musicien(
Numm_mus int NOT NULL primary key,
nom varchar(50),
Num_Rep INT NOT NULL
);

create table Programmer(
Date int NOT NULL primary key,
Num_Rep INT NOT NULL,
tarif int
);

# Question 1

select titre_Rep from Representation;

# Question 2

Select titre_Rep from Representation where lieu = 'théâtre JCC';

# Question 3

select nom, Num_Rep from Musicien where titre_Rep in (select titre_Rep from Representation);

#Question 4

select titre_Rep, lieu from Representation where tarif in ( DATEDIFF( tarif, 2021-02-28 ) from Programmer);

# Question 5

select count(Num_mus) from Musicien where Num_rep=15 in (select Num_rep from Representation);

# Question 6

select date, Num_Rep from Programmer having (tarif <= 30);

# Exercice 2

CREATE TABLE clients (
	numCli INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomCli VARCHAR(20) NOT NULL,
    prenomCli VARCHAR(20) NOT NULL,
    adresseCli VARCHAR(255) NOT NULL,
    mailCli VARCHAR(255) NOT NULL UNIQUE 
);
CREATE TABLE vendeur (
	idVendeur INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomVendeur VARCHAR(20) NOT NULL,
    adresse_vend VARCHAR(255) NOT NULL
);
CREATE TABLE produit (
	numProd INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    designation VARCHAR(255) NOT NULL,
    prix FLOAT NOT NULL,
    qte_stock INT DEFAULT NULL
);
CREATE TABLE commande (
	numCom INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numCli INT NOT NULL,
	idVendeur INT NOT NULL,
    numProd INT NOT NULL,
	date_com DATETIME,
    qte_com INT,
    CONSTRAINT cle_com_cli FOREIGN KEY (numCli) REFERENCES clients(numCli),
    CONSTRAINT cle_com_vend FOREIGN KEY (idVendeur) REFERENCES vendeur(idVendeur),
    CONSTRAINT cle_com_prod FOREIGN KEY (numProd) REFERENCES produit(numProd)
);

# Question 1

select COMM from Employés;

# Question 2



# Question 3

select SAL from Employés having avg(SAL);

# Question 4

select DNOM from Départements where SAL in (select SAL from Employés);

# Question 5

select DNOM from Départements where max (SAL) in (select SAL from Employés );

# Question 6

select SAL, PROF from Employés having avg(SAL);

# Question 7

select PROF, min (sal) from Employés group by PROF;

# Question 8

select PROF, min (sal), avg(sal) from Employés group by PROF;

# Exercice 3

create table Client (
	Numcli int(10) auto_increment primary key,
    Nomcli varchar(20) NOT NULL,
    Prenomcli varchar(20) NOT NULL,
    Adressecli varchar(200) NOT NULL,
    Mailcli varchar(150) unique NOT NULL
    );

create table Produit (
	Numprod int(10) auto_increment primary key,
	Designation varchar(40) NOT NULL,
	Prix int(10),
	Qte_stock int
        );

create table Vendeur (
	Idvendeur int(10) auto_increment primary key,
    Nomvendeur varchar(20) not null,
    Adresse_vend varchar(50) not null
    );	

create table Commande (
	Numcom int(10) auto_increment primary key,
    Numcli int(10),
    Idvendeur int(10),
    Numprod int(10),
    constraint fk_Numcli foreign key (Numcli) references Client(Numcli),
    constraint fk_Idvendeur foreign key (Idvendeur) references Vendeur(Idvendeur),
    constraint fk_Numprod foreign key (Numprod) references Produit(Numprod),
    Date_com date,
    Qte_com int
    );
    
    # Question 1
    
    select * from Client;
    select * from Produit;
    select * from Vendeur;
    select * from Commande;
    
    # Question 2
    
    select * from Client where adressecli='Paris';
    
    # Question 3
    
    select Numprod, Designation, Prix from Produit order by max(prix);
    
    # Question 4
    
    select Nomcli, Adressecli from Client where Nomcli like 'M%';
    
    # Question 5
    
    select Numcom from Commande where Numcli='moussa' in (select Numcli from Client) and Date_com >= 2021-01-02 AND Date_com <= 2021-28-02;
    
    # Question 6
    
    select count(qte_com) from Commande where Numprod='365';
    
    # Exercice 4
    
    CREATE TABLE Salle (
	Salle_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(55) NOT NULL,
    Adresse VARCHAR(255) NOT NULL,
    Capacite INT
);
CREATE TABLE Spectacle (
	Spectacle_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Titre VARCHAR(50) NOT NULL,
    DateDeb DATETIME NOT NULL,
    Duree INT NOT NULL,
    Salle_ID INT NOT NULL,
    Chanteur VARCHAR(50) NOT NULL,
    CONSTRAINT cle_spec_salle FOREIGN KEY (Salle_ID) REFERENCES Salle(Salle_ID)
);
CREATE TABLE Concert (
	Concert_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Dates DATE NOT NULL,
    Heure DATETIME NOT NULL,
    Duree INT NOT NULL,
    Spectacle_ID INT NOT NULL,
    CONSTRAINT cle_conc_spec FOREIGN KEY (Spectacle_ID) REFERENCES Spectacle(Spectacle_ID)
);
CREATE TABLE Billet (
	Billet_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Concert_ID INT NOT NULL,
    Num_Place INT,
    Prix FLOAT,
    CONSTRAINT cle_billet_concert FOREIGN KEY (Concert_ID) REFERENCES Concert(Concert_ID)
);
CREATE TABLE Vente (
	Vente_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    Date_Vente DATETIME NOT NULL, 
	Billet_ID INT NOT NULL,
    MoyenPaiement VARCHAR(10),
    CONSTRAINT cle_vente_billet FOREIGN KEY (Billet_ID) REFERENCES Billet(Billet_ID)
);
    
    # Question 1
    
    
    # Question 2
    
    select Nom from Salle where Capacité (SELECT (MAX(Capacité) from Salle));
    
    # Question 3
    
    select Chanteur from Spectacle where Chanteur not in (select Chanteur from Spectacle where Salle_ID and Nom='Cygale');