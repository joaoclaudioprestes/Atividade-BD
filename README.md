# Atividade - Criação de Modelo Lógico e Código Fonte (SQL) 🛠️

Na atividade em questão, foi proposta a criação de um banco de dados para uma loja, requerendo tanto a construção do modelo lógico quanto a escrita do código fonte necessário para implementá-lo.

---

## Tarefa ✅

1. Analisar o modelo conceitual fornecido.
2. Identificar as entidades, relacionamentos e atributos relevantes.
3. Transformar o modelo conceitual em um modelo lógico, definindo tabelas, chaves primárias, chaves estrangeiras e relacionamentos.
4. Elaborar um documento que represente o modelo lógico desenvolvido.
5. Criar um script do modelo lógico para futura implementação.

---

## Modelo Conceitual 📝

Segue o modelo conceitual fornecido como base para o desenvolvimento da atividade:

![Modelo Conceitual](./img/img-task.png)
**_[Modelo fornecido pelo professor @buenopt](https://github.com/buenopt)_**

---

## Modelo Lógico - Desenvolvido 📊

O modelo lógico foi construído utilizando a aplicação web **_dbdiagram.io_**:

![Modelo Lógico](./img/img-result.svg)
**_[Projeto no dbdiagram.io](https://dbdiagram.io/d/Tarefa-BD-66244d9203593b6b61858f0d)_**

---

## Script 💻

```sql

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

```

---

## Links 🔗

- [dbdiagram.io](https://www.dbdiagram.io/)
- [Projeto no dbdiagram.io](https://dbdiagram.io/d/Tarefa-BD-66244d9203593b6b61858f0d)