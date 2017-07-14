# db_poblacions

Projecte que proporciona la informació de totes les províncies, municipis i codis postals de totes les poblacions espanyoles utilitzant la informació de l'INE (Institut Nacional d'Estadística).

Els scripts d'aquest projecte es troben en MySQL.

Aquest projecte conté:
- Un script preparat per importar tots els països del món.
- Un script preparat per generar 3 taules a la base de dades.
    -  provincies
    -  municipis
    -  codis_postals
- Les passes que cal seguir per generar l'script amb dades més actualitzades de l'INE.

## Script: importar estructura i dades

Dins del directori `./script`, es troba:
- Un fitxer amb el nom `db_paisos.sql` que permet generar una taula amb el nom de tots els països.
- Un fitxer amb el nom `db_poblacions.sql` que permet generar l'estructura de les 3 taules i omplir-les amb la informació sobre totes les províncies, municipis i codis postals.


## Generar l'script

A continuació es descriuen els passos que cal seguir per obtenir les dades més actualitzades des de l'INE i poder generar-se de nou l'script.

### 1 - Obtenir les dades de l'INE

Cal obtenir dos fitxers des de la pàgina web de l'INE:
- [Relación de municipios y códigos por provincias - Fichero con todas las províncias (Fitxer Excel)][ine-municipis]
- [Callejero del Censo Electoral - Ficheros provinciales (Fitxer ZIP)][ine-callejero]

### 2 - Crear script de ine_municipis.sql
#### 2.1 - Crear taula
Crearem una taula temporal a la base de dades amb la següent estructura:
````sql
CREATE TABLE tmp_municipis (
  id_autonomia VARCHAR( 2 ) NOT NULL,
  id_provincia VARCHAR( 2 ) NOT NULL,
  id_municipi VARCHAR( 3 ) NOT NULL,
  dc VARCHAR( 1 ) NOT NULL,
  nom VARCHAR( 50 ) NOT NULL
)
````

#### 2.2 - Dades de la taula
El fitxer Excel que ens hem descarregat anteriorment, conté el nom de totes les poblacions espanyoles.

