## Banco de Dados

Abaixo estão os comandos SQL para criar o banco de dados e as tabelas necessárias para o sistema da LocadoraWeb.

```sql
-- Criação do banco de dados
CREATE DATABASE db_locadora;
USE db_locadora;

-- Tabela de Clientes
CREATE TABLE tb_clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(300),
    fone VARCHAR(200)
);

-- Tabela de Veículos
CREATE TABLE tb_veiculos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10),
    marca VARCHAR(50),
    modelo VARCHAR(50),
    ano INT,
    preco_diaria DECIMAL(10,2)
);

-- Tabela de Locações
CREATE TABLE tb_locacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_veiculo INT,
    data_inicio DATE,
    data_fim DATE,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id),
    FOREIGN KEY (id_veiculo) REFERENCES tb_veiculos(id)
);
```

> **Observação:**  
> Certifique-se de executar os comandos acima em seu gerenciador de banco de dados MySQL antes de iniciar a aplicação.

