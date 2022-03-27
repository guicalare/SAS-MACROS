/*https://www.rosettacode.org/wiki/Geohash*/

proc fcmp outlib=sasuser.userfuncs.geo;

	FUNCTION geohash(longitude, latitude, level) $;

		/*

		Descripcion:
		------------

		Funcion que dada unas coordenadas y un nivel de geohash retorna el correspondiente geohash

		Condicion:
		----------

			* Level solo puede tomar valores entre 1 y 12, ambos incluidos

		Input:
		------

			* [FLOAT]  longitude: longitud
			* [FLOAT]  latitude: latitud
			* [INT]    level: nivel de geohash deseado

		Retorna:
		--------
		
			* [STRING] geohash

		Ejemplo:
		--------

		data a;
		
			geohash_value = geohash(-103.415962, 20.644275, 12);

		run;

		*/

		latmin = -90;
		latmax = 90;
		lonmin = -180;
		lonmax = 180;

		length hash_bits $ 60 geohash $ 12 hash_chunck $ 5 hash_char $ 1;

		do i=1 to 5*level;

			if mod(i,2) ^= 1 then do;

				latmid = (latmin + latmax)/2;

				if latitude < latmid then do;
					bit = 0;
					latmax = latmid;
				end;
				else do;
					bit = 1;
					latmin = latmid;				
				end;

				hash_bits = catt(hash_bits, bit);

			end;
			else do;
					
				lonmid = (lonmin + lonmax)/2;

				if longitude < lonmid then do;
					bit = 0;
					lonmax = lonmid;
				end;
				else do;
					bit = 1;
					lonmin = lonmid;				
				end;

				hash_bits = catt(hash_bits, bit);

			end;

		end;

		do j=1 to 5*level by 5;
			
			hash_chunck = substr(hash_bits, j, j+5);
			binary_chunck_value = input(hash_chunck, binary5.);
			hash_char = char('0123456789bcdefghjkmnpqrstuvwxyz', binary_chunck_value + 1);
			geohash = catt(geohash , hash_char);

		end;

		return(geohash);

	endsub;

	SUBROUTINE geohash_extended(longitude, latitude, level, geohash $, bounding_box[*]);

		/*

		Descripcion:
		------------

		Funcion que dada unas coordenadas y un nivel de geohash retorna el correspondiente geohash
		asi como su bounding box mediante parametros por referencia.

		Condicion:
		----------

			* Level solo puede tomar valores entre 1 y 12, ambos incluidos

		Input:
		------

			* [FLOAT]       longitude: longitud
			* [FLOAT]       latitude: latitud
			* [INT]         level: nivel de geohash deseado
			* [STRING]      geohash: geohash resultante [PARAMETRO POR REFERENCIA]
			* [FLOAT ARRAY] bounding_box: bounding box del geohash [PARAMETRO POR REFERENCIA]

		Retorna por referencia:
		-----------------------
		
			* [STRING]      geohash
			* [FLOAT ARRAY] bounding_box: [latmin, latmax, lonmin, lonmax]

		Ejemplo:
		--------

		data a;
		
			array bounding_box[4] latmin latmax lonmin lonmax;
			length geohash $ 12;
			
			call geohash_extended(-103.415962, 20.644275, 12, geohash, bounding_box);

		run;

		*/

		outargs geohash, bounding_box;

		latmin = -90;
		latmax = 90;
		lonmin = -180;
		lonmax = 180;

		length hash_bits $ 60 geohash $ 12 hash_chunck $ 5 hash_char $ 1;

		do i=1 to 5*level;

			if mod(i,2) ^= 1 then do;

				latmid = (latmin + latmax)/2;

				if latitude < latmid then do;
					bit = 0;
					latmax = latmid;
				end;
				else do;
					bit = 1;
					latmin = latmid;				
				end;

				hash_bits = catt(hash_bits, bit);

			end;
			else do;
					
				lonmid = (lonmin + lonmax)/2;

				if longitude < lonmid then do;
					bit = 0;
					lonmax = lonmid;
				end;
				else do;
					bit = 1;
					lonmin = lonmid;				
				end;

				hash_bits = catt(hash_bits, bit);

			end;

		end;

		do j=1 to 5*level by 5;
			
			hash_chunck = substr(hash_bits, j, j+5);
			binary_chunck_value = input(hash_chunck, binary5.);
			hash_char = char('0123456789bcdefghjkmnpqrstuvwxyz', binary_chunck_value + 1);
			geohash = catt(geohash , hash_char);

		end;

		bounding_box[1] = latmin;
		bounding_box[2] = latmax;
		bounding_box[3] = lonmin;
		bounding_box[4] = lonmax;

	endsub;
	
	SUBROUTINE geohash_neibours(bounding_box[*], neighbours[*] $, level);

		/*

		Descripcion:
		------------

		Funcion que dado un bounding box de un geohash retorna todos los 8 vecinos del geohash

		Condicion:
		----------

			* Level solo puede tomar valores entre 1 y 12, ambos incluidos

		Input:
		------

			* [FLOAT ARRAY]  bounding_box: bounding box del geohash
			* [STRING ARRAY] neighbours: array donde de almacenaran los vecinos cercanos [PARAMETRO POR REFERENCIA]
			* [INT]          level: nivel de geohash deseado


		Retorna por referencia:
		-----------------------
		
			* [STRING ARRAY] neighbours [N_neighbours, S_neighbours, O_neighbours, E_neighbours, NE_neighbours, SE_neighbours, NO_neighbours, SO_neighbours]

		Ejemplo:
		--------

		data a;
		
			array bounding_box[4] latmin latmax lonmin lonmax;
			array neighbours[8] $ N_neighbours S_neighbours O_neighbours E_neighbours NE_neighbours SE_neighbours NO_neighbours SO_neighbours;
			length geohash $ 5;
			
			call geohash_extended(-103.415962, 20.644275, 5, geohash, bounding_box);
			call geohash_neibours(bounding_box, neighbours, 5);

		run;

		*/

		outargs neighbours;

		latmin = bounding_box[1];
		latmax = bounding_box[2];
		lonmin = bounding_box[3];
		lonmax = bounding_box[4];

		latdif = abs(abs(latmax) - abs(latmin));
		londif = abs(abs(lonmax) - abs(lonmin));

		latmid = (latmin + latmax)/2;
		lonmid = (lonmin + lonmax)/2;

		neighbours[1] = geohash(lonmid, latmid + latdif, level); 			
		neighbours[2] = geohash(lonmid, latmid - latdif, level); 			
		neighbours[3] = geohash(lonmid - londif, latmid, level); 			
		neighbours[4] = geohash(lonmid + londif, latmid, level); 			
		neighbours[5] = geohash(lonmid + londif, latmid + latdif, level); 
		neighbours[6] = geohash(lonmid - londif, latmid + latdif, level); 
		neighbours[7] = geohash(lonmid + londif, latmid - latdif, level); 
		neighbours[8] = geohash(lonmid - londif, latmid - latdif, level); 

	endsub;

	FUNCTION different_root_regions(geohash_1 $, geohash_2 $);

		/*

		Descripcion:
		------------

		Funcion que dados dos geohashs determina si estan o no en diferentes regiones de nivel 1

		Condicion:
		----------

			* geohash_1 y geohash_2 tienen que tener un valor distinto a vacio

		Input:
		------

			* [STRING] geohash_1: boundinggeohash 1 a comparar
			* [STRING] geohash_2: boundinggeohash 2 a comparar

		Retorna:
		--------
		
			* [INT] 0 si estan en diferentes regiones de nivel 1, 1 en caso contratio

		Ejemplo:
		--------

		data a;
		
			array bounding_box[4] latmin latmax lonmin lonmax;
			array neighbours[8] $ N_neighbours S_neighbours O_neighbours E_neighbours NE_neighbours SE_neighbours NO_neighbours SO_neighbours;
			length geohash $ 5;
			
			call geohash_extended(-103.415962, 20.644275, 5, geohash, bounding_box);
			call geohash_neibours(bounding_box, neighbours, 5);

			different_neibours = different_neibours(geohash , neighbours);

			different_regions = different_root_regions(N_neighbours, S_neighbours);

		run;

		*/

		return(substr(geohash_1, 1, 1) ^= substr(geohash_2, 1, 1));
	endsub;
	
	FUNCTION different_neibours(primary_hash $, neighbours[*] $);

		/*

		Descripcion:
		------------

		Funcion que dados los 8 vecinos de un geohash, detecta si existen vecinos en diferentes regiones de nivel 1

		Condicion:
		----------

			* Ninguna

		Input:
		------

			* [STRING]       primary_hash: geohash central
			* [STRING ARRAY] neighbours: array que contenga los 8 vecinos que rodean al primary_hash

		Retorna:
		--------
		
			* [INT] 0 si todos los vecinos estan en la misma region a nivel 1 que el primary_hash, 1 en caso contrario

		Ejemplo:
		--------

		data a;
		
			array bounding_box[4] latmin latmax lonmin lonmax;
			array neighbours[8] $ N_neighbours S_neighbours O_neighbours E_neighbours NE_neighbours SE_neighbours NO_neighbours SO_neighbours;
			length geohash $ 5;
			
			call geohash_extended(-103.415962, 20.644275, 5, geohash, bounding_box);
			call geohash_neibours(bounding_box, neighbours, 5);

			different_neibours = different_neibours(geohash , neighbours);

		run;

		*/

		distintos = 0;

		do i=1 to 8;
			if substr(neighbours[i], 1, 1) = substr(primary_hash, 1, 1) then distintos = 1;
		end;

		return(distintos);
	
	endsub;

	FUNCTION bounding_box_square_area(bounding_box [*]);

		/*

		Descripcion:
		------------

		Funcion que dado el bounding box de un geohash, retorna el area del mismo en kilometros cuadrados

		Condicion:
		----------

			* Ninguna

		Input:
		------

			* [FLOAT ARRAY] bounding_box: bounding box del geohash

		Retorna:
		--------
		
			* [FLOAT] area en kilometros cuadrados

		Ejemplo:
		--------

		data a;
		
			array bounding_box[4] latmin latmax lonmin lonmax;
			array neighbours[8] $ N_neighbours S_neighbours O_neighbours E_neighbours NE_neighbours SE_neighbours NO_neighbours SO_neighbours;
			length geohash $ 5;
			
			call geohash_extended(-103.415962, 20.644275, 5, geohash, bounding_box);
			call geohash_neibours(bounding_box, neighbours, 5);

			different_neibours = different_neibours(geohash , neighbours);

			area_K_2 = bounding_box_square_area(bounding_box);

		run;

		*/

		latmin = bounding_box[1];
		latmax = bounding_box[2];
		lonmin = bounding_box[3];
		lonmax = bounding_box[4];

		area = geodist(latmin, lonmax, latmax, lonmax, "K") * geodist(latmax, lonmin, latmax, lonmax, "K");

		return(area);

	endsub;

	FUNCTION geohash_match(geohash_1 $, geohash_2 $);

		/*

		Descripcion:
		------------

		Funcion que dados dos geohashs determina cuantos niveles tienen en comun

		Condicion:
		----------

			* geohash_1 y geohash_2 tienen que tener un valor distinto a vacio

		Input:
		------

			* [STRING] geohash_1: geohash 1 a comparar
			* [STRING] geohash_2: geohash 2 a comparar

		Retorna:
		--------
		
			* [INT] numero de niveles que tienen en comun

		Ejemplo:
		--------

		data a;
		
			array bounding_box[4] latmin latmax lonmin lonmax;
			array neighbours[8] $ N_neighbours S_neighbours O_neighbours E_neighbours NE_neighbours SE_neighbours NO_neighbours SO_neighbours;
			length geohash $ 5;
			
			call geohash_extended(-103.415962, 20.644275, 5, geohash, bounding_box);
			call geohash_neibours(bounding_box, neighbours, 5);

			common_levels = geohash_match(geohash , neighbours);

		run;

		*/

		iters = max(length(geohash_1), length(geohash_2));
		cont = 0;

		do i=0 to iters by 1;
			if substr(geohash_1, i, i) = substr(geohash_2, i, i) then cont = cont + 1;
			else do;
				goto break;
			end;
		end;

		break: ;

		return(cont-1);

	endsub;

