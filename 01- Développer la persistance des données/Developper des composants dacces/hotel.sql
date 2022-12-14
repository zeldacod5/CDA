-- Active: 1665088951589@@127.0.0.1@3306@hotel
--  1 - Afficher la liste des hôtels. Le résultat doit faire apparaître le nom de l’hôtel et la ville
SELECT hot_nom, hot_ville FROM hotel;

--  2 - Afficher la ville de résidence de Mr White Le résultat doit faire apparaître le nom, le prénom, et l'adresse du client
SELECT cli_ville, cli_nom, cli_prenom, cli_adresse FROM client WHERE cli_nom LIKE 'White'; 

--  3 - Afficher la liste des stations dont l’altitude < 1000 Le résultat doit faire apparaître le nom de la station et l'altitude
SELECT sta_nom, sta_altitude FROM station WHERE sta_altitude<1000; 

--  4 - Afficher la liste des chambres ayant une capacité > 1 Le résultat doit faire apparaître le numéro de la chambre ainsi que la capacité
SELECT cha_id, cha_capacite AS 'nom des chambres' FROM chambre WHERE cha_capacite > 1;

--  5 - Afficher les clients n’habitant pas à Londre Le résultat doit faire apparaître le nom du client et la ville
SELECT cli_nom, cli_ville FROM client WHERE cli_ville NOT LIKE 'Londre';

--  6 - Afficher la liste des hôtels située sur la ville de Bretou et possédant une catégorie>3 Le résultat doit faire apparaître le nom de l'hôtel, ville et la catégorie
SELECT hot_nom, hot_ville, hot_categorie FROM hotel WHERE hot_ville LIKE 'Bretou' AND hot_categorie>3;

--  7 - Afficher la liste des hôtels avec leur station Le résultat doit faire apparaître le nom de la station, le nom de l’hôtel, la catégorie, la ville)
SELECT sta_nom, hot_nom, hot_categorie, hot_ville FROM station JOIN hotel ON sta_id=hot_sta_id; 

--  8 - Afficher la liste des chambres et leur hôtel Le résultat doit faire apparaître le nom de l’hôtel, la catégorie, la ville, le numéro de la chambre)
SELECT hot_nom, hot_categorie, hot_ville, cha_numero FROM chambre JOIN hotel ON hot_id=cha_hot_id;

--  9 - Afficher la liste des chambres de plus d'une place dans des hôtels situés sur la ville de Bretou
-- Le résultat doit faire apparaître le nom de l’hôtel, la catégorie, la ville, le numéro de la chambre et sa capacité)
SELECT hot_nom, hot_categorie, hot_ville, cha_numero, cha_capacite FROM hotel JOIN chambre ON hot_id = cha_hot_id
WHERE cha_capacite>1 AND hot_ville LIKE 'Bretou';

--  10 - Afficher la liste des réservations avec le nom des clients 
--  Le résultat doit faire apparaître le nom du client, le nom de l’hôtel, la date de réservation
SELECT cli_nom, hot_nom, res_date 
FROM hotel 
JOIN chambre ON hot_id=cha_hot_id 
JOIN reservation ON cha_id=res_cha_id 
JOIN client ON res_cli_id=cli_id;

--  11 - Afficher la liste des chambres avec le nom de l’hôtel et le nom de la station 
--  Le résultat doit faire apparaître le nom de la station, le nom de l’hôtel, le numéro de la chambre et sa capacité)
SELECT sta_nom, hot_nom, cha_numero, cha_capacite
FROM station 
JOIN hotel ON sta_id=hot_sta_id
JOIN chambre ON hot_id=cha_hot_id;

--  12 - Afficher les réservations avec le nom du client et le nom de l’hôtel 
--  le résultat doit faire apparaître le nom du client, le nom de l’hôtel, la date de début du séjour et la durée du séjour
SELECT cli_nom, hot_nom, res_date_debut, datediff(res_date_fin, res_date_debut) AS "Durée de séjour" 
FROM hotel
JOIN chambre ON hot_id=cha_hot_id 
JOIN reservation ON cha_id=res_cha_id 
JOIN client ON cli_id=res_cli_id;

--  13 - Compter le nombre d’hôtel par station
SELECT COUNT(hot_id) AS "Nombre d'hotel",
    sta_nom
FROM station
    JOIN hotel ON hot_sta_id = sta_id
GROUP BY sta_nom;

--  14 - Compter le nombre de chambre par station
SELECT COUNT(cha_id) AS 'Nombre de chambre', sta_nom
FROM chambre
JOIN hotel ON hot_id=cha_hot_id
JOIN station ON sta_id=hot_sta_id
GROUP BY sta_nom;


--  15 - Compter le nombre de chambre par station ayant une capacité > 1
SELECT COUNT(cha_id) AS 'Nombre de chambre', sta_nom
FROM chambre
JOIN hotel ON hot_id=cha_hot_id
JOIN station ON sta_id=hot_sta_id
WHERE cha_capacite>1
GROUP BY sta_nom;
--  16 - Afficher la liste des hôtels pour lesquels Mr Squire a effectué une réservation
SELECT COUNT(res_id) AS 'Nombre de réservation', hot_nom, cli_nom
FROM reservation
JOIN client ON res_cli_id=cli_id
JOIN chambre ON res_cha_id=cha_id
JOIN hotel ON cha_hot_id=hot_id
WHERE cli_nom = 'Squire'
GROUP BY hot_nom;


--  17 - Afficher la durée moyenne des réservations par station
SELECT AVG(DATEDIFF(res_date_fin, res_date_debut)) AS 'Durée de séjour', sta_nom
FROM reservation JOIN chambre ON res_cha_id=cha_id
JOIN hotel ON cha_hot_id=hot_id
JOIN station ON hot_sta_id=sta_id
GROUP BY sta_id;

--                                                                 select *
--                                                                 from client
--                                                                 join reservation on cli_id=res_cli_id
--                                                                 join chambre on cha_id=res_cha_id
--                                                                 join hotel on hot_id=cha_hot_id
--                                                                 join station on sta_id=hot_sta_id;

--  A partir de la base hotel, créez les vues suivantes :

--      Afficher la liste des hôtels avec leur station
CREATE VIEW Hotel_et_station AS
SELECT hot_nom, sta_nom
FROM station JOIN hotel ON sta_id=hot_sta_id;

--      Afficher la liste des chambres et leur hôtel
CREATE VIEW Chambre_et_leur_hotel AS
SELECT cha_hot_id, hot_nom, cha_numero
FROM hotel JOIN chambre ON hot_id=cha_hot_id;


--      Afficher la liste des réservations avec le nom des clients
CREATE VIEW Reservations_et_clients AS
SELECT res_id, res_cli_id, cli_nom
FROM client JOIN reservation ON cli_id=res_cli_id;

--      Afficher la liste des chambres avec le nom de l’hôtel et le nom de la station
CREATE VIEW Chambre_hotel_station AS
SELECT cha_hot_id, cha_numero, hot_nom, sta_nom
FROM station 
JOIN hotel ON sta_id=hot_sta_id
JOIN chambre ON hot_id=cha_hot_id;

--      Afficher les réservations avec le nom du client et le nom de l’hôtel
CREATE VIEW Resa_client_et_hotel AS
SELECT res_id, res_cli_id, cli_nom, hot_nom
FROM client JOIN reservation ON cli_id=res_cli_id
JOIN chambre ON cha_id=res_cha_id
JOIN hotel ON hot_id=cha_hot_id;