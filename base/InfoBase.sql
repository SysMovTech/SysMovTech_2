#drop database averia_fix;

INSERT INTO TipoUsuarios VALUES
(1, "Administrador", "recursos/sup b.png"),
(2, "Supervisor", "recursos/sup b.png"),
(3, "Tecnico", "recursos/tec b.png");

INSERT INTO Estado VALUES 
(1, "Activo"),
(2, "Inactivo");

CALL Alta_Trabajador ("Ibrahim Guerra", 2023090307, "2023090307.", "Administrador");
CALL Alta_Trabajador ("Said Guerra", 2023090308, "SG$1234", "Supervisor");
CALL Alta_Trabajador ("Axel Guerra", 2023090309, "AG$1234", "Tecnico");
 
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

 #Inserciones de las líneas
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
 
#Inserciones de la L-1
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
("PNA", "Pantitlan", "recursos/pantitlan.png");

#REL L-1
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
("L-1-PNA","L-1","PNA");

#Inserciones de L-2 (omitimos Pino Suárez)
INSERT INTO Estaciones VALUES 
("CSO","Cuatro Caminos","recursos/cuatroCaminos.png"),
("PNE","Panteones","recursos/panteones.png"),
("TBA","Tacuba","recursos/tacuba.png"), 
("CCA","Cuitlahuac","recursos/cuitlahuac.png"),
("PLA","Popotla","recursos/popotla.png"),
("CAR","Colegio Militar","recursos/colegioMilitar.png"),
("NLA","Normal","recursos/normal.png"),
("SME","San Cosme","recursos/sanCosme.png"),
("RNO","Revolución","recursos/revolucion.png"),
("HGO","Hidalgo","recursos/hidalgo.png"), 
("BSE","Bellas Artes","recursos/bellasArtes.png"), 
("ADE","Allende","recursos/allende.png"),
("ZLO","Zócalo","recursos/zocalo.png"),
("SDA","San Antonio Abad","recursos/sanAntonioAb.png"),
("CNO","Chabacano","recursos/chabacano.png"), 
("VTO","Viaducto","recursos/viaducto.png"),
("XLA","Xola","recursos/xola.png"),
("VSE","Villa de Cortés","recursos/villaCortes.png"),
("NSA","Nativitas","recursos/nativitas.png"),
("PLE","Portales","recursos/portales.png"),
("ETA","Ermita","recursos/ermita.png"),
("GYA","General Anaya","recursos/generalAnaya.png"),
("TNA","Taxqueña","recursos/tasquena.png");

#REL L-2 
INSERT INTO RelLineaEstacion VALUES
("L-2-CSO","L-2","CSO"),
("L-2-PNE","L-2","PNE"),
("L-2-TBA","L-2","TBA"),
("L-2-CCA","L-2","CCA"),
("L-2-PLA","L-2","PLA"),
("L-2-CAR","L-2","CAR"),
("L-2-NLA","L-2","NLA"),
("L-2-SME","L-2","SME"),
("L-2-RNO","L-2","RNO"),
("L-2-HGO","L-2","HGO"),
("L-2-BSE","L-2","BSE"),
("L-2-ADE","L-2","ADE"),
("L-2-ZLO","L-2","ZLO"),
("L-2-PRE","L-2","PRE"),
("L-2-SDA","L-2","SDA"),
("L-2-CNO","L-2","CNO"),
("L-2-VTO","L-2","VTO"),
("L-2-XLA","L-2","XLA"),
("L-2-VSE","L-2","VSE"),
("L-2-NSA","L-2","NSA"),
("L-2-PLE","L-2","PLE"),
("L-2-ETA","L-2","ETA"),
("L-2-GYA","L-2","GYA"),
("L-2-TNA","L-2","TNA");

#Inserciones de la L-3 (omitimos Hidalgo(L-2) y Balderas (L-1))
INSERT INTO Estaciones VALUES 
("ISE","Indios Verdes","recursos/indiosVerdes.png"),
("DZO","Deportivo 18 de marzo","recursos/dep18Marzo.png"),
("PRO","Potrero","recursos/potrero.png"),
("LZA","La Raza","recursos/laRaza.png"),
("TCO","Tlatelolco","recursos/tlatelolco.png"),
("GRO","Guerrero","recursos/guerrero.png"),
("JZE","Juárez","recursos/juarez.png"), 
("NSE","Niños Héroes","recursos/ninosHeroes.png"),
("HLA","Hospital General","recursos/hospitalGeneral.png"),
("CCO","Centro Médico","recursos/centroMedico.png"),
("EPA","Etiopía/ Plaza de la Transparencia","recursos/etiopia.png"),
("ENI","Eugenia","recursos/eugenia.png"),
("DTE","División del Norte","recursos/divisionNorte.png"),
("ZTA","Zapata","recursos/zapata.png"),
("CNA","Coyoacán","recursos/coyoacan.png"),
("VSO","Viveros","recursos/viveros.png"),
("MDO","Miguel Ángel de Quevedo","recursos/miguelQuevedo.png"),
("CLO","Copilco","recursos/copilco.png"),
("UDA","Universidad","recursos/universidad.png");

