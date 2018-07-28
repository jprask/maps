DROP SCHEMA IF EXISTS MEGA;

CREATE SCHEMA IF NOT EXISTS MEGA;

USE MEGA;

DROP TABLE IF EXISTS map_elements;

CREATE TABLE IF NOT EXISTS map_elements (
  id INT NOT NULL AUTO_INCREMENT,
  icon VARCHAR(50) NULL,
  elmt_name VARCHAR(25) NULL,
  elmt_desc VARCHAR(100) NULL,
  
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS coords;

CREATE TABLE IF NOT EXISTS coords (
  id INT NOT NULL AUTO_INCREMENT,
  element_id INT NOT NULL,
  lat DOUBLE NOT NULL,
  lng DOUBLE NOT NULL,
  marker BOOLEAN NOT NULL,
  
  PRIMARY KEY(id),
  FOREIGN KEY (element_id) REFERENCES map_elements(id)
  ON UPDATE NO ACTION
  ON DELETE CASCADE
);

SET @casalat = -29.687634;
SET @casalng = -53.8129003;
SET @rodolat =  -29.7014659;
SET @rodolng = -53.7964918;
SET @megalat = -29.6874375;
SET @megalng = -53.8082031;
SET @ufnlat = -29.6847598;
SET @ufnlng = -53.8108021;
SET @rocklat = -29.7093288;
SET @rocklng = -53.8144805;

-- Markers (PONTOS)
#Ponto casa
INSERT INTO map_elements (id, icon, elmt_name, elmt_desc) VALUES (1, 'home', 'Casa', 'Eu moro aqui!');
INSERT INTO coords (id, element_id, lat, lng, marker) VALUES (NULL, 1, @casalat, @casalng, true);
#Ponto rodoviária
INSERT INTO map_elements (id, icon, elmt_name, elmt_desc) VALUES (2, 'commute', 'Rodoviaria', 'Alto movimento de ônibus!');
INSERT INTO coords (id, element_id, lat, lng, marker) VALUES (NULL, 2, @rodolat, @rodolng, true);
#Ponto MEGA
INSERT INTO map_elements (id, icon, elmt_name, elmt_desc) VALUES (3, 'code', 'MEGA', 'A empresa MEGA tecnologia desenvolve software de qualidade!');
INSERT INTO coords (id, element_id, lat, lng, marker) VALUES (NULL, 3, @megalat, @megalng, true);
#Ponto UFN
INSERT INTO map_elements (id, icon, elmt_name, elmt_desc) VALUES (4, 'school', 'UFN', 'Aqui fica a universidade Franciscana!');
INSERT INTO coords (id, element_id, lat, lng, marker) VALUES (NULL, 4, @ufnlat, @ufnlng, true);
#Ponto Rockers
INSERT INTO map_elements (id, icon, elmt_name, elmt_desc) VALUES (5, 'whatshot', 'Rockers', 'Entrada franca para estudantes!');
INSERT INTO coords (id, element_id, lat, lng, marker) VALUES (NULL, 5, @rocklat, @rocklng, true);

-- Polylines (TRAÇOS)
#Traço Casa - Rodoviária
INSERT INTO map_elements (id, icon, elmt_name, elmt_desc) VALUES (6, NULL, 'Casa-rodoviária', 'Para quando precisar de ônibus');
INSERT INTO coords (id, element_id, lat, lng, marker) VALUES (NULL, 6, @casalat, @casalng, false);
INSERT INTO coords (id, element_id, lat, lng, marker) VALUES (NULL, 6, @rodolat, @rodolng, false);
#Traço Casa - MEGA
INSERT INTO map_elements (id, icon, elmt_name, elmt_desc) VALUES (7, NULL, 'Casa-MEGA', 'Para chegar ao trabalho');
INSERT INTO coords (id, element_id, lat, lng, marker) VALUES (NULL, 7, @casalat, @casalng, false);
INSERT INTO coords (id, element_id, lat, lng, marker) VALUES (NULL, 7, @megalat, @megalng, false);
#Traço Casa - UFN
INSERT INTO map_elements (id, icon, elmt_name, elmt_desc) VALUES (8, NULL, 'Casa-UFN', 'Para ir á aula');
INSERT INTO coords (id, element_id, lat, lng, marker) VALUES (NULL, 8, @casalat, @casalng, false);
INSERT INTO coords (id, element_id, lat, lng, marker) VALUES (NULL, 8, @ufnlat, @ufnlng, false);
#Traço Casa - Rockers
INSERT INTO map_elements (id, icon, elmt_name, elmt_desc) VALUES (9, NULL, 'Casa-Rockers', 'Para fazer festa');
INSERT INTO coords (id, element_id, lat, lng, marker) VALUES (NULL, 9, @casalat, @casalng, false);
INSERT INTO coords (id, element_id, lat, lng, marker) VALUES (NULL, 9, @rocklat, @rocklat, false);