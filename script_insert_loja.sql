INSERT INTO usuario (idUsuario, login, senha) 
VALUES (1, 'op1', 'op1');
INSERT INTO usuario (idUsuario, login, senha)
VALUES (2, 'op2', 'op2');

INSERT INTO produto (idProduto, nome, quantidade, precoVenda) 
VALUES (1, 'Banana', 100, 5.00);
INSERT INTO produto (idProduto, nome, quantidade, precoVenda) 
VALUES (3, 'Laranja', 500, 2.00);
INSERT INTO produto (idProduto, nome, quantidade, precoVenda) 
VALUES (4, 'Manga', 800, 4.00);


DECLARE @idPessoaFisica INTEGER;
SET @idPessoaFisica = NEXT VALUE FOR seq_pessoa_id;
INSERT INTO pessoa (idPessoa, nome, logradouro, cidade, estado, telefone, email)
VALUES (@idPessoaFisica, 'Joao', 'Rua 12, casa 3, Quitanda', 'Riacho do Sul', 'PA', '1111-1111', 'joao@riacho.com');
INSERT INTO pessoa_fisica (idPessoaFisica, idPessoa, cpf)
VALUES (@idPessoaFisica, @idPessoaFisica, '123.456.789-10');

DECLARE @idPessoaJuridica INTEGER;
SET @idPessoaJuridica = NEXT VALUE FOR seq_pessoa_id;
INSERT INTO pessoa (idPessoa, nome, logradouro, cidade, estado, telefone, email)
VALUES (@idPessoaJuridica, 'JJC', 'Rua 11, Centro', 'Riacho do Norte', 'PA', '1212-1212', 'jjc@riacho.com');
INSERT INTO pessoa_juridica (idPessoaJuridica, idPessoa, cnpj)
VALUES (@idPessoaJuridica, @idPessoaJuridica, '12.345.678/0001-09');


INSERT INTO movimento (idMovimento, idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario)
VALUES (1, 1, 1, 1, 20, 'S', 4.00);
INSERT INTO movimento (idMovimento, idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario)
VALUES (4, 1, 1, 3, 15, 'S', 2.00);
INSERT INTO movimento (idMovimento, idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario)
VALUES (5, 2, 1, 3, 10, 'S', 3.00);
INSERT INTO movimento (idMovimento, idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario)
VALUES (7, 1, 2, 4, 15, 'E', 5.00);
INSERT INTO movimento (idMovimento, idUsuario, idPessoa, idProduto, quantidade, tipo, valorUnitario)
VALUES (8, 1, 2, 4, 20, 'E', 4.00)