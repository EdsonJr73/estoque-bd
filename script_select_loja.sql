SELECT 
    p.idPessoa,
    p.nome,
    p.logradouro,
    p.cidade,
    p.estado,
    p.telefone,
    p.email,
    pf.cpf
FROM pessoa p
JOIN pessoa_fisica pf ON p.idPessoa = pf.idPessoa;

SELECT 
    p.idPessoa,
    p.nome,
    p.logradouro,
    p.cidade,
    p.estado,
    p.telefone,
    p.email,
    pj.cnpj
FROM pessoa p
JOIN pessoa_juridica pj ON p.idPessoa = pj.idPessoa;

SELECT 
    m.idMovimento,
    p.nome AS fornecedor,
    pr.nome AS produto,
    m.quantidade,
    m.valorUnitario,
    (m.quantidade * m.valorUnitario) AS valorTotal
FROM movimento m
JOIN pessoa p ON m.idPessoa = p.idPessoa
JOIN pessoa_juridica pj ON p.idPessoa = pj.idPessoa
JOIN produto pr ON m.idProduto = pr.idProduto
WHERE m.tipo = 'E';

SELECT 
    m.idMovimento,
    p.nome AS comprador,
    pr.nome AS produto,
    m.quantidade,
    m.valorUnitario,
    (m.quantidade * m.valorUnitario) AS valorTotal
FROM movimento m
JOIN pessoa p ON m.idPessoa = p.idPessoa
JOIN pessoa_fisica pf ON p.idPessoa = pf.idPessoa
JOIN produto pr ON m.idProduto = pr.idProduto
WHERE m.tipo = 'S';

SELECT 
    pr.nome AS produto,
    SUM(m.quantidade * m.valorUnitario) AS valorTotalEntradas
FROM movimento m
JOIN produto pr ON m.idProduto = pr.idProduto
WHERE m.tipo = 'E'
GROUP BY pr.nome;

SELECT 
    pr.nome AS produto,
    SUM(m.quantidade * m.valorUnitario) AS valorTotalSaidas
FROM movimento m
JOIN produto pr ON m.idProduto = pr.idProduto
WHERE m.tipo = 'S'
GROUP BY pr.nome;

SELECT u.idUsuario, u.login
FROM usuario u
WHERE u.idUsuario NOT IN (
    SELECT m.idUsuario 
    FROM movimento m
    WHERE m.tipo = 'E'
);

SELECT 
    u.login AS operador,
    SUM(m.quantidade * m.valorUnitario) AS valorTotalEntradas
FROM movimento m
JOIN usuario u ON m.idUsuario = u.idUsuario
WHERE m.tipo = 'E'
GROUP BY u.login;

SELECT 
    u.login AS operador,
    SUM(m.quantidade * m.valorUnitario) AS valorTotalSaidas
FROM movimento m
JOIN usuario u ON m.idUsuario = u.idUsuario
WHERE m.tipo = 'S'
GROUP BY u.login;

SELECT 
    pr.nome AS produto,
    SUM(m.quantidade * m.valorUnitario) / SUM(m.quantidade) AS valorMedioVenda
FROM movimento m
JOIN produto pr ON m.idProduto = pr.idProduto
WHERE m.tipo = 'S'
GROUP BY pr.nome;