CREATE SEQUENCE seq_pessoa_id
    START WITH 1
    INCREMENT BY 1
    NO CYCLE;

CREATE TABLE pessoa (
    idPessoa INTEGER PRIMARY KEY DEFAULT NEXT VALUE FOR seq_pessoa_id,
    nome VARCHAR(255) NOT NULL,
    logradouro VARCHAR(255),
    cidade VARCHAR(255),
    estado CHAR(2),
    telefone VARCHAR(11),
    email VARCHAR(255)
);

CREATE TABLE pessoa_fisica (
    idPessoaFisica INTEGER PRIMARY KEY,
    idPessoa INTEGER UNIQUE,
    cpf CHAR(14),
    CONSTRAINT FK_PessoaFisica_Pessoa FOREIGN KEY (idPessoa) REFERENCES Pessoa(idPessoa)
);

CREATE TABLE pessoa_juridica (
    idPessoaJuridica INTEGER PRIMARY KEY,
    idPessoa INTEGER UNIQUE,
    cnpj CHAR(18),
    CONSTRAINT FK_PessoaJuridica_Pessoa FOREIGN KEY (idPessoa) REFERENCES Pessoa(idPessoa)
);

CREATE TABLE produto (
    idProduto INTEGER PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    quantidade INTEGER NOT NULL,
    precoVenda NUMERIC(10, 2)
);

CREATE TABLE usuario (
    idUsuario INTEGER PRIMARY KEY,
    login VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE movimento (
    idMovimento INTEGER PRIMARY KEY,
    idUsuario INTEGER,
    idPessoa INTEGER,
    idProduto INTEGER,
    quantidade INTEGER NOT NULL,
    tipo CHAR(1),
    valorUnitario NUMERIC(10, 2),
    CONSTRAINT FK_Movimento_Usuario FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    CONSTRAINT FK_Movimento_Pessoa FOREIGN KEY (idPessoa) REFERENCES Pessoa(idPessoa),
    CONSTRAINT FK_Movimento_Produto FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);
