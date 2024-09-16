-- Script de migração v1
-- Este arquivo pode ser usado para aplicar migrações ou alterar tabelas existentes

-- Adicionando coluna de data de cadastro à tabela Cliente
ALTER TABLE Cliente ADD COLUMN DataCadastro DATE DEFAULT CURRENT_DATE;

-- Adicionando coluna de status ativo à tabela Produto
ALTER TABLE Produto ADD COLUMN Ativo BOOLEAN DEFAULT TRUE;
