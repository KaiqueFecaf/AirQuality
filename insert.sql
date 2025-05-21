INSERT INTO poluentes (nomePoluentes) VALUES ('CO (Monóxido de Carbono)');
INSERT INTO poluentes (nomePoluentes) VALUES ('MP10 (Partículas Inaláveis)');
INSERT INTO poluentes (nomePoluentes) VALUES ('MP2.5 (Partículas Inaláveis Finas)');
INSERT INTO poluentes (nomePoluentes) VALUES ('NO (Monóxido de Nitrogênio)');
INSERT INTO poluentes (nomePoluentes) VALUES ('NO2 (Dióxido de Nitrogênio)');
INSERT INTO poluentes (nomePoluentes) VALUES ('NOx (Óxidos de Nitrogênio)');
INSERT INTO poluentes (nomePoluentes) VALUES ('TEMP (Temperatura do Ar)');
INSERT INTO poluentes (nomePoluentes) VALUES ('UR (Umidade Relativa do Ar)');

-- Municipios
INSERT INTO municipios (nomeMunicipio) VALUES ('São Paulo');
INSERT INTO municipios (nomeMunicipio) VALUES ('Campinas');

-- Estacoes
INSERT INTO estacoes (id, nomeEstacao, municipio_id, latitude, longitude) VALUES (1, 'Ibirapuera', 1, -23.5846, -46.6578);
INSERT INTO estacoes (id, nomeEstacao, municipio_id, latitude, longitude) VALUES (2, 'Taquaral', 2, -22.8700, -47.0577);

-- Medicoes
INSERT INTO medicoes (id, estacao_id, poluente_id, datahora, valor) VALUES (1, 1, 1, '2025-05-20 09:00:00', 0.17);
INSERT INTO medicoes (id, estacao_id, poluente_id, datahora, valor) VALUES (2, 1, 2, '2025-05-20 09:00:00', 42.6);
INSERT INTO medicoes (id, estacao_id, poluente_id, datahora, valor) VALUES (3, 1, 3, '2025-05-20 09:00:00', 24.1);
INSERT INTO medicoes (id, estacao_id, poluente_id, datahora, valor) VALUES (4, 2, 1, '2025-05-20 09:00:00', 0.20);
INSERT INTO medicoes (id, estacao_id, poluente_id, datahora, valor) VALUES (5, 2, 4, '2025-05-20 09:00:00', 0.05);
INSERT INTO medicoes (id, estacao_id, poluente_id, datahora, valor) VALUES (6, 2, 5, '2025-05-20 09:00:00', 0.025);
