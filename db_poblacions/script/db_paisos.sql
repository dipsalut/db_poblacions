/*
CREATE TABLE `paisos` (
  `codi_pais` VARCHAR(2) NOT NULL,
  `nom` VARCHAR(50) NULL,
PRIMARY KEY (`codi_pais`));
*/

INSERT INTO paisos (codi_pais, nom) VALUES
('AF','Afganistan'),
('AX','Aland'),
('AL','Albània'),
('DE','Alemanya'),
('DZ','Algèria'),
('AD','Andorra'),
('AO','Angola'),
('AI','Anguilla'),
('AG','Antigua i Barbuda'),
('AQ','Antàrtida'),
('AR','Argentina'),
('AM','Armènia'),
('AW','Aruba'),
('SA','Aràbia Saudí'),
('AU','Austràlia'),
('AZ','Azerbaidjan'),
('BS','Bahames, les'),
('BH','Bahrain'),
('BD','Bangladesh'),
('BB','Barbados'),
('BY','Belarús'),
('BZ','Belize'),
('BJ','Benín'),
('BM','Bermudes'),
('BT','Bhutan'),
('BO','Bolívia'),
('BQ','Bonaire, Sint Eustatius i Saba'),
('BW','Botswana'),
('BR','Brasil'),
('BN','Brunei'),
('BG','Bulgària'),
('BF','Burkina Faso'),
('BI','Burundi'),
('BE','Bèlgica'),
('BA','Bòsnia i Hercegovina'),
('KH','Cambodja'),
('CM','Camerun'),
('CA','Canadà'),
('CV','Cap Verd'),
('CO','Colòmbia'),
('KM','Comores, les'),
('CG','Congo'),
('KP','Corea del Nord'),
('KR','Corea del Sud'),
('CR','Costa Rica'),
('CI','Costa d\'Ivori'),
('HR','Croàcia'),
('CU','Cuba'),
('CW','Curaçao'),
('DK','Dinamarca'),
('DJ','Djibouti'),
('DM','Dominica'),
('EG','Egipte'),
('SV','El Salvador'),
('AE','Emirats Àrabs Units, els'),
('EC','Equador'),
('ER','Eritrea'),
('SK','Eslovàquia'),
('SI','Eslovènia'),
('ES','Espanya'),
('US','Estats Units, els'),
('EE','Estònia'),
('ET','Etiòpia'),
('FJ','Fiji'),
('PH','Filipines'),
('FI','Finlàndia'),
('FR','França'),
('FO','Fèroe'),
('GA','Gabon'),
('GE','Geòrgia'),
('GH','Ghana'),
('GI','Gibraltar'),
('GD','Grenada'),
('GL','Groenlàndia'),
('GR','Grècia'),
('GP','Guadalupe'),
('GF','Guaiana Francesa'),
('GU','Guam'),
('GT','Guatemala'),
('GG','Guernsey'),
('GN','Guinea'),
('GQ','Guinea Equatorial'),
('GW','Guinea-Bissau'),
('GY','Guyana'),
('GM','Gàmbia'),
('HT','Haití'),
('HN','Hondures'),
('HK','Hong Kong, Xina'),
('HU','Hongria'),
('YE','Iemen, el'),
('BV','Illa Bouvet'),
('CX','Illa Christmas'),
('NF','Illa Norfolk'),
('IM','Illa de Man'),
('KY','Illes Caiman'),
('CC','Illes Cocos (Keeling)'),
('CK','Illes Cook'),
('FK','Illes Falkland (Malvines)'),
('GS','Illes Geòrgia del Sud i Sandwich del Sud'),
('HM','Illes Heard i McDonald'),
('MP','Illes Marianes del Nord'),
('MH','Illes Marshall'),
('UM','Illes Menors Allunyades dels Estats Units'),
('SB','Illes Salomó'),
('TC','Illes Turks i Caicos'),
('VG','Illes Verges Britàniques'),
('VI','Illes Verges dels Estats Units'),
('ID','Indonèsia'),
('IR','Iran'),
('IQ','Iraq, l\''),
('IE','Irlanda'),
('IS','Islàndia'),
('IL','Israel'),
('IT','Itàlia'),
('JM','Jamaica'),
('JP','Japó'),
('JE','Jersey'),
('JO','Jordània'),
('KZ','Kazakhstan'),
('KE','Kenya'),
('KG','Kirguizstan'),
('KI','Kiribati'),
('KW','Kuwait'),
('LA','Lao'),
('LS','Lesotho'),
('LV','Letònia'),
('LR','Libèria'),
('LI','Liechtenstein'),
('LT','Lituània'),
('LU','Luxemburg'),
('LB','Líban'),
('LY','Líbia'),
('MO','Macao, Xina'),
('MK','Macedònia'),
('MG','Madagascar'),
('MW','Malawi'),
('MV','Maldives'),
('ML','Mali'),
('MT','Malta'),
('MY','Malàisia'),
('MA','Marroc, el'),
('MQ','Martinica'),
('MU','Maurici'),
('MR','Mauritània'),
('YT','Mayotte'),
('FM','Micronèsia'),
('MD','Moldàvia'),
('MN','Mongòlia'),
('ME','Montenegro'),
('MS','Montserrat'),
('MZ','Moçambic'),
('MM','Myanmar'),
('MX','Mèxic'),
('MC','Mònaco'),
('NA','Namíbia'),
('NR','Nauru'),
('NP','Nepal'),
('NI','Nicaragua'),
('NG','Nigèria'),
('NU','Niue'),
('NO','Noruega'),
('NC','Nova Caledònia'),
('NZ','Nova Zelanda'),
('NE','Níger'),
('OM','Oman'),
('PK','Pakistan'),
('PW','Palau'),
('PS','Palestina'),
('PA','Panamà'),
('PG','Papua Nova Guinea'),
('PY','Paraguai'),
('NL','Països Baixos'),
('PE','Perú'),
('PN','Pitcairn'),
('PF','Polinèsia Francesa'),
('PL','Polònia'),
('PT','Portugal'),
('PR','Puerto Rico'),
('QA','Qatar'),
('GB','Regne Unit'),
('CF','República Centreafricana'),
('CD','República Democràtica del Congo'),
('DO','República Dominicana'),
('RE','Reunió, la'),
('RO','Romania'),
('RW','Ruanda'),
('RU','Rússia'),
('SH','Saint Helena, Ascenció i Tristan da Cunha'),
('KN','Saint Kitts i Nevis'),
('LC','Saint Lucia'),
('VC','Saint Vincent i les Grenadines'),
('BL','Saint-Barthélemy'),
('MF','Saint-Martin'),
('PM','Saint-Pierre-et-Miquelon'),
('WS','Samoa'),
('AS','Samoa Americana'),
('SM','San Marino'),
('VA','Santa Seu'),
('SN','Senegal'),
('SC','Seychelles'),
('SL','Sierra Leone'),
('SG','Singapur'),
('SX','Sint Maarten'),
('SO','Somàlia'),
('LK','Sri Lanka'),
('ZA','Sud-àfrica'),
('SS','Sudan del Sud, el'),
('SD','Sudan, el'),
('SR','Surinam'),
('SE','Suècia'),
('CH','Suïssa'),
('SJ','Svalbard i Jan Mayen'),
('SZ','Swaziland'),
('EH','Sàhara Occidental'),
('ST','São Tomé i Príncipe'),
('RS','Sèrbia'),
('SY','Síria'),
('TJ','Tadjikistan'),
('TH','Tailàndia'),
('TW','Taiwan'),
('TZ','Tanzània'),
('TF','Terres Australs i Antàrtiques Franceses'),
('IO','Territori Britànic de l\'Oceà Índic'),
('TL','Timor-Leste'),
('TG','Togo'),
('TK','Tokelau'),
('TO','Tonga'),
('TT','Trinidad i Tobago'),
('TN','Tunísia'),
('TM','Turkmenistan'),
('TR','Turquia'),
('TV','Tuvalu'),
('TD','Txad'),
('CZ','Txèquia'),
('UA','Ucraïna'),
('UG','Uganda'),
('UY','Uruguai'),
('UZ','Uzbekistan'),
('VU','Vanuatu'),
('VE','Veneçuela'),
('VN','Vietnam'),
('WF','Wallis i Futuna'),
('CL','Xile'),
('CN','Xina'),
('CY','Xipre'),
('ZW','Zimbàbue'),
('ZM','Zàmbia'),
('AT','Àustria'),
('IN','Índia');
