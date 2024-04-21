CREATE DATABASE Mercadao;

GO USE Mercadao;

GO
CREATE TABLE
  Fornecedor (
    codigo INT IDENTITY (1, 1) PRIMARY KEY,
    nome VARCHAR(50),
    cnpj VARCHAR(14),
    endereco VARCHAR(100)
  );

GO
CREATE TABLE
  Produto (
    codigo INT IDENTITY (1, 1) PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(150)
  );

GO
CREATE TABLE
  Fornecedor_Produto (
    cod_fornecedor INT FOREIGN KEY REFERENCES Fornecedor (codigo),
    cod_produto INT FOREIGN KEY REFERENCES Produto (codigo)
  );

GO
CREATE TABLE
  Loja (
    codigo INT IDENTITY (1, 1) PRIMARY KEY,
    nome VARCHAR(50),
    cnpj VARCHAR(14)
  );

GO
CREATE TABLE
  Cliente (
    codigo INT IDENTITY (1, 1) PRIMARY KEY,
    nome VARCHAR(50),
    endereco VARCHAR(100)
  );

GO
CREATE TABLE
  Venda (
    num_nfiscal VARCHAR(44) PRIMARY KEY,
    data DATE,
    valor_total FLOAT,
    cod_loja INT FOREIGN KEY REFERENCES Loja (codigo),
    cod_cliente INT FOREIGN KEY REFERENCES Cliente (codigo)
  );

GO
CREATE TABLE
  Produto_Venda (
    cod_produto INT FOREIGN KEY REFERENCES Produto (codigo),
    num_nfiscal VARCHAR(44) FOREIGN KEY REFERENCES Venda (num_nfiscal),
    valor_total FLOAT,
    cod_loja INT FOREIGN KEY REFERENCES Loja (codigo),
    cod_cliente INT FOREIGN KEY REFERENCES Cliente (codigo)
  );