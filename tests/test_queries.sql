-- Teste de consultas SQL para verificar se os dados estão corretos

-- Recuperar todos os clientes cadastrados
SELECT * FROM Cliente;

-- Recuperar informações de pedidos, produtos e quantidades
SELECT Pedido.idPedido, Cliente.Nome, Produto.Descricao, PedidoProduto.Quantidade
FROM Pedido
JOIN Cliente ON Pedido.idCliente = Cliente.idCliente
JOIN PedidoProduto ON Pedido.idPedido = PedidoProduto.Pedido_idPedido
JOIN Produto ON PedidoProduto.Produto_idProduto = Produto.idProduto;
