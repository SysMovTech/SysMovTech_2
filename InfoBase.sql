#drop database averia_fix;

INSERT INTO TipoUsuarios VALUES
(1, "Administrador", "recursos/sup b.png"),
(2, "Supervisor", "recursos/sup b.png"),
(3, "Tecnico", "recursos/tec b.png");

INSERT INTO Horario VALUES
(1, "2024-12-08 17:00:00");

INSERT  Estado VALUES 
(1, "Activo"),
(2, "Inactivo");

INSERT INTO Usuario VALUES 
(2023090307, "Ibrahim Guerra", "2023090307."),
(2023090308, "Said Guerra", "AG$123"),
(2023090309, "Axel Guerra", "SG1503");

INSERT INTO RelEstadoUsr VALUES 
(1, 1, 2023090307),
(2, 1, 2023090308),
(3, 1, 2023090309);

INSERT INTO RelUsrTipo VALUES
(1, 1, 2023090307),
(2, 2, 2023090308),
(3, 3, 2023090309);

INSERT INTO TipoAveria VALUES
("FR", "Texto"),
("FV", "Texto"),
("MU", "Texto"),
("P", "Texto");

INSERT INTO CodigoCausa VALUES
("CADA", "Cable Dañado"),
("COAV", "Componente Averiado"),
("CODE", "Componente Desajustado"),
("COSU", "Contactos Sucios"),
("DESA", "Desaparicion"),
("EQDE", "EQ.Gaveta"),
("FACO", "Falso COntacto"),
("FALI", "Falla de Alimentacion"),
("FARM", "Armario T,G,PCC,SO,ARL"),
("FATI", "Falla Ati");

INSERT INTO Subsistema VALUES
("TA", "Texto"),
("TD", "Texto"),
("TT", "Texto"),
("RA", "Texto"),
("SO", "Texto"),
("CB", "Texto"),
("IN", "Texto");

INSERT INTO IntervencionUbicacion VALUES
("APTE", "Aparato Telefonico"),
("EATI", "Armario Ati"),
("BAFL", "Bafles y Conexiones"),
("CBLE", "Cables"),
("CCON", "Cableado REP Local del Conmutador"),
("CEST", "Cableado LT/L de Bocinas"),
("CLOC", "Cableado/Regleta Local/de Piso/Roseta"),
("CIS", "Cableado Armario JS/REP Multiple"),
("CPCC", "Cableado REP 4o. P PCC"),
("CSIN", "Cableado Señales de Entrada");

INSERT INTO TipoHorario VALUES
(1, "Alta"),
(2, "Baja");

INSERT INTO RolReporte VALUES
(1, "Reporta"),
(2, "Recibe");

INSERT INTO TipoReporte VALUES
(1, "Alta"),
(2, "Baja");

CALL Log_In(2023090307, "IG$1234");
CALL info_Perfil(2023090307, "2023090307.");
CALL editar_Perfil(2023090307, "2023090307.", "IG$1234");

select * from Usuario;
select * from Horario;
select *from Averia;