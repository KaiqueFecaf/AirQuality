-- Criação do banco de dados se ele ja nao existir
CREATE DATABASE IF NOT EXISTS qualidade_do_ar;

-- Seleção do banco de dados
USE qualidade_do_ar;

-- Tabela para armazenar os municípios ou estações de monitoramento
CREATE TABLE municipios (
                            idMunicipios INT AUTO_INCREMENT PRIMARY KEY,
                            nomeMunicipios VARCHAR(100) NOT NULL,          -- Nome do município ou estação
                            UNIQUE (nomeMunicipios)                        -- Garante que o nome do município seja único
);

-- Tabela para armazenar os poluentes
CREATE TABLE poluentes (
                           idPoluentes INT AUTO_INCREMENT PRIMARY KEY,
                           nomePoluentes VARCHAR(50) NOT NULL,           -- Nome do poluente (CO, NO2, PM10, O3, etc.)
                           UNIQUE (nomePoluentes)                        -- Garante que o nome do poluente seja único
);

-- Tabela para armazenar as medições de qualidade do ar
CREATE TABLE qualidade_do_ar (
                                 idQualidadeAr INT AUTO_INCREMENT PRIMARY KEY, 
                                 municipio_id INT,                     -- Relacionamento com a tabela de municípios
                                 poluente_id INT,                      -- Relacionamento com a tabela de poluentes
                                 valor DECIMAL(5, 2),                  -- Valor medido do poluente
                                 data DATE,                            
                                 hora TIME,                            
                                 FOREIGN KEY (municipio_id) REFERENCES municipios(idMunicipios)  ON DELETE CASCADE,  -- Chave estrangeira para a tabela de municípios
                                 FOREIGN KEY (poluente_id) REFERENCES poluentes(idPoluentes) ON DELETE CASCADE    -- Chave estrangeira para a tabela de poluentes
);

-- Índice para melhorar a desempenho de buscas por município, poluente, data e hora
CREATE INDEX idx_municipio_data ON qualidade_do_ar (municipio_id, data, hora);
CREATE INDEX idx_poluente_data ON qualidade_do_ar (poluente_id, data, hora);

-- Poluentes
INSERT INTO poluentes (nomePoluentes) VALUES ('CO (Monóxido de Carbono)');
INSERT INTO poluentes (nomePoluentes) VALUES ('MP10 (Partículas Inaláveis)');
INSERT INTO poluentes (nomePoluentes) VALUES ('MP2.5 (Partículas Inaláveis Finas)');
INSERT INTO poluentes (nomePoluentes) VALUES ('NO (Monóxido de Nitrogênio)');
INSERT INTO poluentes (nomePoluentes) VALUES ('NO2 (Dióxido de Nitrogênio)');
INSERT INTO poluentes (nomePoluentes) VALUES ('NOx (Óxidos de Nitrogênio)');
INSERT INTO poluentes (nomePoluentes) VALUES ('TEMP (Temperatura do Ar)');
INSERT INTO poluentes (nomePoluentes) VALUES ('UR (Umidade Relativa do Ar)');

-- Municipios 
INSERT INTO municipios (nomeMunicipios) VALUES ('Osasco');
INSERT INTO municipios (nomeMunicipios) VALUES ('Campinas');
INSERT INTO municipios (nomeMunicipios) VALUES ('Campo Grande');
INSERT INTO municipios (nomeMunicipios) VALUES ('Idaiatuba');
INSERT INTO municipios (nomeMunicipios) VALUES ('Santos');

-- Qualidade do Ar
INSERT INTO qualidade_do_ar (municipio_id, poluente_id, valor, data, hora) VALUES
  (1, 1, 5.20, '2025-05-11', '08:00:00'),
  (2, 2, 18.30, '2025-05-11', '09:00:00'),
  (3, 3, 12.75, '2025-05-11', '10:00:00'),
  (4, 4, 7.10, '2025-05-11', '11:00:00'),
  (5, 5, 24.60, '2025-05-11', '12:00:00'),
  (1, 6, 19.80, '2025-05-12', '08:00:00'),
  (2, 7, 22.50, '2025-05-12', '09:00:00'),
  (3, 8, 47.00, '2025-05-12', '10:00:00'),
  (4, 1, 3.50, '2025-05-12', '11:00:00'),
  (5, 2, 14.90, '2025-05-12', '12:00:00');
