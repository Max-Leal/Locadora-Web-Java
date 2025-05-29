Banco de dados

create database db_locadora;
use db_locadora;

create table tb_clientes (
id int primary key auto_increment,
nome varchar(100),
email varchar(300),
fone varchar(200)
);

create table tb_veiculos(
id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10),
    marca VARCHAR(50),
    modelo VARCHAR(50),
    ano INT,
    preco_diaria DECIMAL(10,2)
);

create table tb_locacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_veiculo INT,
    data_inicio DATE,
    data_fim DATE,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id),
    FOREIGN KEY (id_veiculo) REFERENCES tb_veiculos(id)
);
