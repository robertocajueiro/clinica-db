create or replace function verificar_regras_consulta()
returns trigger as $$
begin
	-- medico so pode ter 4 consultas por dia
	if (
		select count(*) from consulta
		where idmedico = new.idmedico and data = new.data
	) >= 4 then
		raise exception 'O medico já possui 4 consultas agendadas para o dia %', new.data;
	end if;

	-- paciente so pode ter 1 consulta com o mesmo medico no mesmo dia
	if exists (
		select 1 from consulta
		where idmedico = new.idmedico
			and idpaciente = new.idmedico
			and idpaciente = new.idpaciente
			and data = new.data
	) then
		raise exception 'O paciente já possui uma consulta agendada com este medico para o dia %', new.data;
	end if;

	return new;
end
$$ language plpgsql;

create trigger tg_verificar_regras_consulta
before insert on consulta
for each row
execute function verificar_regras_consulta();