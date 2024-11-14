#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: monnaie
#------------------------------------------------------------

CREATE TABLE monnaie(
        monnaie Varchar (25) NOT NULL
	,CONSTRAINT monnaie_PK PRIMARY KEY (monnaie)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: donnee
#------------------------------------------------------------

CREATE TABLE donnee(
        monnaie Varchar (25) NOT NULL ,
        id      Int NOT NULL ,
        date    Datetime NOT NULL ,
        change  Decimal (0,20) NOT NULL
	,CONSTRAINT donnee_PK PRIMARY KEY (monnaie,id)

	,CONSTRAINT donnee_monnaie_FK FOREIGN KEY (monnaie) REFERENCES monnaie(monnaie)
)ENGINE=InnoDB;

