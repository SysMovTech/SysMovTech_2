#TRIGGERS 

DELIMITER //
CREATE TRIGGER tr_Modificacion_I
AFTER INSERT ON Averia
FOR EACH ROW 
BEGIN 
    DECLARE trabajador INT;
    -- Tomamos el valor de la variable de sesión
    SET trabajador = @no_Trabajador;
    
    INSERT INTO Modificaciones(no_Averia, fecha_Mod, no_Trabajador) 
    VALUES (NEW.no_Averia, NOW(), trabajador);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_Modificacion_A
AFTER UPDATE ON Averia
FOR EACH ROW 
BEGIN 
    DECLARE trabajador INT;
    -- Tomamos el valor de la variable de sesión
    SET trabajador = @no_Trabajador;
    
    INSERT INTO Modificaciones(no_Averia, fecha_Mod, no_Trabajador) 
    VALUES (NEW.no_Averia, NOW(), trabajador);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_Usr_Activo
AFTER INSERT ON Usuario
FOR EACH ROW 
BEGIN 
	DECLARE state INT;
    SELECT 
		id_Estado 
	INTO 
		state
	FROM 
		Estado 
	WHERE 	
		estado = 'Activo';
	
    INSERT INTO RelEstadoUsr(id_Estado, no_Trabajador) 
    VALUES (state, NEW.no_Trabajador);
END//
DELIMITER ;

#drop trigger tr_Av_Activo;
DELIMITER //
CREATE TRIGGER tr_Av_Activo
AFTER INSERT ON Averia
FOR EACH ROW 
BEGIN 
	DECLARE state int;
    SELECT 
		id_Estado 
	INTO 
		state
	FROM 
		Estado 
	WHERE 	
		estado = 'Activo';
	
    INSERT INTO RelEstadoAveria(id_Estado, no_Averia) 
    VALUES (state, NEW.no_Averia);
END//
DELIMITER ;