#REL L-3 
INSERT INTO RelLineaEstacion VALUES 
("L-3-ISE","L-3","ISE"),
("L-3-DZO","L-3","DZO"),
("L-3-PRO","L-3","PRO"),
("L-3-LZA","L-3","LZA"),
("L-3-TCO","L-3","TCO"),
("L-3-GRO","L-3","GRO"),
("L-3-JZE","L-3","JZE"),
("L-3-NSE","L-3","NSE"),
("L-3-HLA","L-3","HLA"),
("L-3-CCO","L-3","CCO"),
("L-3-EPA","L-3","EPA"),
("L-3-ENI","L-3","ENI"),
("L-3-DTE","L-3","DTE"),
("L-3-ZTA","L-3","ZTA"),
("L-3-CNA","L-3","CNA"),
("L-3-VSO","L-3","VSO"),
("L-3-MDO","L-3","MDO"),
("L-3-CLO","L-3","CLO"),
("L-3-UDA","L-3","UDA");


#Inserciones de la L-4 (omitimos Candelaria(L-1))
INSERT INTO Estaciones VALUES 
("MRA","Martín Carrera","recursos/martinCarrera.png"),
("TAN","Talisman","recursos/talisman.png"),
("BTO","Bondojito","recursos/bondojito.png"),
("CDO","Consulado","recursos/consulador.png"),
("CTE","Canal del Norte","recursos/canalNorte.png"),
("MSO","Morelos","recursos/morelos.png"), 
("FDO","Fray Servando","recursos/frayServando.png"),
("JCA","Jamaica","recursos/jamaica.png"), 
("STA","Santa Anita","recursos/santaAnita.png"); 

#REL L-4 
INSERT INTO RelLineaEstacion VALUES
("L-4-MRA","L-4","MRA"),
("L-4-TAN","L-4","TAN"),
("L-4-BTO","L-4","BTO"),
("L-4-CDO","L-4","CDO"),
("L-4-CTE","L-4","CTE"),
("L-4-MSO","L-4","MSO"),
("L-4-FDO","L-4","FDO"),
("L-4-JCA","L-4","JCA"),
("L-4-STA","L-4","STA");

#Inserciones de la L-5 (omitimos Pantitlan(L-1), Consulado(L-4), La Raza(L-3))
INSERT INTO Estaciones VALUES 
("HES","Hangares","recursos/hangares.png"),
("TRA","Terminal Aerea","recursos/terminalAerea.png"),
("ONA","Oceania","recursos/oceania.png"),
("AGO","Aragon","recursos/aragon.png"),
("ENA","Eduardo Molina","recursos/eduardoMolina.png"),
("VME","Valle Gómez","recursos/valleGomez.png"),
("MRO","Misterios","recursos/misterios.png"),
("ATE","Autobuses del Norte","recursos/autobusesNorte.png"),
("ILO","Instituto del Petróleo","recursos/insPetroleo.png"),
("PCO","Politécnico","recursos/politecnico.png");

#REL L-5 
INSERT INTO RelLineaEstacion VALUES
("L-5-HES","L-5","HES"),
("L-5-TRA","L-5","TRA"),
("L-5-ONA","L-5","ONA"),
("L-5-AGO","L-5","AGO"),
("L-5-ENA","L-5","ENA"),
("L-5-VME","L-5","VME"),
("L-5-MRO","L-5","MRO"),
("L-5-ATE","L-5","ATE"),
("L-5-ILO","L-5","ILO"),
("L-5-PCO","L-5","PCO");

#Insercionces de la L-6 (omitimos Instituto del Petróleo(L-5), Dep 18 Marzo(L-3), Martín Carrera (L-4))
INSERT INTO Estaciones VALUES 
("RRO","Rosario","recursos/rosario.png"),
("TOC","Tezozomoc","recursos/tezozomoc.png"),
("ACO","Azcapotzalco","recursos/azcapotzalco.png"),
("FRA","Ferreria","recursos/ferreria.png"),
("N45","Norte 45","recursos/norte45.png"),
("VJO","Vallejo","recursos/vallejo.png"),
("LTA","Lindavista","recursos/lindavista.png"),
("LCA","La Villa-Basílica","recursos/villaBasilica.png");

