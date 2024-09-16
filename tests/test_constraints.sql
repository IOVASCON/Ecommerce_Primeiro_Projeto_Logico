-- Teste de constraints no banco de dados

-- Testar constraint de CPF e CNPJ no Cliente

-- Tentar inserir um cliente com CPF e CNPJ ao mesmo tempo (deve falhar)
INSERT INTO Cliente (Nome, Endereco, CPF, CNPJ) 
VALUES ('Teste', 'Rua X', '12345678901', '12345678000199');

-- Tentar inserir um cliente sem CPF e sem CNPJ (deve falhar)
INSERT INTO Cliente (Nome, Endereco, CPF, CNPJ) 
VALUES ('Teste', 'Rua X', NULL, NULL);
