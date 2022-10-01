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
SELECT hot_nom, hot_categorie, hot_ville, hot_sta_id FROM hotel;

--

SELECT sta_nom,
    hot_nom,
    hot_categorie,
    hot_ville
from station
    join hotel on sta_id = hot_sta_id;          (copié sur le git de Ali)


--  8 - Afficher la liste des chambres et leur hôtel Le résultat doit faire apparaître le nom de l’hôtel, la catégorie, la ville, le numéro de la chambre)
SELECT cha_id, cha_hot_id, hot_nom, hot_categorie, hot_ville, cha_numero FROM chambre, hotel;       

--

select hot_nom,
    hot_categorie,
    hot_ville,
    cha_numero
from hotel
    join chambre on hot_id = cha_hot_id;        (copié sur le git de Ali)


--  9 - Afficher la liste des chambres de plus d'une place dans des hôtels situés sur la ville de Bretou
-- Le résultat doit faire apparaître le nom de l’hôtel, la catégorie, la ville, le numéro de la chambre et sa capacité)
SELECT cha_id, hot_nom, hot_categorie, hot_ville, cha_numero, cha_capacite FROM chambre, hotel
WHERE cha_capacite>1 AND hot_ville LIKE 'Bretou';

--  10 - Afficher la liste des réservations avec le nom des clients 
--Le résultat doit faire apparaître le nom du client, le nom de l’hôtel, la date de réservation
SELECT res_id, cli_nom, hot_nom, res_date FROM client, chambre, reservation, hotel;

--  11 - Afficher la liste des chambres avec le nom de l’hôtel et le nom de la station 
--  Le résultat doit faire apparaître le nom de la station, le nom de l’hôtel, le numéro de la chambre et sa capacité)
SELECT DISTINCT cha_id, hot_sta_id, hot_nom, cha_numero, cha_capacite FROM station, hotel, chambre;

--  12 - Afficher les réservations avec le nom du client et le nom de l’hôtel 
--  le résultat doit faire apparaître le nom du client, le nom de l’hôtel, la date de début du séjour et la durée du séjour
SELECT res_id, cli_nom, hot_nom, res_date, res_date_debut, res_date_fin FROM client, reservation, hotel;

--  13 - Compter le nombre d’hôtel par station

--  14 - Compter le nombre de chambre par station

--  15 - Compter le nombre de chambre par station ayant une capacité > 1

--  16 - Afficher la liste des hôtels pour lesquels Mr Squire a effectué une réservation

--  17 - Afficher la durée moyenne des réservations par station