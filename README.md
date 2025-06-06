# Sistema de Consultas Médicas 🏥

Projeto de modelagem e implementação de um sistema de agendamento de consultas em uma clínica médica, com regras de negócio aplicadas no PostgreSQL via trigger.

## 🧩 Entidades

- **Paciente**: nome, CPF
- **Médico**: nome, CPF, CRM
- **Especialidade**: nome
- **Consulta**: data, hora, status
- **Relacionamentos**:
  - médico ↔ especialidade (N:N)
  - médico ↔ consulta (1:N)
  - paciente ↔ consulta (1:N)

## 📄 Regras de Negócio (implementadas via trigger)

- Um **médico pode ter no máximo 4 consultas por dia**
- Um **paciente só pode marcar 1 consulta com o mesmo médico no mesmo dia**

## 📁 Estrutura

clinica-db/
├── sql/
│ ├── 01_create_tables.sql
│ ├── 02_create_trigger.sql
│ └── 03_inserts_teste.sql
├── docs/
│ └── modelo_der.png
├── README.md


## ⚙️ Tecnologias

- PostgreSQL 13
- PL/pgSQL
- GitHub
- VS Code
- Ferramenta de modelagem: brModelo

## 🚀 Como usar

1. Crie o banco de dados `clinica_db`
2. Execute o script `sql/create_tables.sql`
3. Execute `sql/create_trigger.sql`
4. Teste com os comandos do `inserts_teste.sql`
