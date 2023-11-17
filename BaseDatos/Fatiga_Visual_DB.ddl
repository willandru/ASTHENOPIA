CREATE TABLE `Actividad Visual` (ID_ACTV int(10) NOT NULL AUTO_INCREMENT, ExperimentoID_EXP int(10) NOT NULL, ExperimentoID_PARTICIPANTE int(10) NOT NULL, Tamaño_Pantalla float NOT NULL, Distancia float NOT NULL, Luminosidad float, `Dificultad Visual` int(2) NOT NULL, PRIMARY KEY (ID_ACTV));
CREATE TABLE `CVS-Questionare` (ID_CVS int(10) NOT NULL AUTO_INCREMENT, ParticipantesID_PARTICIPANTE int(10) NOT NULL, Fecha date NOT NULL, Hora time(15) NOT NULL, `Puntaje CVS` int(3) NOT NULL, PRIMARY KEY (ID_CVS));
CREATE TABLE Experimento (ID_EXP int(10) NOT NULL, ID_PARTICIPANTE int(10) NOT NULL, Fecha date NOT NULL, Hora_Inicio time(15) NOT NULL, Hora_Fin time(15) NOT NULL, Temperatura float, Humedad float, PRIMARY KEY (ID_EXP, ID_PARTICIPANTE));
CREATE TABLE `Lentes autoenfocables` (ID_OPTOTUNE int(10) NOT NULL AUTO_INCREMENT, ExperimentoID_PARTICIPANTE int(10) NOT NULL, ExperimentoID_EXP int(10) NOT NULL, Instante_Tiempo timestamp(15) NOT NULL, Potencia_Izquierdo float NOT NULL, Potencia_Derecho float NOT NULL, Frecuencia_Muestreo int(5) NOT NULL, PRIMARY KEY (ID_OPTOTUNE));
CREATE TABLE Participantes (ID_PARTICIPANTE int(10) NOT NULL AUTO_INCREMENT, `Nombre y Apellido` varchar(50) NOT NULL UNIQUE, Edad int(2) NOT NULL, Género varchar(1) NOT NULL, Altura float NOT NULL, Peso float NOT NULL, `Lentes de Contacto` bit(1) NOT NULL, Anteojos bit(1) NOT NULL, PRIMARY KEY (ID_PARTICIPANTE));
CREATE TABLE `Prueba de Snellen` (ID_SN int(10) NOT NULL AUTO_INCREMENT, ParticipantesID_PARTICIPANTE int(10) NOT NULL, Fecha date NOT NULL, Hora time(15) NOT NULL, `Agudeza Visual` varchar(30) NOT NULL, PRIMARY KEY (ID_SN));
CREATE TABLE Video (ID_VIDEO int(10) NOT NULL AUTO_INCREMENT, ExperimentoID_EXP int(10) NOT NULL, ExperimentoID_PARTICIPANTE int(10) NOT NULL, Link_Video varchar(255) NOT NULL, PRIMARY KEY (ID_VIDEO));
ALTER TABLE Video ADD CONSTRAINT graba FOREIGN KEY (ExperimentoID_EXP, ExperimentoID_PARTICIPANTE) REFERENCES Experimento (ID_EXP, ID_PARTICIPANTE);
ALTER TABLE Experimento ADD CONSTRAINT hace FOREIGN KEY (ID_PARTICIPANTE) REFERENCES Participantes (ID_PARTICIPANTE);
ALTER TABLE `CVS-Questionare` ADD CONSTRAINT llenan FOREIGN KEY (ParticipantesID_PARTICIPANTE) REFERENCES Participantes (ID_PARTICIPANTE);
ALTER TABLE `Prueba de Snellen` ADD CONSTRAINT realizan FOREIGN KEY (ParticipantesID_PARTICIPANTE) REFERENCES Participantes (ID_PARTICIPANTE);
ALTER TABLE `Lentes autoenfocables` ADD CONSTRAINT registra FOREIGN KEY (ExperimentoID_EXP, ExperimentoID_PARTICIPANTE) REFERENCES Experimento (ID_EXP, ID_PARTICIPANTE);
ALTER TABLE `Actividad Visual` ADD CONSTRAINT tiene FOREIGN KEY (ExperimentoID_EXP, ExperimentoID_PARTICIPANTE) REFERENCES Experimento (ID_EXP, ID_PARTICIPANTE);

