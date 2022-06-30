CREATE TABLE Produtos (
    Referencia VARCHAR(3) PRIMARY KEY,
    Descricao VARCHAR(50) UNIQUE,
    Estoque INT NOT NULL DEFAULT 0
);

CREATE TABLE ItensVenda (
    Venda INT,
    Produto VARCHAR(3),
    Quantidade INT
);