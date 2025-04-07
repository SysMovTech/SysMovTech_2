#PROCEDIMIENTOS
#Procedimientos de perfil

	#Info General de los trabajadores
		DELIMITER // 
			CREATE PROCEDURE info_G_Trabajadores (IN no_Trabajador INT) 
			BEGIN 
				SELECT 
					U.no_Trabajador AS Numero_Trabajador,
					U.nombre AS Nombre,
					TU.tipo_Usr AS Rol,
					TU.url_Imagen AS Imagen,
					E.estado AS Estado
				FROM 
					Usuario U 
				JOIN 
					RelUsuarioTipo RUT ON U.no_Trabajador = RUT.no_Trabajador
				JOIN 
					TipoUsuarios TU ON RUT.id_Tipo_Usr = TU.id_Tipo_Usr
				JOIN 
					RelEstadoUsr REU ON U.no_Trabajador = REU.no_Trabajador
				JOIN 
					Estado E ON REU.id_Estado = E.id_Estado
				WHERE 
					U.no_Trabajador = no_Trabajador;
			END//
		DELIMITER ;

	#Info de perfil
    #drop procedure info_Perfil;
		DELIMITER // 
			CREATE PROCEDURE info_Perfil (IN no_Trabajador INT, contrasena VARCHAR(15)) 
			BEGIN 
				SELECT 
					U.no_Trabajador AS Numero_Trabajador,
					U.nombre AS Nombre,
					U.contrasena AS Contrasena,
					TU.tipo_Usr AS Rol,
					TU.url_Imagen AS Imagen
				FROM 
					Usuario U 
				JOIN 
					RelUsrTipo RUT ON U.no_Trabajador = RUT.no_Trabajador
				JOIN 
					TipoUsuarios TU ON RUT.id_Tipo_Usr = TU.id_Tipo_Usr
				JOIN 
					RelEstadoUsr REU ON U.no_Trabajador = REU.no_Trabajador
				JOIN 
					Estado E ON REU.id_Estado = E.id_Estado
				WHERE 
					U.no_Trabajador = no_Trabajador
				AND
					U.contrasena = contrasena;
			END//
		DELIMITER ;


