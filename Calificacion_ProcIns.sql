-- INSERCIONES A LAS TABLAS DE CALIFICACIÓN
INSERT INTO Subsistema VALUE ("-", "-");
INSERT INTO IntervencionUbicacion VALUE ("-", "-");
INSERT INTO CodigoCausa VALUE ("-", "-");
INSERT INTO TipoAveria VALUE ("-", "-");

#drop procedure info_C_A_Calificacion;
DELIMITER // 
	CREATE PROCEDURE info_C_A_Calificacion (IN num_Averia INT )
    BEGIN
		SELECT 
			S.subsistema AS Subsistema,
			IU.intervencion_Ubicacion AS Intervencion_Ub,
			CC.codigo_Causa AS Codigo_Causa,
			TA.tipo_Averia AS Tipo_Averia,
            L.url_Imagen AS Linea_img
		FROM 
			Averia A 
		JOIN 
			RelCalAveria RCA ON RCA.no_Averia = A.no_Averia
		JOIN 
			Calificacion C ON C.id_Calificacion = RCA.id_Calificacion
		JOIN 
			Subsistema S ON C.id_Subsistema = S.id_Subsistema
		JOIN 
			IntervencionUbicacion IU ON C.id_Intervencion_Ubicacion = IU.id_Intervencion_Ubicacion
		JOIN 
			CodigoCausa CC ON C.id_Codigo_Causa = CC.id_Codigo_Causa
		JOIN 
			TipoAveria TA ON C.id_Tipo_Averia = TA.id_Tipo_Averia
		JOIN 
			Lineas L ON C.id_Linea = L.id_Linea
		WHERE 
			A.no_Averia = num_Averia;
	END//
DELIMITER ;
