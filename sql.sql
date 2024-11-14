#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

DROP TABLE IF EXISTS donnee;
DROP TABLE IF EXISTS monnaie;

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
        monnaie     Varchar (25) NOT NULL ,
        id          Int NOT NULL ,
        date_change Datetime NOT NULL ,
        taux_change Decimal (25,20) NOT NULL
	,CONSTRAINT donnee_PK PRIMARY KEY (monnaie,id)

	,CONSTRAINT donnee_monnaie_FK FOREIGN KEY (monnaie) REFERENCES monnaie(monnaie)
)ENGINE=InnoDB;