#REL L-6
INSERT INTO RelLineaEstacion VALUES
("L-6-RRO","L-6","RRO"),
("L-6-TOC","L-6","TOC"),
("L-6-ACO","L-6","ACO"),
("L-6-FRA","L-6","FRA"),
("L-6-N45","L-6","N45"),
("L-6-VJO","L-6","VJO"),
("L-6-LTA","L-6","LTA"),
("L-6-LCA","L-6","LCA");

#Inserciones de la L-7 (omitimos Rosario(L-6), Tacuba(L-2))
INSERT INTO Estaciones VALUES 
("AAN","Aquíles Serdán","recursos/aquiles.png"),
("CES","Camarones","recursos/camarones.png"),
("RRA","Refinería","recursos/refineria.png"),
("SIN","San Joaquín","recursos/sanJoaquin.png"),
("PLO","Polanco","recursos/polanco.png"),
("ARO","Auditorio","recursos/auditorio.png"),
("CTS","Constituyentes","recursos/constituyentes.png"),
("SOS","San Pedro de los Pinos","recursos/sanPedro.png"),
("SNO","San Antonio","recursos/sanAntonio.png"),
("MAC","Mixcoac","recursos/mixcoac.png"),
("BMO","Barranca del Muerto","recursos/barrancaMuerto.png");

#REL L-7
INSERT INTO RelLineaEstacion VALUES
("L-7-AAN","L-7","AAN"),
("L-7-CES","L-7","CES"),
("L-7-RRA","L-7","RRA"),
("L-7-SIN","L-7","SIN"),
("L-7-PLO","L-7","PLO"),
("L-7-ARO","L-7","ARO"),
("L-7-CTS","L-7","CTS"),
("L-7-SOS","L-7","SOS"),
("L-7-SNO","L-7","SNO"),
("L-7-MAC","L-7","MAC"),
("L-7-BMO","L-7","BMO");

#Inserciones de la L-8 (omitimos Bellas Artes(L-2), Salto del Agua(L-1), Chabacano(L-2), Santa Anita(L-4), )
INSERT INTO Estaciones VALUES 
("GDI","Garibaldi","recursos/garibaldi.png"), 
("SAN","San Juan de Letrán","recursos/sanJuanLetran.png"),
("DES","Doctores","recursos/doctores.png"),
("ORA","Obrera","recursos/obrera.png"),
("LGA","La Viga","recursos/laViga.png"),
("CYA","Coyuya","recursos/coyuya.png"),
("ICO","Iztacalco","recursos/iztacalco.png"),
("APO","Apatlaco","recursos/apatlaco.png"),
("ALO","Aculco","recursos/aculco.png"),
("E01","Escuadron 201","recursos/escuadron201.png"),
("ALI","Atlalilco","recursos/atlalilco.png"),
("IPA","Iztapalapa","recursos/iztapalapa.png"),
("CLA","Cerro de la Estrella","recursos/cerroEstrella.png"),
("UAM","UAM-I","recursos/uamI.png"),
("C17","Constitución de 1917","recursos/constitucion1917.png");

#REL L-8
INSERT INTO RelLineaEstacion VALUES
("L-8-GDI","L-8","GDI"),
("L-8-SAN","L-8","SAN"),
("L-8-DES","L-8","DES"),
("L-8-ORA","L-8","ORA"),
("L-8-LGA","L-8","LGA"),
("L-8-CYA","L-8","CYA"),
("L-8-ICO","L-8","ICO"),
("L-8-APO","L-8","APO"),
("L-8-ALO","L-8","ALO"),
("L-8-E01","L-8","E01"),
("L-8-ALI","L-8","ALI"),
("L-8-IPA","L-8","IPA"),
("L-8-CLA","L-8","CLA"),
("L-8-UAM","L-8","UAM"),
("L-8-C17","L-8","C17");

#Inserciones de la L-9 (omitimos Tacubaya(L-1), Centro Médico(L-3), Chabacano(L-2), Jamaica(L-4), Pantitlan(L-1) )
INSERT INTO Estaciones VALUES 
("PMO","Patriotismo","recursos/patriotismo.png"),
("CGO","Chilpancingo","recursos/chilpancingo.png"),
("LAS","Lázaro Cardenas","recursos/lazaroCardenas.png"),
("MCA","Mixiuhca","recursos/mixiuhca.png"),
("VMO","Velódromo","recursos/velodromo.png"),
("CVA","Ciudad Deportiva","recursos/ciudadDeportiva.png"),
("PBA","Puebla","recursos/puebla.png");

