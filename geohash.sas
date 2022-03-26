proc fcmp outlib=sasuser.userfuncs.geo;

	FUNCTION geohash_1(longitude, latitude) $;

		latmin = -90;
		latmax = 90;
		lonmin = -180;
		lonmax = 180;

		length hash_bits $ 5 geohash $ 1 hash_chunck $ 5 hash_char $ 1;

		do i=1 to 5;

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

		do j=1 to 5 by 5;
			
			hash_chunck = substr(hash_bits, j, j+5);
			binary_chunck_value = input(hash_chunck, binary5.);
			hash_char = char('0123456789bcdefghjkmnpqrstuvwxyz', binary_chunck_value + 1);
			geohash = catt(geohash , hash_char);
		end;

		return(geohash);

	endsub;

	FUNCTION geohash_2(longitude, latitude) $;

		latmin = -90;
		latmax = 90;
		lonmin = -180;
		lonmax = 180;

		length hash_bits $ 10 geohash $ 2 hash_chunck $ 5 hash_char $ 1;

		do i=1 to 10;

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

		do j=1 to 10 by 5;
			
			hash_chunck = substr(hash_bits, j, j+5);
			binary_chunck_value = input(hash_chunck, binary5.);
			hash_char = char('0123456789bcdefghjkmnpqrstuvwxyz', binary_chunck_value + 1);
			geohash = catt(geohash , hash_char);
		end;

		return(geohash);

	endsub;

	FUNCTION geohash_3(longitude, latitude) $;

		latmin = -90;
		latmax = 90;
		lonmin = -180;
		lonmax = 180;

		length hash_bits $ 15 geohash $ 3 hash_chunck $ 5 hash_char $ 1;

		do i=1 to 15;

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

		do j=1 to 15 by 5;
			
			hash_chunck = substr(hash_bits, j, j+5);
			binary_chunck_value = input(hash_chunck, binary5.);
			hash_char = char('0123456789bcdefghjkmnpqrstuvwxyz', binary_chunck_value + 1);
			geohash = catt(geohash , hash_char);
		end;

		return(geohash);

	endsub;

	FUNCTION geohash_4(longitude, latitude) $;

		latmin = -90;
		latmax = 90;
		lonmin = -180;
		lonmax = 180;

		length hash_bits $ 20 geohash $ 4 hash_chunck $ 5 hash_char $ 1;

		do i=1 to 20;

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

		do j=1 to 20 by 5;
			
			hash_chunck = substr(hash_bits, j, j+5);
			binary_chunck_value = input(hash_chunck, binary5.);
			hash_char = char('0123456789bcdefghjkmnpqrstuvwxyz', binary_chunck_value + 1);
			geohash = catt(geohash , hash_char);
		end;

		return(geohash);

	endsub;

	FUNCTION geohash_5(longitude, latitude) $;

		latmin = -90;
		latmax = 90;
		lonmin = -180;
		lonmax = 180;

		length hash_bits $ 25 geohash $ 5 hash_chunck $ 5 hash_char $ 1;

		do i=1 to 25;

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

		do j=1 to 25 by 5;
			
			hash_chunck = substr(hash_bits, j, j+5);
			binary_chunck_value = input(hash_chunck, binary5.);
			hash_char = char('0123456789bcdefghjkmnpqrstuvwxyz', binary_chunck_value + 1);
			geohash = catt(geohash , hash_char);
		end;

		return(geohash);

	endsub;

	FUNCTION geohash_6(longitude, latitude) $;

		latmin = -90;
		latmax = 90;
		lonmin = -180;
		lonmax = 180;

		length hash_bits $ 30 geohash $ 6 hash_chunck $ 5 hash_char $ 1;

		do i=1 to 30;

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

		do j=1 to 30 by 5;
			
			hash_chunck = substr(hash_bits, j, j+5);
			binary_chunck_value = input(hash_chunck, binary5.);
			hash_char = char('0123456789bcdefghjkmnpqrstuvwxyz', binary_chunck_value + 1);
			geohash = catt(geohash , hash_char);
		end;

		return(geohash);

	endsub;

	FUNCTION geohash_7(longitude, latitude) $;

		latmin = -90;
		latmax = 90;
		lonmin = -180;
		lonmax = 180;

		length hash_bits $ 35 geohash $ 7 hash_chunck $ 5 hash_char $ 1;

		do i=1 to 35;

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

		do j=1 to 35 by 5;
			
			hash_chunck = substr(hash_bits, j, j+5);
			binary_chunck_value = input(hash_chunck, binary5.);
			hash_char = char('0123456789bcdefghjkmnpqrstuvwxyz', binary_chunck_value + 1);
			geohash = catt(geohash , hash_char);
		end;

		return(geohash);

	endsub;

	FUNCTION geohash_8(longitude, latitude) $;

		latmin = -90;
		latmax = 90;
		lonmin = -180;
		lonmax = 180;

		length hash_bits $ 40 geohash $ 8 hash_chunck $ 5 hash_char $ 1;

		do i=1 to 40;

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

		do j=1 to 40 by 5;
			
			hash_chunck = substr(hash_bits, j, j+5);
			binary_chunck_value = input(hash_chunck, binary5.);
			hash_char = char('0123456789bcdefghjkmnpqrstuvwxyz', binary_chunck_value + 1);
			geohash = catt(geohash , hash_char);
		end;

		return(geohash);

	endsub;

	FUNCTION geohash_9(longitude, latitude) $;

		latmin = -90;
		latmax = 90;
		lonmin = -180;
		lonmax = 180;

		length hash_bits $ 45 geohash $ 9 hash_chunck $ 5 hash_char $ 1;

		do i=1 to 45;

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

		do j=1 to 45 by 5;
			
			hash_chunck = substr(hash_bits, j, j+5);
			binary_chunck_value = input(hash_chunck, binary5.);
			hash_char = char('0123456789bcdefghjkmnpqrstuvwxyz', binary_chunck_value + 1);
			geohash = catt(geohash , hash_char);
		end;

		return(geohash);

	endsub;

	FUNCTION geohash_10(longitude, latitude) $;

		latmin = -90;
		latmax = 90;
		lonmin = -180;
		lonmax = 180;

		length hash_bits $ 50 geohash $ 10 hash_chunck $ 5 hash_char $ 1;

		do i=1 to 50;

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

		do j=1 to 50 by 5;
			
			hash_chunck = substr(hash_bits, j, j+5);
			binary_chunck_value = input(hash_chunck, binary5.);
			hash_char = char('0123456789bcdefghjkmnpqrstuvwxyz', binary_chunck_value + 1);
			geohash = catt(geohash , hash_char);
		end;

		return(geohash);

	endsub;

	FUNCTION geohash_11(longitude, latitude) $;

		latmin = -90;
		latmax = 90;
		lonmin = -180;
		lonmax = 180;

		length hash_bits $ 55 geohash $ 11 hash_chunck $ 5 hash_char $ 1;

		do i=1 to 55;

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

		do j=1 to 55 by 5;
			
			hash_chunck = substr(hash_bits, j, j+5);
			binary_chunck_value = input(hash_chunck, binary5.);
			hash_char = char('0123456789bcdefghjkmnpqrstuvwxyz', binary_chunck_value + 1);
			geohash = catt(geohash , hash_char);
		end;

		return(geohash);

	endsub;

	FUNCTION geohash_12(longitude, latitude) $;

		latmin = -90;
		latmax = 90;
		lonmin = -180;
		lonmax = 180;

		length hash_bits $ 60 geohash $ 12 hash_chunck $ 5 hash_char $ 1;

		do i=1 to 60;

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

		do j=1 to 60 by 5;
			
			hash_chunck = substr(hash_bits, j, j+5);
			binary_chunck_value = input(hash_chunck, binary5.);
			hash_char = char('0123456789bcdefghjkmnpqrstuvwxyz', binary_chunck_value + 1);
			geohash = catt(geohash , hash_char);
		end;

		return(geohash);

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
/*
EXAMPLE 

data a;
	input lat lon;
cards;
20.644275 -103.415962
42.604980469 -5.603027344
41.21489322671226 -0.0008589124276170423
;
run;

options cmplib=sasuser.userfuncs;
return geohash, bounding box of geohash and neighbours
%geohas_encode(a, lon, lat, 6, geohash, b);
*/
