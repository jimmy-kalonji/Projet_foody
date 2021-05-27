DROP DATABASE IF EXISTS FOODY;
CREATE DATABASE IF NOT EXISTS FOODY ;
USE FOODY ;
CREATE TABLE Client(
CodeCli CHAR (5) PRIMARY KEY , Societe VARCHAR(150), Contact VARCHAR(150), Fonction VARCHAR(150),
Adresse VARCHAR (150), Ville VARCHAR (150), Region VARCHAR (150), CodePostal VARCHAR(150),
Pays VARCHAR (150), Tel VARCHAR(150), Fax VARCHAR(150));

CREATE TABLE Messager(
NoMess INT PRIMARY KEY, NomMess VARCHAR(150),Tel VARCHAR(150));

CREATE TABLE Employe (
    NoEmp INT PRIMARY KEY,
    Nom VARCHAR(150),
    Prenom VARCHAR(150),
    Fonction VARCHAR(150),
    TitreCourtoisie VARCHAR(100),
    DateNaissance DATETIME,
    DateEmbauche DATETIME,
    Adresse VARCHAR(150),
    Ville VARCHAR(150),
    Region VARCHAR(150),
    Codepostal VARCHAR(150),
    Pays VARCHAR(150),
    TelDom VARCHAR(150),
    Extension INT,
    RendCompteA INT REFERENCES employe(NoEmp)
);

CREATE TABLE Commande( 
NoCom INT (5) PRIMARY KEY, CodeCli CHAR (5), NoEmp INT, DateCom DATETIME,  AlivAvant DATETIME,
DateEnv DATETIME, NoMess INT, Portt FLOAT ,Destinataire VARCHAR(150),AdrLiv VARCHAR(150),
VilleLiv VARCHAR(150),RegionLiv VARCHAR(150),CodePostalLiv VARCHAR(150),PaysLiv VARCHAR(150),
FOREIGN KEY (Codecli) REFERENCES Client (CodeCli),
FOREIGN KEY (NoMess) REFERENCES Messager (NoMess),
FOREIGN KEY (NoEmp) REFERENCES Employe (NoEmp)
);

CREATE TABLE Fournisseur(
NoFour INT PRIMARY KEY,Societe VARCHAR(150), Contact VARCHAR(150), Fonction VARCHAR(150), Adresse VARCHAR(150),
Ville VARCHAR(150), Region VARCHAR(150), CodePostal VARCHAR(150),Pays VARCHAR(150),Tel VARCHAR(150),
Fax VARCHAR(150) ,PageAccueil VARCHAR(150));

CREATE TABLE Categorie(
CodeCateg INT PRIMARY KEY, NomCateg VARCHAR(150),Descriptionn TEXT);

CREATE TABLE Produit(
RefProd INT PRIMARY KEY, NomProd VARCHAR(150),NoFour INT,CodeCateg INT,QteParUnit VARCHAR(150),
PrixUnit FLOAT, UnitesStock INT, UnitesCom INT, NiveauReap INT, Indisponible INT,
FOREIGN KEY (NoFour) REFERENCES Fournisseur (NoFour),
FOREIGN KEY (CodeCateg) REFERENCES Categorie (CodeCateg));

CREATE TABLE DetailCommande(
Nocom INT , RefProd INT,PrixUnit FLOAT,Qte INT,Remise float, PRIMARY KEY (Nocom, RefProd),
FOREIGN KEY (NoCom) REFERENCES Commande (NoCom),
FOREIGN KEY (RefProd) REFERENCES Produit (RefProd));

SET GLOBAL local_infile=1;
LOAD DATA LOCAL INFILE 'C:/Users/maxim/OneDrive/Documents/simplon/Projet Foody/data_foody/detailsCommande.csv' 
INTO TABLE detailcommande
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;