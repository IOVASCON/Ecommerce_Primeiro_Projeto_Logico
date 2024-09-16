-- Script de criação do esquema do banco de dados

CREATE DATABASE IF NOT EXISTS Ecomm;
USE Ecomm;

-- CLIENTE
CREATE TABLE Cliente(
    idCliente INT auto_increment PRIMARY KEY,
    Nome VARCHAR(45),
    Endereco VARCHAR(45),
    CPF CHAR(11) NOT NULL,
    CNPJ VARCHAR(18),
    CONSTRAINT chk_cliente_cpf_cnpj CHECK ((CPF IS NOT NULL AND CNPJ IS NULL) OR (CPF IS NULL AND CNPJ IS NOT NULL)),
    CONSTRAINT unique_cpf_cliente UNIQUE (CPF),
    CONSTRAINT unique_cnpj_cliente UNIQUE (CNPJ)
);

-- Outras tabelas como no script anterior...
