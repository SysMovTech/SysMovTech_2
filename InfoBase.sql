#drop database averia_fix;

INSERT INTO TipoUsuarios VALUES
(1, "Administrador", "recursos/sup b.png"),
(2, "Supervisor", "recursos/sup b.png"),
(3, "Tecnico", "recursos/tec b.png");

INSERT INTO Estado VALUES 
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
("FR", "Falla Real"),
("FV", "Falla Virtual"),
("MU", "Mal Uso"),
("P", "Pendiente"),
("OD", "Otro Departamento"),
("CA", "Cancelada"),
("*M", "Maniobra"),
("CL", "Cambio de Lámpara");

INSERT INTO CodigoCausa VALUES
("CADA", "Cable Dañado"),
("COAV", "Componente Averiado"),
("CODE", "Componente Desajustado"),
("COSU", "Contactos Sucios"),
("DESA", "Desaparicion"),
("EQDES", "EQ.Gaveta"),
("FACO", "Falso COntacto"),
("FALIN", "Falla de Alimentacion"),
("FARMAR", "Armario T,G,PCC,SO,ARL"),
("FATI", "Falla Ati"),
("FCVOLO", "Comp. Voceo Local"),
("FEQCON", "Falla Harris/PCM"),
("FEQPCC", "EQ. PCC"),
("FEQVIA", "EQ. de Vía"),
("FPLATI", "Platina"),
("FUNISE", "Unidad Central"),
("LAMF", "Lámpara Fundida"),
("LIDA", "Cable o Línea Averiada"),
("NEGLI", "Negligencia"),
("ODEPTO", "Otro Departamento"),
("OSISTE", "Otro Sistema"),
("SINFA", "Sin Falla"),
("TELMEX", "TELMEX"),
("VODE", "Volúmen Desajustado");

INSERT INTO Subsistema VALUES
("TA", "Telefonía Automática"),
("TD", "Telefonía Directa"),
("TT", "Telefonía de trenes"),
("RA", "Relojes de Andén"),
("SO", "Sonido"),
("CB", "Cargadores de Baterías"),
("GR", "Grabadoras"),
("IN", "Interfonos");

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
("CSIN", "Cableado Señales de Entrada"),
("EAND", "EQ. / Cableado de Andén"),
("EARL", "EQ. de Armario de Línea"),
("EASO", "EQ. de Armario de Sonido"),
("EIN", "EQ. de Interfón"),
("ECJE", "EQ./ Cableado de CJE"),
("ECOT", "EQ. de Conmutador PCM"),
("EGRA", "EQ./ Cableado de Grabadora"),
("EPM", "EQ./ Cableado de PML o PMT"),
("EPCC", "EQ. Armario de PCC"),
("ETQP", "EQ./ Cableado de Taq. Principal"),
("ETQS", "EQ./ Cableado de Taq. Secundaria"),
("EUT", "EQ./ Cableado de Unidad de Tiempo"),
("EVIA", "EQ. de Via"),
("EAGLT", "Armario 32U/G"),
("PLAT", "Platinas de Pupitres de TD");

INSERT INTO Lineas VALUES
("L-1", "Línea 1", "recursos/linea1.png"),
("L-2", "Línea 2", "recursos/linea2.png"),
("L-3", "Línea 3", "recursos/linea3.png"),
("L-4", "Línea 4", "recursos/linea4.png"),
("L-5", "Línea 5", "recursos/linea5.png"),
("L-6", "Línea 6", "recursos/linea6.png"),
("L-7", "Línea 7", "recursos/linea7.png"),
("L-8", "Línea 8", "recursos/linea8.png"),
("L-9", "Línea 9", "recursos/linea9.png"),
("L-12", "Línea 12", "recursos/linea12.png"),
("L-A", "Línea A", "recursos/lineaA.png"),
("L-B", "Línea B", "recursos/lineaB.png");

INSERT INTO Estaciones VALUES
("ORO", "Observatorio", "recursos/observatorio.png"),
("TYA", "Tacubaya", "recursos/tacubaya.png"),
("JLA", "Juanacatlan", "recursos/juanacatlan.png"),
("CPE", "Chapultepec", "recursos/chapultepec.png"),
("SLA", "Sevilla", "recursos/sevilla.png"),
("ITE", "Insurgentes", "recursos/insurgentes.png"),
("CMO", "Cuauhtemoc", "recursos/cuauhtemoc.png"),
("BRA", "Balderas", "recursos/balderas.png"),
("SGA", "Salto del agua", "recursos/saltodelAgua.png"),
("ICA", "Isabel la Catolica", "recursos/isabelCatolica.png"),
("PRE", "Pino Suárez", "recursos/pinoSuarez.png"),
("MCE", "Merced", "recursos/merced.png"),
("CRA", "Candelaria", "recursos/candelaria.png"),
("SRO", "San Lázaro", "recursos/sanLazaro.png"),
("MMA", "Moctezuma", "recursos/moctezuma.png"),
("BNA", "Balbuena", "recursos/balbuena.png"),
("BRO", "Boulevard Puerto Aereo", "recursos/boulevarPA.png"),
("GRA", "Gomez Farias", "recursos/gomezFarias.png"),
("ZZA", "Zaragoza", "recursos/zaragoza.png"),
("PLA", "Pantitlan", "recursos/pan titlan.png");

INSERT INTO RelLineaEstacion VALUES
("L-1-ORO","L-1","ORO"),
("L-1-TYA","L-1","TYA"),
("L-1-JLA","L-1","JLA"),
("L-1-CPE","L-1","CPE"),
("L-1-SLA","L-1","SLA"),
("L-1-ITE","L-1","ITE"),
("L-1-CMO","L-1","CMO"),
("L-1-BRA","L-1","BRA"),
("L-1-SGA","L-1","SGA"),
("L-1-ICA","L-1","ICA"),
("L-1-PRE","L-1","PRE"),
("L-1-MCE","L-1","MCE"),
("L-1-CRA","L-1","CRA"),
("L-1-SRO","L-1","SRO"),
("L-1-MMA","L-1","MMA"),
("L-1-BNA","L-1","BNA"),
("L-1-ZZA","L-1","ZZA"),
("L-1-PLA","L-1","PLA");

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