#Procedimientos de consultas de Averias 
	#Info B_Averías
		DELIMITER //
			CREATE PROCEDURE info_B_Averia (IN num_Averia INT)
			BEGIN
				SELECT 
					A.descripcion AS Descripcion_Averia,
					L.nom_Linea AS Nombre_Linea,
					E.nom_Estacion AS Nombre_Estacion,
					E.url_Imagen AS Img_Estacion,
					L.url_Imagen AS Img_Linea,
					ES.estado AS Estado
				FROM 
					Averia A
				JOIN
					RelEstadoAveria REA ON A.no_Averia = REA.no_Averia
				JOIN 
					Modificaciones M ON A.no_Averia = M.no_Averia
				JOIN
					Estado ES ON REA.id_Estado = ES.id_Estado
				JOIN
					UbAveria U ON A.no_Averia = U.no_Averia
				JOIN 
					RelLineaEstacion R ON U.id_Rel_Linea_Estacion = R.id_Rel_Linea_Estacion
				JOIN 
					Lineas L ON R.id_Linea = L.id_Linea
				JOIN 
					Estaciones E ON R.id_Estacion = E.id_Estacion
				WHERE A.no_Averia = num_Averia
				ORDER BY M.fecha_Mod DESC;
			END //
		DELIMITER ;

	#Averías Pendientes
		DELIMITER //
			CREATE PROCEDURE Averias_Pen (IN num_Averia INT)
			BEGIN
				SELECT 
					A.descripcion AS Descripcion_Averia,
					L.nom_Linea AS Nombre_Linea,
					E.nom_Estacion AS Nombre_Estacion,
					E.url_Imagen AS Img_Estacion,
					L.url_Imagen AS Img_Linea,
					ES.estado AS Estado
				FROM 
					Averia A
				JOIN
					RelEstadoAveria REA ON A.no_Averia = REA.no_Averia
				JOIN 
					Modificaciones M ON A.no_Averia = M.no_Averia
				JOIN
					Estado ES ON REA.id_Estado = ES.id_Estado
				JOIN
					UbAveria U ON A.no_Averia = U.no_Averia
				JOIN 
					RelLineaEstacion R ON U.id_Rel_Linea_Estacion = R.id_Rel_Linea_Estacion
				JOIN 
					Lineas L ON R.id_Linea = L.id_Linea
				JOIN 
					Estaciones E ON R.id_Estacion = E.id_Estacion
				WHERE A.no_Averia = num_Averia AND ES.estado = 'Activo'
				ORDER BY M.fecha_Mod DESC;
			END //
		DELIMITER ;

	#Averia info completa
    #drop procedure info_C_Averia;
		DELIMITER //
			CREATE PROCEDURE info_C_Averia ()
			BEGIN
				SELECT 
    A.no_Averia AS Numero_Averia,
    (SELECT nombre 
     FROM Usuario 
     WHERE no_Trabajador = (SELECT no_Trabajador 
                             FROM RelUsrAveria 
                             WHERE no_Averia = A.no_Averia 
                               AND id_Rol_Reporte = (SELECT id_Rol_Reporte 
                                                     FROM RolReporte 
                                                     WHERE rol_Reporte = 'Reporta')
                             LIMIT 1)) AS Reporto,
    (SELECT nombre 
     FROM Usuario 
     WHERE no_Trabajador = (SELECT no_Trabajador 
                             FROM RelUsrAveria 
                             WHERE no_Averia = A.no_Averia 
                               AND id_Rol_Reporte = (SELECT id_Rol_Reporte 
                                                     FROM RolReporte 
                                                     WHERE rol_Reporte = 'Recibe')
                             LIMIT 1)) AS Recibio,
    L.nom_Linea AS Nombre_Linea,
    E.nom_Estacion AS Nombre_Estacion,
    A.descripcion AS Descripcion_Averia,
    A.reparacion AS Reparacion_Averia,
    E.url_Imagen AS Img_Estacion,
    L.url_Imagen AS Img_Linea,
    ES.estado AS Estado,
    DATE(H.horario) AS Fecha,
    TIME(H.horario) AS Hora,
    M.fecha_Mod
FROM 
    Averia A 
JOIN
    RelEstadoAveria REA ON A.no_Averia = REA.no_Averia
JOIN 
    Modificaciones M ON A.no_Averia = M.no_Averia
JOIN
    Estado ES ON REA.id_Estado = ES.id_Estado
JOIN
    UbAveria U ON A.no_Averia = U.no_Averia
JOIN 
    RelLineaEstacion R ON U.id_Rel_Linea_Estacion = R.id_Rel_Linea_Estacion
JOIN 
    Lineas L ON R.id_Linea = L.id_Linea
JOIN 
    Estaciones E ON R.id_Estacion = E.id_Estacion
JOIN 
    RelHorarioAveria RHA ON RHA.no_Averia = A.no_Averia
JOIN 
    Horario H ON H.id_Horario = RHA.id_Horario
WHERE
     EXISTS (
        SELECT 1
        FROM RelUsrAveria RUA
        WHERE RUA.no_Averia = A.no_Averia
        AND RUA.id_Tipo_Reporte = (SELECT id_Tipo_Reporte 
                                   FROM TipoReporte 
                                   WHERE tipo_Reporte = 'Alta')
        AND RUA.id_Rol_Reporte IN (SELECT id_Rol_Reporte 
                                    FROM RolReporte 
                                    WHERE rol_Reporte IN ('Reporta', 'Recibe'))
    )
GROUP BY 
    A.no_Averia, L.nom_Linea, E.nom_Estacion, A.descripcion, A.reparacion, 
    E.url_Imagen, L.url_Imagen, ES.estado, H.horario, M.fecha_Mod
