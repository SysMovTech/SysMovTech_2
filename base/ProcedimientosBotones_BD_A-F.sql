#PROCEDIMIENTOS PARA LOS BOTONES
 
	#Procedimientos para botones de Averias
		#Crear una avería 
        #drop procedure Alta_Averia;
			DELIMITER //
			CREATE PROCEDURE Alta_Averia (
				IN no_Pdc INT,
                IN estacion VARCHAR(3),
                IN linea VARCHAR(4),
                IN fecha DATE,
                IN hora TIME,
                IN descr TEXT,
                IN Nom_Usr_Reporte TINYTEXT,
                IN Nom_Usr_Recibe TINYTEXT
            )
            BEGIN
            
				DECLARE var_horario DATETIME;
                DECLARE var_id INT;
                
                SET @no_Trabajador = (SELECT no_Trabajador FROM Usuario WHERE nombre = Nom_Usr_Reporte);
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
					VALUES (no_Pdc,(SELECT id_Tipo_Horario FROM TipoHorario WHERE tipo_Horario = 'Alta'), var_id);
					
                    #nombre del que reporta
					INSERT INTO RelUsrAveria (no_Trabajador, no_Averia, id_Rol_Reporte, id_Tipo_Reporte)
                    VALUES((SELECT no_Trabajador FROM Usuario WHERE nombre = Nom_Usr_Reporte) , no_Pdc, (SELECT id_Rol_Reporte FROM RolReporte WHERE rol_Reporte = 'Reporta'
                    ), (SELECT id_Tipo_Reporte FROM TipoReporte WHERE tipo_Reporte = 'Alta') );
                    
                    #nombre del que recibe
					INSERT INTO RelUsrAveria (no_Trabajador, no_Averia, id_Rol_Reporte, id_Tipo_Reporte)
                    VALUES((SELECT no_Trabajador FROM Usuario WHERE nombre = Nom_Usr_Recibe), no_Pdc, (SELECT id_Rol_Reporte FROM RolReporte WHERE rol_Reporte = 'Recibe'), (SELECT id_Tipo_Reporte FROM TipoReporte WHERE tipo_Reporte = 'Alta') );
                    
                    IF NOT EXISTS (
						SELECT 1
                        FROM RelLineaEstacion 
                        WHERE
							id_Linea = linea AND id_Estacion = estacion
                    ) THEN 
						INSERT INTO RelLineaEstacion(id_Linea, id_Estacion)
                        VALUES (linea, estacion);
					END IF;
                    
                    INSERT INTO UbAveria(no_Averia, id_Rel_Linea_Estacion)
                    VALUES (no_Pdc, (SELECT id_Rel_Linea_Estacion FROM RelLineaEstacion WHERE id_Linea = linea AND id_Estacion = estacion));
                    
                    SET @mensaje = "Insercion Exitosa";
                    SET @no_Incersion = no_Pdc;
                    
                    SELECT @mensaje, @no_Incersion;
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
						descripcion = descr_O
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
				
                #Horario con Obs
					INSERT INTO RelHorarioObs (id_Observacion, id_Tipo_Horario, id_Horario)
                    VALUES ((SELECT id_Observacion FROM Observacion WHERE descripcion = descr_O), (SELECT id_Tipo_Horario FROM TipoHorario WHERE tipo_Horario = 'Observacion'), var_id);
                
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
				DECLARE var_horario DATETIME;
				DECLARE var_id INT; 
                DECLARE var_id_Obs INT;
                
                SET trabajador = @no_Trabajador;
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
                
                IF 
					(estado_A = 'Resuelta') 
                THEN 
					#nombre del que reporta
					INSERT INTO RelUsrAveria (no_Trabajador, no_Averia, id_Rol_Reporte, id_Tipo_Reporte)
					VALUES(nombre_Reporte, no_Pdc, (SELECT id_Rol_Reporte FROM RolReporte WHERE rol_Reporte = 'Reporta'), 
						(SELECT id_Tipo_Reporte FROM TipoReporte WHERE tipo_Reporte = 'Baja') );
					
					#nombre del que recibe
					INSERT INTO RelUsrAveria (no_Trabajador, no_Averia, id_Rol_Reporte, id_Tipo_Reporte)
					VALUES(nombre_Recibe, no_Pdc, (SELECT id_Rol_Reporte FROM RolReporte WHERE rol_Reporte = 'Recibe'), 
						(SELECT id_Tipo_Reporte FROM TipoReporte WHERE tipo_Reporte = 'Baja') );
                    
                    #reparacion de la avería
					UPDATE Averia SET reparacion = rep 
                    WHERE no_Averia = no_Pdc ;
                    
                    # fecha de baja de avería
					INSERT INTO RelHorarioAveria (no_Averia, id_Tipo_Horario, id_Horario)
                    VALUES (no_Pdc, (SELECT id_Tipo_Horario FROM TipoHorario WHERE tipo_Horario = 'Baja'), var_id);
					
                    # Guardamos obs final 
                    #Insertamos la observacion
					IF NOT EXISTS (
						SELECT 1 
						FROM 
							Observacion
						WHERE
							descripcion = obs_F
					) THEN 
						INSERT INTO Observacion(descripcion)
						VALUES (obs_F);
                        SET var_id_Obs = (SELECT id_Observacion FROM Observacion WHERE descripcion = obs_F);
					ELSE 
						SET var_id_Obs = (SELECT id_Observacion FROM Observacion WHERE descripcion = obs_F);
					END IF;
                    
					# Observacion final
					INSERT INTO RelHorarioObs (id_Observacion, id_Tipo_Horario, id_Horario)
                    VALUES (var_id_Obs, (SELECT id_Tipo_Horario FROM TipoHorario WHERE tipo_Horario = 'Observacion final'), var_id);
                    
                    # Dar de baja la Averia 
                    UPDATE RelEstadoAveria SET id_Estado = (SELECT id_Estado FROM Estado WHERE estado = 'Inactivo')
					WHERE no_Averia = no_Pdc;
                    
                    # Calificacion si el usuario es supervisor: 
                    IF(
						SELECT 1 
                        FROM 
							RelUsuarioTipo
						WHERE
							(no_Trabajador = trabajador AND id_Tipo_U = 'Supervisor')
                    ) THEN 
						INSERT INTO Calificacion(id_Subsistema, id_Tipo_Averia, id_Codigo_Causa, id_Intervencion_Ubicacion, id_Linea)
                        VALUES (
							(SELECT id_Subsistema FROM Subsistema WHERE subsistema = subsis), 
                            (SELECT id_Tipo_Averia FROM TipoAveria WHERE tipo_Averia = tip_Averia), 
                            (SELECT id_Codigo_Causa FROM CodigoCausa WHERE codigo_Causa = cod_Causa),
                            (SELECT id_Intervencion_Ubicacion FROM IntervencionUbicacion WHERE intervencion_Ubicacion = inter_Ub),
                            (SELECT id_Linea FROM Lineas WHERE nom_Linea = lugar)
                        );
                    END IF; 
                
                    
				END IF;
            
            END//
            DELIMITER ;
    
    #Procedimientos para botones de otra cosa
		#Crear un trabajador
        #drop procedure Alta_Trabajador;
			DELIMITER //
			CREATE PROCEDURE Alta_Trabajador (
				IN nombre TINYTEXT,
				IN numero INT,
				IN pass_word VARCHAR(15),
				IN rol TINYTEXT
            )
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
					VALUES ((SELECT id_Tipo_Usr FROM TipoUsuarios WHERE tipo_Usr = rol), numero);
				END IF;
			END//
			DELIMITER ;
            
            #Editar un trabajador
            #drop procedure Editar_Trabajador;
            DELIMITER //
            CREATE PROCEDURE Editar_Trabajador (
				IN nombre_I TINYTEXT,
				IN numero INT,
				IN pass_word VARCHAR(15),
				IN rol TINYTEXT
            )
            BEGIN
				DECLARE trabajador INT;
                SET trabajador = @no_Trabajador;
            
				IF ( 
					SELECT no_Trabajador
					FROM 
						Usuario 
					WHERE 
						trabajador = numero
				) THEN 
                    #Actualizamos contrasena
                    UPDATE Usuario SET contrasena = pass_word 
					WHERE no_Trabajador = numero;
				ELSE IF (
						SELECT 1
						FROM 
							RelUsuario 
						WHERE 
							trabajador = no_Trabajador AND id_Tipo_U = (SELECT id_Tipo_U FROM TipoUsuarios WHERE tipo = 'Administrador')
					) THEN
						#Actualizamos nombre
						UPDATE Usuario SET nombre = nombre_I 
						WHERE no_Trabajador = numero;
						
						UPDATE RelUsrTipo SET id_Tipo_U = (SELECT id_Tipo_U FROM TipoUsuarios WHERE tipo_Usr = rol)
						WHERE no_Trabajador = numero;
                IF (
                
					SELECT 1
                    FROM
						Usuario
					WHERE
						trabajador = no_Trabajador AND id_Tipo_U = (SELECT id_Tipo_U FROM TipoUsuarios WHERE tipo = "Administrador")
				) THEN
					#Actualizamos nombre
					UPDATE Usuario SET nombre = nombre_I 
					WHERE no_Trabajador = numero;
                    
                    #Actualizamos contrasena
                    UPDATE Usuario SET contrasena = pass_word 
					WHERE no_Trabajador = numero;
                    
					UPDATE RelUsrTipo SET id_Tipo_U = (SELECT id_Tipo_U FROM TipoUsuarios WHERE tipo_Usr = rol)
                    WHERE no_Trabajador = numero;
                        #Actualizamos sobre contraseña
                        UPDATE Usario SET contrasena = pass_word
                        WHERE no_Trabajador = numero;
				END IF;
			END IF;
		END;
			DELIMITER ;
            
        #Log In
        #drop procedure Log_in;
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
                    SET @contrasenia = pass_word;
                                    
                SELECT @no_Trabajador, @contrasenia;
				END IF;
			END//
			DELIMITER ;
            
DELIMITER //

CREATE PROCEDURE editar_Perfil(IN p_no_Trabajador INT, IN p_contrasena_antigua VARCHAR(15), IN p_contrasena_nueva VARCHAR(15))
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Usuario
        WHERE no_Trabajador = p_no_Trabajador
          AND contrasena = p_contrasena_antigua
    ) THEN
        UPDATE Usuario
        SET contrasena = p_contrasena_nueva
        WHERE no_Trabajador = p_no_Trabajador;
    END IF;
END //

DELIMITER ;