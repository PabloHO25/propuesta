

create  or replace function insert_alerta_corrida( p_ruta character, p_id_corrida integer, p_deep numeric , p_alerta integer, p_fecha date, p_hora time, p_des character, p_actividad integer, p_usuario integer ) 
	returns integer
	language plpgsql
	as $$
	 


declare  exis_corrida integer;
	declare new_corrida integer;
	declare new_imagen integer;
	declare new_id_alerta integer;

	begin 
	
	insert into imagen values (p_ruta) returning id into new_imagen;

	insert into t_alertas (alerta, imagen, hora, fecha, profundidad, id_corrida, descripcion, id_actividad, id_usuario) values 	(p_alerta, new_imagen, p_hora, p_fecha, p_deep, p_id_corrida, p_des, p_actividad, p_usuario) returning id into new_id_alerta;

	return  new_id_alerta;
	

	end;
	
	$$;
	