ORDER BY 
    M.fecha_Mod DESC;
			END //
		DELIMITER ;
	
#Procedimientos con filtros unicos    
    #Info Basica ultimo mes
		DELIMITER //
			CREATE PROCEDURE info_B_1Mes (IN num_Averia INT)
			BEGIN
				SELECT 
					A.descripcion AS Descripcion_Averia,
					L.nom_Linea AS Nombre_Linea,
					E.nom_Estacion AS Nombre_Estacion,
					E.url_Imagen AS Img_Estacion,
					L.url_Imagen AS Img_Linea,
					ES.estado AS Estado
				FROM 
					Averia A
				JOIN
					RelEstadoAveria REA ON A.no_Averia = REA.no_Averia
				JOIN 
					Modificaciones M ON A.no_Averia = M.no_Averia
				JOIN
					Estado ES ON REA.id_Estado = ES.id_Estado
				JOIN
					UbAveria U ON A.no_Averia = U.no_Averia
				JOIN 
					RelLineaEstacion R ON U.id_Rel_Linea_Estacion = R.id_Rel_Linea_Estacion
				JOIN 
					Lineas L ON R.id_Linea = L.id_Linea
				JOIN 
					Estaciones E ON R.id_Estacion = E.id_Estacion
				WHERE A.no_Averia = num_Averia AND
					M.fecha_Mod >= DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), '%Y-%m-01')
				ORDER BY M.fecha_Mod DESC;
			END //
		DELIMITER ;
        
	#Info Basica ultimos 2 meses
		DELIMITER //
			CREATE PROCEDURE info_B_2Mes (IN num_Averia INT)
			BEGIN
				SELECT 
					A.descripcion AS Descripcion_Averia,
					L.nom_Linea AS Nombre_Linea,
					E.nom_Estacion AS Nombre_Estacion,
					E.url_Imagen AS Img_Estacion,
					L.url_Imagen AS Img_Linea,
					ES.estado AS Estado
				FROM 
					Averia A
				JOIN
					RelEstadoAveria REA ON A.no_Averia = REA.no_Averia
				JOIN 
					Modificaciones M ON A.no_Averia = M.no_Averia
				JOIN
					Estado ES ON REA.id_Estado = ES.id_Estado
				JOIN
					UbAveria U ON A.no_Averia = U.no_Averia
				JOIN 
					RelLineaEstacion R ON U.id_Rel_Linea_Estacion = R.id_Rel_Linea_Estacion
				JOIN 
					Lineas L ON R.id_Linea = L.id_Linea
				JOIN 
					Estaciones E ON R.id_Estacion = E.id_Estacion
				WHERE A.no_Averia = num_Averia AND
					M.fecha_Mod >= DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 2 MONTH), '%Y-%m-01')
				ORDER BY M.fecha_Mod DESC;
			END //
		DELIMITER ;
        
    #Info Basica ultimos 6 meses
		DELIMITER //
			CREATE PROCEDURE info_B_6Mes (IN num_Averia INT)
			BEGIN
				SELECT 
					A.descripcion AS Descripcion_Averia,
					L.nom_Linea AS Nombre_Linea,
					E.nom_Estacion AS Nombre_Estacion,
					E.url_Imagen AS Img_Estacion,
					L.url_Imagen AS Img_Linea,
					ES.estado AS Estado
				FROM 
					Averia A
				JOIN
					RelEstadoAveria REA ON A.no_Averia = REA.no_Averia
				JOIN 
					Modificaciones M ON A.no_Averia = M.no_Averia
				JOIN
					Estado ES ON REA.id_Estado = ES.id_Estado
				JOIN
					UbAveria U ON A.no_Averia = U.no_Averia
				JOIN 
					RelLineaEstacion R ON U.id_Rel_Linea_Estacion = R.id_Rel_Linea_Estacion
				JOIN 
					Lineas L ON R.id_Linea = L.id_Linea
				JOIN 
					Estaciones E ON R.id_Estacion = E.id_Estacion
				WHERE A.no_Averia = num_Averia AND
					M.fecha_Mod >= DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 6 MONTH), '%Y-%m-01')
				ORDER BY M.fecha_Mod DESC;
			END //
		DELIMITER ;
        
    #Info Basica de averias resueltas
		DELIMITER //
			CREATE PROCEDURE info_B_Resueltas (IN num_Averia INT)
			BEGIN
				SELECT 
					A.descripcion AS Descripcion_Averia,
					L.nom_Linea AS Nombre_Linea,
					E.nom_Estacion AS Nombre_Estacion,
					E.url_Imagen AS Img_Estacion,
					L.url_Imagen AS Img_Linea,
					ES.estado AS Estado
				FROM 
					Averia A
				JOIN
					RelEstadoAveria REA ON A.no_Averia = REA.no_Averia
				JOIN 
					Modificaciones M ON A.no_Averia = M.no_Averia
				JOIN
					Estado ES ON REA.id_Estado = ES.id_Estado
				JOIN
					UbAveria U ON A.no_Averia = U.no_Averia
				JOIN 
					RelLineaEstacion R ON U.id_Rel_Linea_Estacion = R.id_Rel_Linea_Estacion
				JOIN 
					Lineas L ON R.id_Linea = L.id_Linea
				JOIN 
					Estaciones E ON R.id_Estacion = E.id_Estacion
				WHERE A.no_Averia = num_Averia AND
					ES.estado = 'Inactivo'
				ORDER BY M.fecha_Mod DESC;
			END //
		DELIMITER ;
        
    #Info Basica de averias activas
			DELIMITER //
				CREATE PROCEDURE info_B_Activas (IN num_Averia INT)
				BEGIN
					SELECT 
						A.descripcion AS Descripcion_Averia,
						L.nom_Linea AS Nombre_Linea,
						E.nom_Estacion AS Nombre_Estacion,
						E.url_Imagen AS Img_Estacion,
						L.url_Imagen AS Img_Linea,
						ES.estado AS Estado
					FROM 
						Averia A
					JOIN
						RelEstadoAveria REA ON A.no_Averia = REA.no_Averia
					JOIN 
						Modificaciones M ON A.no_Averia = M.no_Averia
					JOIN
						Estado ES ON REA.id_Estado = ES.id_Estado
					JOIN
						UbAveria U ON A.no_Averia = U.no_Averia
					JOIN 
						RelLineaEstacion R ON U.id_Rel_Linea_Estacion = R.id_Rel_Linea_Estacion
					JOIN 
						Lineas L ON R.id_Linea = L.id_Linea
					JOIN 
						Estaciones E ON R.id_Estacion = E.id_Estacion
					WHERE A.no_Averia = num_Averia AND
						ES.estado = 'Activo'
					ORDER BY M.fecha_Mod DESC;
				END //
			DELIMITER ;

