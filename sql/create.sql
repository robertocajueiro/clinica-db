create table paciente (
	idpaciente serial primary key,
	nome varchar(100) not null,
	cpf varchar(14) not null unique
);

create table medico (
	idmedico serial primary key,
	nome varchar(100) not null,
	cpf varchar(14) not null unique,
	crm varchar(20) not null unique
);

create table especialidade (
	idespecialidade serial primary key,
	nome varchar(100) not null
);

create table medico_especialidade (
	idmedico int not null references medico(idmedico) on delete cascade,
	idespecialidade int not null references especialidade(idespecialidade) on delete cascade,
	primary key(idmedico, idespecialidade)
);

create table consulta (
	idconsulta serial primary key,
	idmedico int not null references medico(idmedico) on delete cascade,
	idpaciente int not null references paciente(idpaciente) on delete cascade,
	data DATE not null,
	hora TIME not null,
	status varchar(20) not null check(status in ('AGENDADA', 'REALIZADA', 'CANCELADA'))
);