run;

%macro geohas_encode(ddbb_input, longitude, latitude, geohash_length, geohash_variable_name, ddbb_output);

	data &ddbb_output;

		set &ddbb_input;

		latmin = -90;
		latmax = 90;
		lonmin = -180;
		lonmax = 180;

		hash_length = &geohash_length;

		length hash_bits $ %eval(5*&geohash_length) &geohash_variable_name $ &geohash_length;

		do i=1 to hash_length*5;

			if mod(i,2) ^= 1 then do;

				latmid = (latmin + latmax)/2;

				if &latitude < latmid then do;
					bit = 0;
					latmax = latmid;
				end;
				else do;
					bit = 1;
					latmin = latmid;				
				end;

				hash_bits = catt(hash_bits, bit);

			end;
			else do;
					
				lonmid = (lonmin + lonmax)/2;

				if &longitude < lonmid then do;
					bit = 0;
					lonmax = lonmid;
				end;
				else do;
					bit = 1;
					lonmin = lonmid;				
				end;

				hash_bits = catt(hash_bits, bit);

			end;
		end;

		do j=1 to hash_length*5 by 5;
			
			hash_chunck = substr(hash_bits, j, j+5);
			binary_chunck_value = input(hash_chunck, binary5.);
			hash_char = char('0123456789bcdefghjkmnpqrstuvwxyz', binary_chunck_value + 1);
			&geohash_variable_name = catt( &geohash_variable_name , hash_char);
		end;
		
		area_K_2 = geodist(latmin, lonmax, latmax, lonmax, "K") * geodist(latmax, lonmin, latmax, lonmax, "K");

		latdif = abs(abs(latmax) - abs(latmin));
		londif = abs(abs(lonmax) - abs(lonmin));

		latmid = (latmin + latmax)/2;
		lonmid = (lonmin + lonmax)/2;

		N_neighbours = geohash_&geohash_length.(lonmid, latmid + latdif);
		S_neighbours = geohash_&geohash_length.(lonmid, latmid - latdif);
		O_neighbours = geohash_&geohash_length.(lonmid - londif, latmid);
		E_neighbours = geohash_&geohash_length.(lonmid + londif, latmid);
		NE_neighbours = geohash_&geohash_length.(lonmid + londif, latmid + latdif);
		SE_neighbours = geohash_&geohash_length.(lonmid - londif, latmid + latdif);
		NO_neighbours = geohash_&geohash_length.(lonmid + londif, latmid - latdif);
		SO_neighbours = geohash_&geohash_length.(lonmid - londif, latmid - latdif);

		drop hash_length i j bit hash_chunck binary_chunck_value hash_char;

	run;