#REL L-9
INSERT INTO RelLineaEstacion VALUES
("L-9-PMO","L-9","PMO"),
("L-9-CGO","L-9","CGO"),
("L-9-LAS","L-9","LAS"),
("L-9-MCA","L-9","MCA"),
("L-9-VMO","L-9","VMO"),
("L-9-CVA","L-9","CVA"),
("L-9-PBA","L-9","PBA");

#Inserciones de la L-12 (omitimos Mixcoac(L-7), Zapata(L-3), Ermita(L-2), Atlilco(L-8) )
INSERT INTO Estaciones VALUES 
("IUR","Insurgentes Sur","recursos/insurgentesSur.png"),
("HRE","Hospital 20 de Noviembre","recursos/hospital20.png"),
("PDO","Parque de los Venados","recursos/parqueVenados.png"),
("EAL","Eje Central","recursos/ejeCentral.png"),
("MGO","Mexicaltzingo","recursos/mexicaltzingo.png"),
("CAN","Culhuacan","recursos/culhuacan.png"),
("SAT","San Andrés Tomalán","recursos/sanAndresTomalan.png"),
("LLA","Lomas Estrella","recursos/lomasEstrella.png"),
("C11","Calle 11","recursos/calle1.png"),
("POT","Periférico Oriente","recursos/perifericoOriente.png"),
("TZO","Tezonco","recursos/tezonco.png"),
("OVO","Olivos","recursos/olivos.png"),
("NRA","Nopalera","recursos/nopalera.png"),
("ZAN","Zapotitlan","recursos/zapotitlan.png"),
("TGO","Tlaltengo","recursos/tlaltengo.png"),
("TAC","Tlahuac","recursos/tlahuac.png");

#REL L-12
INSERT INTO RelLineaEstacion VALUES
("L-12-PMO","L-12","PMO"),
("L-12-IUR","L-12","IUR"),
("L-12-HRE","L-12","HRE"),
("L-12-PDO","L-12","PDO"),
("L-12-EAL","L-12","EAL"),
("L-12-MGO","L-12","MGO"),
("L-12-CAN","L-12","CAN"),
("L-12-SAT","L-12","SAT"),
("L-12-LLA","L-12","LLA"),
("L-12-C11","L-12","C11"),
("L-12-POT","L-12","POT"),
("L-12-TZO","L-12","TZO"),
("L-12-OVO","L-12","OVO"),
("L-12-NRA","L-12","NRA"),
("L-12-ZAN","L-12","ZAN"),
("L-12-TGO","L-12","TGO"),
("L-12-TAC","L-12","TAC");

#Inserciones de la L-A (omitimos Pantitlan(L-1) )
INSERT INTO Estaciones VALUES 
("AAL","Agrícola Oriental","recursos/agricolaOriental.png"),
("CSJ","Canal de San Juan","recursos/canalSanJuan.png"),
("TTS","Tepalcates","recursos/tepalcates.png"),
("GTO","Guelatao","recursos/guelatao.png"),
("PJO","Peñón Viejo","recursos/penonViejo.png"),
("ALA","Acatitla","recursos/acatitla.png"),
("SMA","Santa Marta","recursos/santaMarta.png"),
("LYE","Los Reyes","recursos/reyes.png"),
("LPZ","La Paz","recursos/laPaz.png");

#REL L-A
INSERT INTO RelLineaEstacion VALUES
("L-A-AAL","L-A","AAL"),
("L-A-CSJ","L-A","CSJ"),
("L-A-TTS","L-A","TTS"),
("L-A-GTO","L-A","GTO"),
("L-A-PJO","L-A","PJO"),
("L-A-ALA","L-A","ALA"),
("L-A-SMA","L-A","SMA"),
("L-A-LYE","L-A","LYE"),
("L-A-LPZ","L-A","LPZ");

#Inserciones de la L-B (omitimos Oceania(L-5), San Lazaro(L-1), Morelos(L-4), Garibaldi(L-8), Guerrero(L-3) )
INSERT INTO Estaciones VALUES 
("CAZ","Ciudad Azteca","recursos/ciudadAzteca.png"),
("PON","Plaza Aragón","recursos/p.png"),
("OCA","Olímpica","recursos/olimpica.png"),
("MIZ","Múzquiz","recursos/muzquiz.png"),
("RIO","Río de los remedios","recursos/rioRemedios.png"),
("IRA","Impulsora","recursos/impulsora.png"),
("NZA","Nezahualcóyotl","recursos/neza.png"),
("VON","Villa de Aragón","recursos/villaAragon.png"),
("BON","Bosque de Aragón","recursos/bosqueAragon.png"),
("DIA","Deportivo Oceanía","recursos/deportivoOceania.png"),
("RUO","Romero Rubio","recursos/romeroRubio.png"),
("RFM","Ricardo Flores Magón","recursos/rFloresMagon.png"),
("TTO","Tepito","recursos/tepito.png"),
("LGU","Lagunilla","recursos/lagunilla.png"),
("BTA","Buenavista","recursos/buenavista.png");

