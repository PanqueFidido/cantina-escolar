
-- CRIAÇÃO DO BANCO E TABELAS
CREATE DATABASE IF NOT EXISTS cantina_escolar;
USE cantina_escolar;

CREATE TABLE clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(80) NOT NULL
);

CREATE TABLE produtos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(80) NOT NULL,
  preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE vendas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  data_venda DATE NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE itens_venda (
  id INT AUTO_INCREMENT PRIMARY KEY,
  venda_id INT NOT NULL,
  produto_id INT NOT NULL,
  quantidade INT NOT NULL,
  FOREIGN KEY (venda_id) REFERENCES vendas(id),
  FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Inserindo clientes
INSERT INTO clientes (nome) VALUES
('Ana Silva'),
('Bruno Santos'),
('Carlos Pereira');

-- Inserindo produtos
INSERT INTO produtos (nome, preco) VALUES
('Coxinha', 7.50),
('Pastel', 8.00),
('Suco', 5.00),
('Refrigerante', 6.00),
('Sanduíche', 12.00);

-- Inserindo vendas
INSERT INTO vendas (cliente_id, data_venda) VALUES
(1, '2025-11-01'),
(2, '2025-11-02');

-- Inserindo itens de venda
INSERT INTO itens_venda (venda_id, produto_id, quantidade) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 5, 1),
(2, 4, 2);

-- Atualizar preço de um produto
UPDATE produtos
SET preco = 13.50
WHERE nome = 'Sanduíche';

-- Corrigir nome de um cliente
UPDATE clientes
SET nome = 'Ana Paula Silva'
WHERE id = 1;

-- Excluir um item de venda
DELETE FROM itens_venda
WHERE id = 2;

-- 1. Listar todos os produtos
SELECT * FROM produtos;

-- 2. Listar produtos com preço maior que 10
SELECT * FROM produtos
WHERE preco > 10;

-- 3. Listar clientes pelo nome (LIKE)
SELECT * FROM clientes
WHERE nome LIKE '%Silva%';

-- 4. Listar vendas com nome do cliente (JOIN)
SELECT v.id AS venda_id, c.nome AS cliente, v.data_venda
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id;

-- 5. Listar itens da venda com cliente, produto e quantidade (JOIN)
SELECT 
  c.nome AS cliente,
  p.nome AS produto,
  iv.quantidade
FROM itens_venda iv
JOIN vendas v ON iv.venda_id = v.id
JOIN clientes c ON v.cliente_id = c.id
JOIN produtos p ON iv.produto_id = p.id;

-- CONEXÃO COM O BANCO 
SELECT VERSION();
SELECT DATABASE();
