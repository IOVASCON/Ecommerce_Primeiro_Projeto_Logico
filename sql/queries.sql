-- Consultas para recuperar informações do sistema de E-commerce

-- Recuperar todos os clientes
SELECT * FROM Cliente;

-- Recuperar todos os produtos
SELECT * FROM Produto;

-- Recuperar todos os pedidos com informações de clientes e produtos
SELECT Pedido.idPedido, Cliente.Nome, Produto.Descricao, PedidoProduto.Quantidade
FROM Pedido
JOIN Cliente ON Pedido.idCliente = Cliente.idCliente
JOIN PedidoProduto ON Pedido.idPedido = PedidoProduto.Pedido_idPedido
JOIN Produto ON PedidoProduto.Produto_idProduto = Produto.idProduto;

-- Recuperar informações de estoque dos produtos
SELECT Produto.Descricao, ProdutosEstoque.Quantidade, Estoque.Local
FROM ProdutosEstoque
JOIN Produto ON ProdutosEstoque.Produto_idProduto = Produto.idProduto
JOIN Estoque ON ProdutosEstoque.Estoque_idEstoque = Estoque.idEstoque;

-- Recuperar todas as formas de pagamento
SELECT * FROM Pagamento;

-- Recuperar todas as entregas com status
SELECT * FROM Entrega;