#REL L-B
INSERT INTO RelLineaEstacion VALUES
("L-B-CAZ","L-B","CAZ"),
("L-B-PON","L-B","PON"),
("L-B-OCA","L-B","OCA"),
("L-B-MIZ","L-B","MIZ"),
("L-B-RIO","L-B","RIO"),
("L-B-IRA","L-B","IRA"),
("L-B-NZA","L-B","NZA"),
("L-B-VON","L-B","VON"),
("L-B-BON","L-B","BON"),
("L-B-DIA","L-B","DIA"),
("L-B-RUO","L-B","RUO"),
("L-B-RFM","L-B","RFM"),
("L-B-TTO","L-B","TTO"),
("L-B-LGU","L-B","LGU"),
("L-B-BTA","L-B","BTA");

#REL TRANSBORDO 
INSERT INTO RelLineaEstacion VALUES
("L-7-TYA","L-7","TYA"),
("L-9-TYA","L-9","TYA"),
("L-3-BRA","L-3","BRA"),
("L-8-SGA","L-8","SGA"),
("L-4-CRA","L-4","CRA"),
("L-B-SRO","L-B","SRO"),
("L-5-PNA","L-5","PNA"),
("L-9-PNA","L-9","PNA"),
("L-A-PNA","L-A","PNA"),
("L-7-TBA","L-7","TBA"),
("L-3-HGO","L-3","HGO"),
("L-8-BSE","L-8","BSE"),
("L-8-CNO","L-8","CNO"),
("L-9-CNO","L-9","CNO"),
("L-6-DZO","L-6","DZO"),
("L-5-LZA","L-5","LZA"),
("L-B-GRO","L-B","GRO"),
("L-9-CCO","L-9","CCO"),
("L-6-MRA","L-6","MRA"),
("L-5-CDO","L-5","CDO"),
("L-B-MSO","L-B","MSO"),
("L-9-JCA","L-9","JCA"),
("L-8-STA","L-8","STA"),
("L-B-ONA","L-B","ONA"),
("L-6-ILO","L-6","ILO"),
("L-B-GDI","L-B","GDI"),
("L-12-ALI","L-12","ALI");


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

select A.no_Averia AS Numero_Averia,
					UReporta.nombre AS Reporto,
					URecibe.nombre AS Recibio from Averia A JOIN RelEstadoAveria REA ON A.no_Averia = REA.no_Averia JOIN RelUsrAveria RUA ON A.no_Averia = RUA.no_Averia
LEFT JOIN Usuario UReporta ON RUA.no_Trabajador = UReporta.no_Trabajador
  AND RUA.id_Rol_Reporte = (
    SELECT id_Rol_Reporte 
    FROM RolReporte 
    WHERE rol_Reporte = 'Reporta'
  )
LEFT JOIN Usuario URecibe ON RUA.no_Trabajador = URecibe.no_Trabajador
  AND RUA.id_Rol_Reporte = (
    SELECT id_Rol_Reporte 
    FROM RolReporte 
    WHERE rol_Reporte = 'Recibe'
  );

  
                        
SELECT *
FROM Averia A
JOIN RelUsrAveria RUA ON A.no_Averia = RUA.no_Averia
LEFT JOIN Usuario UReporta ON RUA.no_Trabajador = UReporta.no_Trabajador
  AND RUA.id_Rol_Reporte = (
    SELECT id_Rol_Reporte 
    FROM RolReporte 
    WHERE rol_Reporte = 'Reporta'
  )
LEFT JOIN Usuario URecibe ON RUA.no_Trabajador = URecibe.no_Trabajador
  AND RUA.id_Rol_Reporte = (
    SELECT id_Rol_Reporte 
    FROM RolReporte 
    WHERE rol_Reporte = 'Recibe'
  );

select * from RelHorarioAveria;
select * from RelUsrAveria;
select * from RolReporte;
select * from modificaciones;
select * from estado;
select @no_trabajador;
select * from Averia;

CALL info_C_Averia();
        