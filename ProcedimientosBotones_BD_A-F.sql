#PROCEDIMIENTOS PARA LOS BOTONES
	#Log In
		DELIMITER //
		CREATE PROCEDURE Log_In(IN no_User INT, IN pass_word VARCHAR(15))
		BEGIN
			DECLARE trabajador INT;
			
			SELECT 
				U.no_Trabajador
			INTO 
				trabajador
			FROM 
				Usuario U
			JOIN 
				RelEstadoUsr REU ON U.no_Trabajador = REU.no_Trabajador
			JOIN 
				Estado E ON REU.id_Estado = E.id_Estado
			WHERE 
				U.no_Trabajador = no_User 
			AND 
				U.contrasena = pass_word
			AND
				E.estado = 'Activo';
		 
			IF trabajador IS NOT NULL THEN
				SET @no_Trabajador = trabajador;  
			END IF;
		END//
		DELIMITER ;
        
	#Procedimientos para botones de Averias
		#Crear una avería 
			DELIMITER //
			CREATE PROCEDURE Alta_Averia (
				IN no_Pdc INT,
                IN estacion TINYTEXT,
                IN linea TINYTEXT,
                IN fecha DATE,
                IN hora TIME,
                IN descr TEXT,
                IN nombre_Reporte TINYTEXT,
                IN nombre_Recibe TINYTEXT
            )
            BEGIN
            
				DECLARE var_horario DATETIME;
                DECLARE var_id INT;
                
                SET var_horario = CAST(CONCAT(fecha, ' ', hora) AS DATETIME);
                
                IF NOT EXISTS (
					SELECT 
						id_Horario
                    FROM 
						Horario
                    WHERE
						horario = var_horario
                ) THEN 
					INSERT INTO Horario (horario) 
                    VALUES (var_horario);
                    SET var_id = (SELECT id_Horario FROM Horario WHERE horario = var_horario);
				ELSE 
					SET var_id = (SELECT id_Horario FROM Horario WHERE horario = var_horario);
                END IF;
				
				IF NOT EXISTS ( 
				SELECT 1
				FROM 
					Averia 
				WHERE 
					no_Averia = no_Pdc
				) THEN 
					INSERT INTO Averia (no_Averia, descripcion)
					VALUES (no_Pdc, descr);
                    
					INSERT INTO RelHorarioAveria (no_Averia, id_Tipo_Horario, id_Horario)
					VALUES (no_Pdc,(SELECT id_Tipo_Horario FROM TipoHorario WHERE tipoHorario = 'Inicio'), var_id);
					
                    #nombre del que reporta
					INSERT INTO RelUsrAveria (no_Trabajador, no_Averia, id_Rol_Reporte, id_Tipo_Reporte)
                    VALUES(nombre_Reporte, no_Pdc, (SELECT id_Rol_Reporte FROM RolReporte WHERE rol_Reporte = 'Reporta'), (SELECT id_Tipo_Reporte FROM TipoReporte WHERE tipo_Reporte = 'Alta') );
                    
                    #nombre del que recibe
					INSERT INTO RelUsrAveria (no_Trabajador, no_Averia, id_Rol_Reporte, id_Tipo_Reporte)
                    VALUES(nombre_Recibe, no_Pdc, (SELECT id_Rol_Reporte FROM RolReporte WHERE rol_Reporte = 'Recibe'), (SELECT id_Tipo_Reporte FROM TipoReporte WHERE tipo_Reporte = 'Alta') );
                    
                    IF NOT EXISTS (
						SELECT 1
                        FROM RelLineaEstacion 
                        WHERE
							id_Linea = (SELECT id_Linea FROM Lineas WHERE nom_Linea = linea) AND id_Estacion = (SELECT id_Estacion FROM Estaciones WHERE nom_Estacion = estacion)
                    ) THEN 
						INSERT INTO RelLineaEstacion(id_Linea, id_Estacion)
                        VALUES ((SELECT id_Linea FROM Lineas WHERE nom_Linea = linea), (SELECT id_Estacion FROM Estaciones WHERE nom_Estacion = estacion));
					END IF;
                    
                    INSERT INTO UbAveria(no_Averia, id_Rel_Linea_Estacion)
                    VALUES (no_Pdc, (SELECT id_Rel_Linea_Estacion FROM RelLineaEstacion WHERE id_Linea = (SELECT id_Linea FROM Lineas WHERE nom_Linea = linea) AND id_Estacion = (SELECT id_Estacion FROM Estaciones WHERE nom_Estacion = estacion)));
				END IF;
            END//
            DELIMITER ;

		
		#Editar una avería 	
			DELIMITER //
			CREATE PROCEDURE Editar_Averia (
				IN no_Pdc INT,
				IN fecha_O DATE,
				IN hora_O TIME,
				IN descr_O TEXT,
				IN nombre_O TINYTEXT
			)
			BEGIN
			
				DECLARE var_horario DATETIME;
				DECLARE var_id INT;
				
				SET var_horario = CAST(CONCAT(fecha_O, ' ', hora_O) AS DATETIME);
				
				IF NOT EXISTS (
					SELECT 
						id_Horario
					FROM 
						Horario
					WHERE
						horario = var_horario
				) THEN 
					INSERT INTO Horario (horario) 
					VALUES (var_horario);
					SET var_id = (SELECT id_Horario FROM Horario WHERE horario = var_horario);
				ELSE 
					SET var_id = (SELECT id_Horario FROM Horario WHERE horario = var_horario);
				END IF;
				
				
				SELECT 1
				FROM 
					Averia 
				WHERE 
					no_Averia = no_Pdc;
				
                #Insertamos la observacion
                IF NOT EXISTS (
					SELECT 1 
                    FROM 
						Observacion
					WHERE
						descripcion = descr_O;
                ) THEN 
					INSERT INTO Observacion(descripcion)
					VALUES (descr_O);
                END IF;
                
                #Vinculamos la observación con la Averia
				INSERT INTO RelObsAveria (no_Averia, id_Observacion)
				VALUES (no_Pdc,(SELECT id_Observacion FROM Observacion WHERE descripcion = descr_O));
				
				#nombre del que observa
				INSERT INTO RelObsUsr (no_Trabajador, id_Observacion)
				VALUES((SELECT no_Trabajador FROM Usuario WHERE nombre = nombre_O),(SELECT id_Observacion FROM Observacion WHERE descripcion = descr_O) );
			
			END//
			DELIMITER ;
            
            #Averia resuelta
			DELIMITER //
			CREATE PROCEDURE Baja_Averia (
				IN no_Pdc INT,
				IN estado_A TINYTEXT,
                IN nombre_Reporte TINYTEXT,
                IN nombre_Recibe TINYTEXT,
                IN rep TEXT, 
                IN fecha DATE,
                IN hora TIME,
                IN obs_F TEXT,
                IN subsis TINYTEXT,
                IN tip_Averia TINYTEXT,
                IN cod_Causa TINYTEXT,
                IN inter_Ub TINYTEXT, 
                IN lugar TINYTEXT 
            )
            BEGIN 
				DECLARE trabajador INT;
                SET trabajador = @no_Trabajador;
                
                IF 
					(estado_A = 'Resuelta') 
                THEN 
					#nombre del que reporta
					INSERT INTO RelUsrAveria (no_Trabajador, no_Averia, id_Rol_Reporte, id_Tipo_Reporte)
					VALUES(nombre_Reporte, no_Pdc, (SELECT id_Rol_Reporte FROM RolReporte WHERE rol_Reporte = 'Reporta'), (SELECT id_Tipo_Reporte FROM TipoReporte WHERE tipo_Reporte = 'Baja') );
					
					#nombre del que recibe
					INSERT INTO RelUsrAveria (no_Trabajador, no_Averia, id_Rol_Reporte, id_Tipo_Reporte)
					VALUES(nombre_Recibe, no_Pdc, (SELECT id_Rol_Reporte FROM RolReporte WHERE rol_Reporte = 'Recibe'), (SELECT id_Tipo_Reporte FROM TipoReporte WHERE tipo_Reporte = 'Baja') );
                    
                    #reparacion de la avería
					UPDATE Averia SET reparacion = rep 
                    WHERE no_Averia = no_Pdc ;
				END IF;
            
            END//
            DELIMITER ;
    
    #Procedimientos para botones de otra cosa
		#Crear un trabajador
			DELIMITER //
			CREATE PROCEDURE Alta_Trabajador (IN nombre TINYTEXT, IN numero INT, IN pass_word VARCHAR(15), IN rol TINYTEXT)
			BEGIN
			
				IF NOT EXISTS ( 
				SELECT 1
				FROM 
					Usuario 
				WHERE 
					no_Trabajador = numero
				) THEN 
					INSERT INTO Usuario (no_Trabajador, nombre, contrasena)
					VALUES (numero, nombre, pass_word);
					
					INSERT INTO RelUsrTipo (id_Tipo_Usr, no_Trabajador)
					VALUES ((SELECT id_Tipo_Usr FROM Tipo_Usuarios WHERE tipo_Usr = rol), numero);
				END IF;
			END//
			DELIMITER ;
            
            #Prueba