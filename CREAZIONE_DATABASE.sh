#!/bin/bash

DB_HOST="localhost"
DB_PORT="5432"
DB_USER="postgres"

sudo docker exec -it psql psql -h $DB_HOST -p $DB_PORT -U $DB_USER -c "CREATE DATABASE work;"
DB_NAME="work"


azienda="CREATE TABLE azienda(
                                numero serial,
                                ragionesociale varchar(50) PRIMARY KEY ,
                                partitaiva varchar(11) UNIQUE NOT NULL,
                                indirizzo varchar(50) UNIQUE NOT NULL,
                                comune varchar(20) NOT NULL,
                                provincia varchar(2) NOT NULL,
                                cap varchar(5) NOT NULL,
                                nazione varchar(30) NOT NULL,
                                email varchar(40) UNIQUE NOT NULL,
                                pec varchar(40) UNIQUE NOT NULL,
                                tel varchar(10) UNIQUE NOT NULL
                            );"

utenti="CREATE TABLE utenti(
                            numero serial,
                            nome varchar(30) PRIMARY KEY,
                            cognome varchar(30) UNIQUE NOT NULL,
                            tel varchar(10) UNIQUE NOT NULL,
                            ragionesociale varchar(30) REFERENCES azienda(ragionesociale),
                            email varchar(40) UNIQUE NOT NULL,
                            password varchar(102) UNIQUE NOT NULL
                        );"
                    
documenti="CREATE TABLE documenti(
                                    numero serial,
                                    id varchar(15) UNIQUE NOT NULL,
                                    documento JSON NOT NULL,
                                    token INT NOT NULL,
                                    ragionesociale varchar(30) REFERENCES azienda(ragionesociale),
                                    data DATE NOT NULL DEFAULT CURRENT_DATE
                                );"

ruoli="CREATE TABLE ruoli(
                            numero serial,
                            nome varchar(30) REFERENCES utenti(nome),
                            ragionesociale varchar(30) REFERENCES azienda(ragionesociale),
                            livello varchar(10) NOT NULL 
                        );"

tabelle=("$azienda" "$utenti" "$documenti" "$ruoli")
for tabella in "${tabelle[@]}"; do
    sudo docker exec -it psql psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -c "$tabella"
done