#Procedimientos de consultas de averias con dobles filtros
	#Procedimientos de averias resueltas
		#Info Basica de averias resueltas del ultimo mes
			DELIMITER //
				CREATE PROCEDURE info_B_1MRes(IN num_Averia INT)
				BEGIN
					SELECT 
						A.descripcion AS Descripcion_Averia,
						L.nom_Linea AS Nombre_Linea,
						E.nom_Estacion AS Nombre_Estacion,
						E.url_Imagen AS Img_Estacion,
						L.url_Imagen AS Img_Linea,
						ES.estado AS Estado
					FROM 
						Averia A
					JOIN
						RelEstadoAveria REA ON A.no_Averia = REA.no_Averia
					JOIN 
						Modificaciones M ON A.no_Averia = M.no_Averia
					JOIN
						Estado ES ON REA.id_Estado = ES.id_Estado
					JOIN
						UbAveria U ON A.no_Averia = U.no_Averia
					JOIN 
						RelLineaEstacion R ON U.id_Rel_Linea_Estacion = R.id_Rel_Linea_Estacion
					JOIN 
						Lineas L ON R.id_Linea = L.id_Linea
					JOIN 
						Estaciones E ON R.id_Estacion = E.id_Estacion
					WHERE A.no_Averia = num_Averia 
					AND ES.estado = 'Inactivo' 
					AND M.fecha_Mod >= DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), '%Y-%m-01')
					ORDER BY M.fecha_Mod DESC;
				END //
			DELIMITER ;

		#Info Basica de averias resueltas de los ultimos 2 meses
			DELIMITER //
				CREATE PROCEDURE info_B_2MRes(IN num_Averia INT)
				BEGIN
					SELECT 
						A.descripcion AS Descripcion_Averia,
						L.nom_Linea AS Nombre_Linea,
						E.nom_Estacion AS Nombre_Estacion,
						E.url_Imagen AS Img_Estacion,
						L.url_Imagen AS Img_Linea,
						ES.estado AS Estado
					FROM 
						Averia A
					JOIN
						RelEstadoAveria REA ON A.no_Averia = REA.no_Averia
					JOIN 
						Modificaciones M ON A.no_Averia = M.no_Averia
					JOIN
						Estado ES ON REA.id_Estado = ES.id_Estado
					JOIN
						UbAveria U ON A.no_Averia = U.no_Averia
					JOIN 
						RelLineaEstacion R ON U.id_Rel_Linea_Estacion = R.id_Rel_Linea_Estacion
					JOIN 
						Lineas L ON R.id_Linea = L.id_Linea
					JOIN 
						Estaciones E ON R.id_Estacion = E.id_Estacion
					WHERE A.no_Averia = num_Averia 
					AND ES.estado = 'Inactivo' 
					AND M.fecha_Mod >= DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 2 MONTH), '%Y-%m-01')
					ORDER BY M.fecha_Mod DESC;
				END //
			DELIMITER ;

		#Info Basica de averias resueltas de los ultimos 6 meses
			DELIMITER //
				CREATE PROCEDURE info_B_6MRes(IN num_Averia INT)
				BEGIN
					SELECT 
						A.descripcion AS Descripcion_Averia,
						L.nom_Linea AS Nombre_Linea,
						E.nom_Estacion AS Nombre_Estacion,
						E.url_Imagen AS Img_Estacion,
						L.url_Imagen AS Img_Linea,
						ES.estado AS Estado
					FROM 
						Averia A
					JOIN
						RelEstadoAveria REA ON A.no_Averia = REA.no_Averia
					JOIN 
						Modificaciones M ON A.no_Averia = M.no_Averia
					JOIN
						Estado ES ON REA.id_Estado = ES.id_Estado
					JOIN
						UbAveria U ON A.no_Averia = U.no_Averia
					JOIN 
						RelLineaEstacion R ON U.id_Rel_Linea_Estacion = R.id_Rel_Linea_Estacion
					JOIN 
						Lineas L ON R.id_Linea = L.id_Linea
					JOIN 
						Estaciones E ON R.id_Estacion = E.id_Estacion
					WHERE A.no_Averia = num_Averia 
					AND ES.estado = 'Inactivo' 
					AND M.fecha_Mod >= DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 6 MONTH), '%Y-%m-01')
					ORDER BY M.fecha_Mod DESC;
				END //
			DELIMITER ;
        
	#Procedimientos de averias activas
		#Info Basica de averias activas del ultimo mes
			DELIMITER //
				CREATE PROCEDURE info_B_1MAct(IN num_Averia INT)
				BEGIN
					SELECT 
						A.descripcion AS Descripcion_Averia,
						L.nom_Linea AS Nombre_Linea,
						E.nom_Estacion AS Nombre_Estacion,
						E.url_Imagen AS Img_Estacion,
						L.url_Imagen AS Img_Linea,
						ES.estado AS Estado
					FROM 
						Averia A
					JOIN
						RelEstadoAveria REA ON A.no_Averia = REA.no_Averia
					JOIN 
						Modificaciones M ON A.no_Averia = M.no_Averia
					JOIN
						Estado ES ON REA.id_Estado = ES.id_Estado
					JOIN
						UbAveria U ON A.no_Averia = U.no_Averia
					JOIN 
						RelLineaEstacion R ON U.id_Rel_Linea_Estacion = R.id_Rel_Linea_Estacion
					JOIN 
						Lineas L ON R.id_Linea = L.id_Linea
					JOIN 
						Estaciones E ON R.id_Estacion = E.id_Estacion
					WHERE A.no_Averia = num_Averia 
					AND ES.estado = 'Activo' 
					AND M.fecha_Mod >= DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), '%Y-%m-01')
					ORDER BY M.fecha_Mod DESC;
				END //
			DELIMITER ;
        
		#Info Basica de averias activas de los ultimos 2 meses
			DELIMITER //
				CREATE PROCEDURE info_B_2MAct(IN num_Averia INT)
				BEGIN
					SELECT 
						A.descripcion AS Descripcion_Averia,
						L.nom_Linea AS Nombre_Linea,
						E.nom_Estacion AS Nombre_Estacion,
						E.url_Imagen AS Img_Estacion,
						L.url_Imagen AS Img_Linea,
						ES.estado AS Estado
					FROM 
						Averia A
					JOIN
						RelEstadoAveria REA ON A.no_Averia = REA.no_Averia
					JOIN 
						Modificaciones M ON A.no_Averia = M.no_Averia
					JOIN
						Estado ES ON REA.id_Estado = ES.id_Estado
					JOIN
						UbAveria U ON A.no_Averia = U.no_Averia
					JOIN 
						RelLineaEstacion R ON U.id_Rel_Linea_Estacion = R.id_Rel_Linea_Estacion
					JOIN 
						Lineas L ON R.id_Linea = L.id_Linea
					JOIN 
						Estaciones E ON R.id_Estacion = E.id_Estacion
					WHERE A.no_Averia = num_Averia 
					AND ES.estado = 'Activo' 
					AND M.fecha_Mod >= DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 2 MONTH), '%Y-%m-01')
					ORDER BY M.fecha_Mod DESC;
				END //
			DELIMITER ;
        
		#Info Basica de averias activas de los ultimos 6 meses
			DELIMITER //
				CREATE PROCEDURE info_B_6MAct(IN num_Averia INT)
				BEGIN
					SELECT 
						A.descripcion AS Descripcion_Averia,
						L.nom_Linea AS Nombre_Linea,
						E.nom_Estacion AS Nombre_Estacion,
						E.url_Imagen AS Img_Estacion,
						L.url_Imagen AS Img_Linea,
						ES.estado AS Estado
					FROM 
						Averia A
					JOIN
						RelEstadoAveria REA ON A.no_Averia = REA.no_Averia
					JOIN 
						Modificaciones M ON A.no_Averia = M.no_Averia
					JOIN
						Estado ES ON REA.id_Estado = ES.id_Estado
					JOIN
						UbAveria U ON A.no_Averia = U.no_Averia
					JOIN 
						RelLineaEstacion R ON U.id_Rel_Linea_Estacion = R.id_Rel_Linea_Estacion
					JOIN 
						Lineas L ON R.id_Linea = L.id_Linea
					JOIN 
						Estaciones E ON R.id_Estacion = E.id_Estacion
					WHERE A.no_Averia = num_Averia 
					AND ES.estado = 'Activo' 
					AND M.fecha_Mod >= DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 6 MONTH), '%Y-%m-01')
					ORDER BY M.fecha_Mod DESC;
				END //
			DELIMITER ;
        