%mend;


%macro geohash_conflict_detector(ddbb_input, id, longitude, latitude, precision_detection_level, ddbb_output);

	/*

	Valores recomendados para precision_detection_level [3, 4, 5]. Valores mas pequeños a eso detectaran simpre conflictos de fronteras
	y valores mayores a esos no casi nunca detectaran conflictos de fronteras

	*/

	data &ddbb_output ;

		set &ddbb_input ;

		array bounding_box[4] latmin latmax lonmin lonmax;
		array neighbours[8] $ N_neighbours S_neighbours O_neighbours E_neighbours NE_neighbours SE_neighbours NO_neighbours SO_neighbours;
		length geohash $ &precision_detection_level;
				
		call geohash_extended(&longitude, &latitude, &precision_detection_level , geohash, bounding_box);
		call geohash_neibours(bounding_box, neighbours, &precision_detection_level );

		GEOHASH_COPY = geohash;

		original = 1;

		output;

		do i=1 to 8;

			if different_root_regions(GEOHASH_COPY, neighbours[i]) then do;
				geohash = neighbours[i];
				original = 0;
				output;
			end;

		end;
	 
		keep &id &longitude &latitude geohash original;

	run;

	data &ddbb_output ;

		set &ddbb_output ;

		length root_level $ 1;

		by &id ;

		if first.&id and last.&id then conflictos = 0;
		else conflictos = 1;

		root_level = substr(geohash, 1, 1);

	run;

	proc sort data=&ddbb_output nodupkey;
		by &id root_level;
	run;

