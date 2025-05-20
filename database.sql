CREATE DATABASE qualidade_do_ar;

USE qualidade_do_ar;

CREATE TABLE municipios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE poluentes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE qualidade_do_ar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    municipio_id INT,
    poluente_id INT,
    valor DECIMAL(5, 2),
    data DATE,
    hora TIME,
    FOREIGN KEY (municipio_id) REFERENCES municipios(id),
    FOREIGN KEY (poluente_id) REFERENCES poluentes(id)
);
