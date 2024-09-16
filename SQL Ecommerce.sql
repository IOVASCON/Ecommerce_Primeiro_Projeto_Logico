CREATE DATABASE IF NOT EXISTS Ecomm;
USE Ecomm;

-- CLIENTE
CREATE TABLE Cliente(
    idCliente INT auto_increment PRIMARY KEY,
    Nome VARCHAR(45),
    Endereco VARCHAR(45), -- Corrigi de "Endereço" para "Endereco" sem acento
    CPF CHAR (11) NOT NULL,
    CNPJ VARCHAR(18),
    CONSTRAINT chk_cliente_cpf_cnpj CHECK ((CPF IS NOT NULL AND CNPJ IS NULL) OR (CPF IS NULL AND CNPJ IS NOT NULL)),
    CONSTRAINT unique_cpf_cliente UNIQUE (CPF),
    CONSTRAINT unique_cnpj_cliente UNIQUE (CNPJ)
);

-- PRODUTO
CREATE TABLE Produto(
    idProduto INT auto_increment PRIMARY KEY,
    Categoria VARCHAR(45),
    Descricao VARCHAR(45), -- Corrigi de "Descrição" para "Descricao" sem acento
    Valor FLOAT
);

-- PAGAMENTO
CREATE TABLE Pagamento(
    idPagamento INT auto_increment PRIMARY KEY,
    PagamentoCliente INT,
    FormaPagamento VARCHAR(45),
    Cartao VARCHAR(45), -- Corrigi de "Cartão" para "Cartao" sem acento
    Bandeira VARCHAR(45),
    Numero VARCHAR(45), -- Corrigi de "Número" para "Numero" sem acento
    CONSTRAINT fk_pagamento_cliente FOREIGN KEY (PagamentoCliente) REFERENCES Cliente(idCliente)
);

-- ENTREGA
CREATE TABLE Entrega(
    idEntrega INT auto_increment PRIMARY KEY,
    Status VARCHAR(45),
    CodigoRastreio VARCHAR(45),
    DataEntrega DATE
);

-- PEDIDO
CREATE TABLE Pedido(
    idPedido INT auto_increment PRIMARY KEY,
    idCliente INT,
    Frete FLOAT,
    Descricao VARCHAR(45), -- Corrigi de "Descrição" para "Descricao" sem acento
    Entrega_idEntrega INT,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    CONSTRAINT fk_pedido_entrega FOREIGN KEY (Entrega_idEntrega) REFERENCES Entrega(idEntrega)
);

-- PEDIDO/PRODUTO
CREATE TABLE PedidoProduto(
    Pedido_idPedido INT,
    Produto_idProduto INT,
    Quantidade FLOAT,
    PRIMARY KEY (Pedido_idPedido, Produto_idProduto),
    CONSTRAINT fk_pedido_produto_pedido FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido),
    CONSTRAINT fk_pedido_produto_produto FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

-- ESTOQUE
CREATE TABLE Estoque(
    idEstoque INT auto_increment PRIMARY KEY,
    Local VARCHAR(45)
);

-- PRODUTOS EM ESTOQUE
CREATE TABLE ProdutosEstoque(
    Produto_idProduto INT,
    Estoque_idEstoque INT,
    Quantidade FLOAT,
    PRIMARY KEY (Produto_idProduto, Estoque_idEstoque),
    CONSTRAINT fk_produto_estoque_produto FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
    CONSTRAINT fk_produto_estoque_estoque FOREIGN KEY (Estoque_idEstoque) REFERENCES Estoque(idEstoque)
);

-- FORNECEDOR
CREATE TABLE Fornecedor(
    idFornecedor INT auto_increment PRIMARY KEY,
    RazaoSocial VARCHAR(45),
    CPF_CNPJ VARCHAR(18),
    CONSTRAINT unique_fornecedor_cpf_cnpj UNIQUE (CPF_CNPJ)
);

-- TERCEIRO (VENDEDOR)
CREATE TABLE Terceiro(
    idTerceiro INT auto_increment PRIMARY KEY,
    RazaoSocial VARCHAR(45),
    Local VARCHAR(45),
    CPF_CNPJ VARCHAR(18),
    CONSTRAINT unique_terceiro_cpf_cnpj UNIQUE (CPF_CNPJ)
);

-- PRODUTOS EM ESTOQUE (FORNECEDOR)
CREATE TABLE ProdutosEstoqueFornecedor(
    Fornecedor_idFornecedor INT,
    Produto_idProduto INT,
    Quantidade FLOAT,
    PRIMARY KEY (Fornecedor_idFornecedor, Produto_idProduto),
    CONSTRAINT fk_produto_fornecedor FOREIGN KEY (Fornecedor_idFornecedor) REFERENCES Fornecedor(idFornecedor),
    CONSTRAINT fk_produto_estoque_produto_fornecedor FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);