%mend;

/*

EJEMPLO DE CRUCES

options cmplib=sasuser.userfuncs;

data personas;
	input id lat lon;
	/*
		1 Problematico frontera
		2 No problematico frontera
		3 No problematico frontera
	*/
cards;
1 41.278974158895636 0.02544954826825574
2 41.38648604629009 2.182814313226288
3 40.420618786671724 -3.692475003437977
4 44.985104437019146 -0.029573859010554315
;
run;

data puntos_de_interes;
	input id lat lon;
	/*
		1 Punto de interes problematico frontera
		2 Punto de interes problematico frontera
		3 Punto de interes NO problematico frontera
		4 Punto de interes NO problematico frontera
	*/
cards;
1 41.30840475394072 0.049263891649218294
2 41.27522413008717 -0.011118463016714486
3 41.5978538418438 2.3262715627093655
4 40.385800402932915 -3.70389313810108
;
run;

%geohash_conflict_detector(personas, id, lon, lat, 5, personas_2);

data puntos_de_interes_2;

	set puntos_de_interes_2;

	array bounding_box[4] latmin latmax lonmin lonmax;
	array neighbours[8] $ N_neighbours S_neighbours O_neighbours E_neighbours NE_neighbours SE_neighbours NO_neighbours SO_neighbours;
	length geohash $ 5;
			
	call geohash_extended(lon, lat, 5, geohash, bounding_box);

	keep id lat lon geohash;

run;

proc sql;

	create table sin_conflictos as
	select
		T1.id as id_1,
		T1.lat as lat_1,
		T1.lon as lon_1,
		T1.geohash as geohash_1,
		T2.id as id_2,
		T2.lat as lat_2,
		T2.lon as lon_2,
		T2.geohash as geohash_2,
		geohash_match(geohash_1, geohash_2) as match_level
	from personas_2 T1, puntos_de_interes_2 T2
	where T1.conflictos = 0
	group by T1.id
	having match_level = max(match_level);

	create table con_conflictos as
	select
		T1.id as id_1,
		T1.lat as lat_1,
		T1.lon as lon_1,
		T1.geohash as geohash_1,
		T2.id as id_2,
		T2.lat as lat_2,
		T2.lon as lon_2,
		T2.geohash as geohash_2,
		geodist(T1.lat, T1.lon, T2.lat, T2.lon, "K") as distance
	from personas_2 T1, puntos_de_interes_2 T2
	where T1.conflictos = 1
	group by T1.id
	having distance = min(distance);;

quit;

*/
