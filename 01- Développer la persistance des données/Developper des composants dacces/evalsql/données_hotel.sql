INSERT INTO exo2.station
VALUES
    (01, 'Chien des bois station'),
    (02, 'Chien rapide'),
    (03, 'Palavas les flots');

INSERT INTO exo2.hotel (hotel_num, hotel_categorie, hotel_nom, hotel_adresse, hotel_station, hotel_capacite, station_num)
VALUES 
(1, 'Cinq étoiles', 'Hotel California', '3 avenue de la street', 'Chien des bois station', 3, 1),
(2, 'Quatres étoiles', 'Chien Hotel', 'Avenue des grands méchants', 'Chien des bois station', 3, 1),
(3, 'Trois étoiles', 'Hotel douteux', 'Rue de la peine', 'Chien des bois station', 3, 1),
(4, 'Cinq étoiles', 'Hotel youd', 'cébienstreet', 'Chien rapide', 3, 2),
(5, 'Quatre étoiles', 'Holaquetal', 'calleluna', 'Chien rapide', 3, 2), 
(6, 'Trois étoiles', 'Jeanjeanhotel', 'oblivionstreet', 'Chien rapide', 3, 2), 
(7, 'Quatre étoiles', 'Chienchiant', 'cestlongdetaper', 'Palavas les flots', 3, 3), 
(8, 'Cinq étoiles', 'JesusHotel', 'paridisstreet', 'Palavas les flots', 3, 3), 
(9, 'Cinq étoiles', 'Pierre Hotel', 'middle street', 'Palavas les flots', 3, 3);

INSERT INTO exo2.chambre (chambre_num, chambre_capacite, chambre_degres_confort, chambre_exposition, chambre_type, hotel_num)
VALUES
    (01, 4, 22, 'plein sud', 8, 1),
    (02, 4, 22, 'plein sud', 8, 1),
    (03, 4, 22, 'plein sud', 8, 1),
    (04, 4, 22, 'plein sud', 8, 2),
    (05, 4, 22, 'plein sud', 8, 2),
    (06, 4, 22, 'plein sud', 8, 2),
    (07, 4, 22, 'nord', 8, 3),
    (08, 4, 22, 'nord', 8, 3),
    (09, 4, 22, 'nord', 8, 3),
    (10, 4, 22, 'nord', 8, 4),
    (11, 4, 22, 'nord', 8, 4),
    (12, 4, 22, 'nord', 8, 4),
    (13, 4, 22, 'ouest', 8, 5),
    (14, 4, 22, 'ouest', 8, 5),
    (15, 4, 22, 'ouest', 8, 5),
    (16, 4, 22, 'ouest', 8, 6),
    (17, 4, 22, 'ouest', 8, 6),
    (18, 4, 22, 'ouest', 8, 6),
    (19, 4, 22, 'est', 8, 7),
    (20, 4, 22, 'est', 8, 7),
    (21, 4, 22, 'est', 8, 7),
    (22, 4, 22, 'est', 8, 8),
    (23, 4, 22, 'est', 8, 8),
    (24, 4, 22, 'est', 8, 8),
    (25, 4, 22, 'est', 8, 9),
    (26, 4, 22, 'est', 8, 9),
    (27, 4, 22, 'est', 8, 9);




    
