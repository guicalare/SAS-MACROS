
/*

========================================================================
Macros bases
========================================================================
*/

/* Macro que retorna los nombres de las columnas de una base de datos */

%macro colnames(ddbb);

	%Local VarList ;
	%Let FID = %SysFunc(Open(&ddbb)) ;

	%If &FID %Then %Do ;
		%Do I=1 %To %SysFunc(ATTRN(&FID,NVARS)) ;
			%Let VarList= &VarList %SysFunc(VarName(&FID,&I));
		%End ;
		%Let FID = %SysFunc(Close(&FID)) ;
	%End ;

	&VarList;

%mend;

/* Macro que imprime los elementos de un string dado un separador*/

%macro printlist(texto, sep);

	%do i=1 %to %sysfunc(countw(&texto));
		%put &i %scan(&texto, &i, &sep);
	%end;

%mend;

/* Macro que retorna el numero total de elementos de un string */

%macro range(texto);
	%sysfunc(countw(&texto))
%mend ;

/* Macro que retorna un elemento de un string dada una posicion */

%macro value(vector, posicion);
	%scan(&vector, &posicion, " ");
%mend;

/* Macro para obtener el valor absoluto de un numero */

%macro abs(valor);
	%sysfunc(abs(%eval(&valor)))
%mend;

/* Macro para obtener el numero maximo de una variable */

%macro max(table, column, target);

	%global &target;

	PROC SQL noprint;
	   SELECT MAX(&column) INTO : &target FROM &table;
	QUIT;

%mend;

/* Macro para obtener el numero minimo de una variable */

%macro min(table, column, target);

	%global &target;

	PROC SQL noprint;
	   SELECT MIN(&column) INTO : &target FROM &table;
	QUIT;

%mend;

/* Macro para obtener la suma acumulada de una variable */

%macro sum(table, column, target);

	%global &target;

	PROC SQL noprint;
	   SELECT SUM(&column) INTO : &target FROM &table;
	QUIT;

%mend;

/* Macro para obtener la desviacion estandar de una variable */

%macro std(table, column, target);

	%global &target;

	PROC SQL noprint;
	   SELECT STD(&column) INTO : &target FROM &table;
	QUIT;

%mend;

/*
========================================================================
Macros complejas
========================================================================
*/

/* Macro que genera un mapa de España de calor dada una variable de una base de datos */

%macro custom_spain_map_provinces(base_datos, ID, variable, niveles);

	data temporal (rename = (&ID= ID));
	   set &base_datos;
	run;

	legend1 label =(f="albany amt/bold" position=top j=c h=12pt )
	 value=(f="albany amt" h=10pt c=black tick=3)
	 across=1
	 position=(right middle) 
	 offset=(-2,3)
	 space=1
	 mode=reserve
	 shape=bar(.15in,.15in)
	 ;

	proc gmap map=maps.spain data=temporal all;
	id ID;
	choro &variable / cdefault=gray CEMPTY=gray legend=legend1 coutline=black LEVELS=&niveles;
	run;
	quit;

%mend;

/* Ejemplo */

data aleatorio;
	do provincia = 1 to 52;
	   y =  RAND('UNIFORM')*1000;
	   output;
	end;
run;

%custom_spain_map_provinces(aleatorio, provincia, y, 8);