Guardarem el fitxer Excel en format `.CSV` amb tota la informació, però sense la capçalera i els títols de les columnes (Files 1 i 2 de l'Excel). Recomanem utilitzar `;` com a delimitadors.

````txt
Relación de municipios y códigos por comunidades autónomas y provincias a 1 de enero de 2017;;;;
CODAUTO;CPRO;CMUN;DC;NOMBRE
16;01;051;3;Agurain/Salvatierra
16;01;001;4;Alegría-Dulantzi
16;01;002;9;Amurrio
16;01;049;3;Añana
16;01;003;5;Aramaio
...
19;52;001;8;Melilla
````

Utilitzar un editor de text (Notepad++, vi, nano, etc.) per editar el format de les files i arribar a un resultat com aquesta estructura:

````txt
('16','01','051','3','Agurain/Salvatierra'),
('16','01','001','4','Alegría-Dulantzi'),
('16','01','002','9','Amurrio'),
('16','01','049','3','Añana'),
('16','01','003','5','Aramaio'),
...
('19','52','001','8','Melilla');
````
Afegim a la primera fila del document la sentència `INSERT`:

````sql
INSERT INTO tmp_municipis (id_autonomia, id_provincia, id_municipi, dc, nom) VALUES
('16','01','051','3','Agurain/Salvatierra'),
('16','01','001','4','Alegría-Dulantzi'),
('16','01','002','9','Amurrio'),
('16','01','049','3','Añana'),
('16','01','003','5','Aramaio'),
...
('19','52','001','8','Melilla');
````

Finalment executem l'script que acabem de confeccionar a la nostra base de dades.

### 3 - Crear script de ine_codispostals.sql

#### 3.1 Descomprimir el ZIP

Descomprimim el fitxer ZIP que ens hem descarregat des de la web de l'INE.

A dins hi trobarem diferents fitxers.
Nosaltres utilitzarem el fitxer que porta per nom `TRAMOS-NAL.F161231` (el nom pot variar lleugerament).

El fitxer pot superar les 500 MB i conté la informació de tots els carrers i vies espanyoles amb les dades delimitades per columnes per amplada fixa.

#### 3.2 Extreure informació del fitxer
Treballarem amb part de la informació que ens proporciona aquest fitxer:
- Extreurem la informació d'algunes columnes
- Agruparem parcialment la informació

A través d'una terminal de Linux i amb la comanda `gawk` podrem extreure la informació necessària:
````sh
$ gawk '$1=$1' FIELDWIDTHS='2 3 37 5 63 25 122 5' OFS=_ NOM-DEL-FITXER-ORIGEN | cut -d"_" -f1,2,4,6 | sort | uniq > NOM-DEL-FITXER-DESTI
````
La comanda realitza les següents operacions:

- Separem el contingut amb el caràcter `_` les següents amplades de columna:

    | Núm. caràcters | Descripció | Nom columna |
    | ------ | ------ | ------ |
    | 2   | codi de provincia | id_provincia |
    | 3   | codi municipi | id_municipi |
    | 37  | - altres valors - | - - -  |
    | 5   | codi postal | codi_postal |
    | 63  | - altres valors - | - - - |
    | 25  | nom | nom |
    | 122 | - altres valors - | - - - |
    | 5 | - altres valors - | - - - |

- Ens quedarem amb les columnes: 1, 2, 4 i 6.
- Ordenem i agrupem.
- Guardem el resultat en un fitxer de sortida.

#### 3.3 Crear taula

Crearem una taula temporal a la base de dades amb la següent estructura:

````sql
CREATE TABLE tmp_codispostals (
  id_provincia VARCHAR( 2 ) NOT NULL,
  id_municipi VARCHAR( 3 ) NOT NULL,
  codi_postal VARCHAR( 5 ) NOT NULL,
  nom VARCHAR( 50 ) NOT NULL
)
````

#### 3.4 Dades de la taula

Igualment que en el punt 2.2, formatarem el fitxer resultant amb un editor (Notepad++, vi, nano, etc.) per obtenir la següent estructura:

````sql
INSERT INTO tmp_codispostals (id_provincia, id_municipi, codi_postal, nom) VALUES
('01','001','01193','EGILETA'),
('01','001','01240','ALEGRIA-DULANTZI'),
('01','002','01450','BARANBIO'),
...
('52','001','52006','MELILLA');
````

Finalment executem l’script que acabem de confeccionar a la nostra base de dades.

### 4 - Crear taules i importar dades
#### 4.1 - Crear taules i relacions

Executar el següent script, que crearà les taules i relacions entre elles de:
- provincies
- municipis
- codis_postals

````sql
CREATE TABLE `provincies` (
  `codi_provincia` varchar(2) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codi_provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `municipis` (
  `codi_municipi` varchar(3) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `codi_provincia` varchar(2) NOT NULL,
  PRIMARY KEY (`codi_municipi`,`codi_provincia`),
  KEY `fk_municipis_provincies_idx` (`codi_provincia`),
  CONSTRAINT `fk_municipis_provincies` FOREIGN KEY (`codi_provincia`) REFERENCES `provincies` (`codi_provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `codis_postals` (
  `id_codi_postal` int(11) NOT NULL AUTO_INCREMENT,
  `codi_postal` varchar(5) NOT NULL,
  `codi_municipi` varchar(3) NOT NULL,
  `codi_provincia` varchar(2) NOT NULL,
  PRIMARY KEY (`id_codi_postal`),
  KEY `fk_codis_postals_municipis_idx` (`codi_municipi`,`codi_provincia`),
  KEY `fk_codis_postals_provincies_idx` (`codi_provincia`),
  CONSTRAINT `fk_codis_postals_municipis` FOREIGN KEY (`codi_municipi`) REFERENCES `municipis` (`codi_municipi`),
  CONSTRAINT `fk_codis_postals_provincies` FOREIGN KEY (`codi_provincia`) REFERENCES `provincies` (`codi_provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
````

#### 4.2 - Importar dades a partir de les taules temporals

A partir de les dades temporals que hem creat en els punts 2 i 3 d'aquesta documentació, importarem la informació a les taules que hem acabat de crear.

##### 4.2.1 - Províncies
Afegim totes les provínces espanyoles a la taula `provincies`:
````sql
INSERT INTO `provincies` VALUES ('01','Araba/Álava'),('02','Albacete'),('03','Alicante/Alacant'),('04','Almería'),('05','Ávila'),('06','Badajoz'),('07','Balears, Illes'),('08','Barcelona'),('09','Burgos'),('10','Cáceres'),('11','Cádiz'),('12','Castellón/Castelló'),('13','Ciudad Real'),('14','Córdoba'),('15','Coruña, A'),('16','Cuenca'),('17','Girona'),('18','Granada'),('19','Guadalajara'),('20','Gipuzkoa'),('21','Huelva'),('22','Huesca'),('23','Jaén'),('24','León'),('25','Lleida'),('26','Rioja, La'),('27','Lugo'),('28','Madrid'),('29','Málaga'),('30','Murcia'),('31','Navarra'),('32','Ourense'),('33','Asturias'),('34','Palencia'),('35','Palmas, Las'),('36','Pontevedra'),('37','Salamanca'),('38','Santa Cruz de Tenerife'),('39','Cantabria'),('40','Segovia'),('41','Sevilla'),('42','Soria'),('43','Tarragona'),('44','Teruel'),('45','Toledo'),('46','Valencia/València'),('47','Valladolid'),('48','Bizkaia'),('49','Zamora'),('50','Zaragoza'),('51','Ceuta'),('52','Melilla');
````

##### 4.2.2 - Municipis

Afegim tots els municipis espanyols a la taula de `municipis` a partir de la informació de la taula `tmp_municipis`:

````sql
INSERT INTO municipis (codi_municipi, nom, codi_provincia)
SELECT id_municipi as 'codi_municipi', nom as 'nom', id_provincia as 'codi_provincia'
FROM tmp_municipis
ORDER BY id_provincia, id_municipi, nom
````

##### 4.2.3 - Codis postals
Afegim tots els codis postals espanyols a la taula de `codis_postals` a partir de la informació de la taula `tmp_codispostals`:
````sql
INSERT INTO codis_postals (id_codi_postal, codi_postal, codi_provincia, codi_municipi)
SELECT 0 as 'id_codi_postal', codi_postal as 'codi_postal', id_provincia as 'codi_provincia', id_municipi as 'codi_municipi'
FROM tmp_codispostals
GROUP BY id_provincia, codi_municipi, codi_postal
ORDER BY id_provincia, id_municipi, codi_postal
````

[ine-municipis]: <http://www.ine.es/daco/daco42/codmun/codmunmapa.htm>
[ine-callejero]: <http://www.ine.es/ss/Satellite?L=es_ES&c=Page&cid=1254735624326&p=1254735624326&pagename=ProductosYServicios%2FPYSLayout>
