-- ========================================================
-- Esse script faz duas coisas:
-- 1) Cria a tabela "alunos"
-- 2) Já insere 12 alunos fictícios para testar
-- ========================================================

-- Tabela ALUNOS
-- Cada coluna explicada:
--   id              -> número único gerado automaticamente
--   nome            -> nome do aluno
--   telefone        -> usado para identificar o aluno no WhatsApp
--   email           -> opcional
--   plano           -> Mensal, Trimestral, Semestral, Anual ou Avulsa
--   valor_mensal    -> quanto o aluno paga por mês
--   data_matricula  -> quando o aluno começou
--   data_vencimento -> próxima data de pagamento
--   status          -> ativo, atrasado ou inativo
-- ----------------------------------------------------------
CREATE TABLE alunos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  telefone VARCHAR(20) NOT NULL UNIQUE,
  email VARCHAR(150),
  plano VARCHAR(50) NOT NULL,
  valor_mensal DECIMAL(10,2),
  data_matricula DATE,
  data_vencimento DATE,
  status ENUM('ativo','atrasado','inativo') DEFAULT 'ativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------------------------------------
-- 12 alunos fictícios para teste
-- ----------------------------------------------------------
INSERT INTO alunos (nome, telefone, email, plano, valor_mensal, data_matricula, data_vencimento, status) VALUES
('Maria Silva',       '5511987650001', 'maria.silva@email.com',    'Mensal',     199.00, '2026-05-25', '2026-06-25', 'ativo'),
('João Pereira',      '5511987650002', 'joao.pereira@email.com',   'Trimestral', 169.00, '2026-04-05', '2026-07-05', 'ativo'),
('Ana Souza',         '5511987650003', 'ana.souza@email.com',      'Semestral',  149.00, '2026-02-10', '2026-08-10', 'ativo'),
('Carlos Santos',     '5511987650004', 'carlos.santos@email.com',  'Anual',      129.00, '2026-01-15', '2027-01-15', 'ativo'),
('Beatriz Lima',      '5511987650005', 'beatriz.lima@email.com',   'Avulsa',     30.00,  '2026-06-15', NULL,         'ativo'),
('Pedro Costa',       '5511987650006', 'pedro.costa@email.com',    'Mensal',     199.00, '2026-05-05', '2026-06-05', 'atrasado'),
('Juliana Alves',     '5511987650007', 'juliana.alves@email.com',  'Trimestral', 169.00, '2026-03-01', '2026-06-01', 'atrasado'),
('Rafael Oliveira',   '5511987650008', 'rafael.oliveira@email.com','Semestral',  149.00, '2025-09-01', '2026-03-01', 'inativo'),
('Fernanda Rocha',    '5511987650009', 'fernanda.rocha@email.com', 'Mensal',     199.00, '2026-05-30', '2026-06-30', 'ativo'),
('Lucas Martins',     '5511987650010', 'lucas.martins@email.com',  'Anual',      129.00, '2025-12-20', '2026-12-20', 'ativo'),
('Camila Ferreira',   '5511987650011', 'camila.ferreira@email.com','Trimestral', 169.00, '2026-04-15', '2026-07-15', 'ativo'),
('Gabriel Almeida',   '5511987650012', 'gabriel.almeida@email.com','Mensal',     199.00, '2026-01-10', '2026-02-10', 'inativo');
