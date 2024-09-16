-- Inserção de dados de exemplo para testar o sistema de E-commerce

-- Inserindo clientes
INSERT INTO Cliente (Nome, Endereco, CPF, CNPJ) VALUES
('João Silva', 'Rua Principal, 123', '12345678901', NULL),
('Tech Corp', 'Avenida Industrial, 456', NULL, '12345678000199');

-- Inserindo produtos
INSERT INTO Produto (Categoria, Descricao, Valor) VALUES
('Eletrônicos', 'Smartphone', 1500.00),
('Móveis', 'Sofá', 2000.00);

-- Inserindo estoque
INSERT INTO Estoque (Local) VALUES ('Armazém Central');

-- Inserindo formas de pagamento
INSERT INTO Pagamento (PagamentoCliente, FormaPagamento, Cartao, Bandeira, Numero) VALUES
(1, 'Cartão de Crédito', 'Cartão A', 'VISA', '1234567890123456'),
(2, 'Boleto Bancário', NULL, NULL, NULL);

-- Inserindo informações de entrega
INSERT INTO Entrega (Status, CodigoRastreio, DataEntrega) VALUES
('Enviado', 'TRACK12345', '2024-09-15');

-- Inserindo pedidos
INSERT INTO Pedido (idCliente, Frete, Descricao, Entrega_idEntrega) VALUES
(1, 50.00, 'Compra de Smartphone', 1);

-- Inserindo produtos no pedido
INSERT INTO PedidoProduto (Pedido_idPedido, Produto_idProduto, Quantidade) VALUES
(1, 1, 2);

-- Inserindo produtos no estoque
INSERT INTO ProdutosEstoque (Produto_idProduto, Estoque_idEstoque, Quantidade) VALUES
(1, 1, 100);

-- Inserindo fornecedores
INSERT INTO Fornecedor (RazaoSocial, CPF_CNPJ) VALUES
('Fornecedor A', '12345678000199');

-- Inserindo vendedores (terceiros)
INSERT INTO Terceiro (RazaoSocial, Local, CPF_CNPJ) VALUES
('Vendedor A', 'Loja A', '12345678000299');

-- Inserindo produtos no estoque de fornecedores
INSERT INTO ProdutosEstoqueFornecedor (Fornecedor_idFornecedor, Produto_idProduto, Quantidade) VALUES
(1, 1, 100);
