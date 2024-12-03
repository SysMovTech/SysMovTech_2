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
                IN lugar TINYTEXT,
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
					VALUES (no_Pdc,(SELECT id_Tipo_Horario FROM Tipo_Horario WHERE tipoHorario = 'Inicio'), var_id);
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