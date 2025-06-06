-- ========================================
-- Inserindo pacientes
-- ========================================
INSERT INTO paciente (nome, cpf) VALUES
('João da Silva', '111.111.111-11'),
('Maria Oliveira', '222.222.222-22');

-- ========================================
-- Inserindo médicos
-- ========================================
INSERT INTO medico (nome, cpf, crm) VALUES
('Dr. Carlos Mendes', '333.333.333-33', 'CRM001'),
('Dra. Ana Paula', '444.444.444-44', 'CRM002');

-- ========================================
-- Inserindo especialidades
-- ========================================
INSERT INTO especialidade (nome) VALUES
('Cardiologia'),
('Dermatologia'),
('Ortopedia');

-- ========================================
-- Vinculando médicos às especialidades
-- ========================================
INSERT INTO medico_especialidade (idmedico, idespecialidade) VALUES
(1, 1),  -- Dr. Carlos → Cardiologia
(1, 3),  -- Dr. Carlos → Ortopedia
(2, 2);  -- Dra. Ana → Dermatologia

-- ========================================
-- Inserindo consultas válidas para testar
-- ========================================
-- Dr. Carlos com João da Silva em 2025-06-15
INSERT INTO consulta (idmedico, idpaciente, data, hora, status)
VALUES (1, 1, '2025-06-15', '08:00', 'AGENDADA');

-- Dr. Carlos com Maria Oliveira em 2025-06-15
INSERT INTO consulta (idmedico, idpaciente, data, hora, status)
VALUES (1, 2, '2025-06-15', '09:00', 'AGENDADA');

-- Dra. Ana com João da Silva em 2025-06-15
INSERT INTO consulta (idmedico, idpaciente, data, hora, status)
VALUES (2, 1, '2025-06-15', '10:00', 'AGENDADA');

-- Dr. Carlos com João da Silva em outra data
INSERT INTO consulta (idmedico, idpaciente, data, hora, status)
VALUES (1, 1, '2025-06-16', '08:00', 'AGENDADA');

/*
Testes para validar as regras (devem falhar)
❗ Exceder 4 consultas por médico no mesmo dia:
*/
-- 3ª consulta no mesmo dia
INSERT INTO consulta (idmedico, idpaciente, data, hora, status)
VALUES (1, 2, '2025-06-15', '11:00', 'AGENDADA');

-- 4ª consulta no mesmo dia
INSERT INTO consulta (idmedico, idpaciente, data, hora, status)
VALUES (1, 2, '2025-06-15', '12:00', 'AGENDADA');

-- 5ª consulta no mesmo dia → deve falhar!
INSERT INTO consulta (idmedico, idpaciente, data, hora, status)
VALUES (1, 2, '2025-06-15', '13:00', 'AGENDADA');


--Mesmo paciente tentando agendar com mesmo médico no mesmo dia:
-- Já existe consulta com João e Dr. Carlos em 2025-06-15
-- Isso aqui deve falhar:
INSERT INTO consulta (idmedico, idpaciente, data, hora, status)
VALUES (1, 1, '2025-06-15', '14:00', 'AGENDADA');

