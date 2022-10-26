-- Active: 1665088951589@@127.0.0.1@3306@exemple
/!\ /!\ /!\ 
:: BASE EXEMPLE PARTIE 1
/!\ /!\ /!\ 


-- 1. Afficher toutes les informations concernant les employés.
Select * from employe;

-- 2. Afficher toutes les informations concernant les départements.
SELECT * FROM dept; 

-- 3. Afficher le nom, la date dembauche, le numéro du supérieur, le
--          numéro de département et le salaire de tous les employés.
SELECT employe.nom, employe.dateemb, employe.nosup, employe.nodep, employe.salaire FROM employe; 

-- 4. Afficher le titre de tous les employés.
SELECT DISTINCT employe.titre FROM employe; 

-- 5. Afficher les différentes valeurs des titres des employés.
SELECT employe.titre AS 'Titre' FROM employe;

--6. Afficher le nom, le numéro d'employé et le numéro du
--   département des employés dont le titre est « Secrétaire ».
SELECT nom, noemp AS 'Numéro d employé', nodep FROM employe
WHERE employe.titre LIKE "secrétaire";

--7. Afficher le nom et le numéro de département dont le numéro de
--   département est supérieur à 40.
SELECT nom AS 'nom departement', nodept FROM dept
WHERE nodep > 40;

--8. Afficher le nom et le prénom des employés dont le nom est
--   alphabétiquement antérieur au prénom.
SELECT nom, prenom FROM employe
WHERE nom < prenom;

--9. Afficher le nom, le salaire et le numéro du département des employés
--   dont le titre est « Représentant », le numéro de département est 35 et
--   le salaire est supérieur à 20000.
SELECT nom, salaire, nodep FROM employe WHERE titre LIKE "représentant" AND nodep = 35 AND salaire > 20000;

--  10.Afficher le nom, le titre et le salaire des employés dont le titre est
--    « Représentant » ou dont le titre est « Président ».
SELECT nom, titre, salaire from employe WHERE titre LIKE "représentant" OR titre LIKE "président";

--  11.Afficher le nom, le titre, le numéro de département, le salaire des
--      employés du département 34, dont le titre est « Représentant » ou
--      « Secrétaire ».
SELECT nom, titre, nodep, salaire FROM employe
WHERE nodep = 34 AND (titre LIKE "représentant" OR titre LIKE "secrétaire");

--  12.Afficher le nom, le titre, le numéro de département, le salaire des
--      employés dont le titre est Représentant, ou dont le titre est Secrétaire
--      dans le département numéro 34.
SELECT nom, titre, nodep, salaire FROM employe
WHERE (titre LIKE "représentant" OR titre LIKE "secrétaire") AND nodep = 34;

--  13.Afficher le nom, et le salaire des employés dont le salaire est compris
--      entre 20000 et 30000
SELECT nom, salaire FROM employe
WHERE salaire>20000 AND salaire < 30000;

--  15.Afficher le nom des employés commençant par la lettre « H ».
SELECT nom FROM employe WHERE nom LIKE 'h%';


--  16.Afficher le nom des employés se terminant par la lettre « n ».
SELECT nom FROM employe WHERE nom LIKE '%n';


--  17.Afficher le nom des employés contenant la lettre « u » en 3ème
--      position.
SELECT nom FROM employe WHERE nom LIKE '__u%'; 

--  18.Afficher le salaire et le nom des employés du service 41 classés par
--      salaire croissant.
SELECT salaire, nom, nodep FROM employe
WHERE nodep = 41
ORDER BY salaire ASC;


--  19.Afficher le salaire et le nom des employés du service 41 classés par
--      salaire décroissant.
SELECT salaire, nom, nodep FROM employe
WHERE nodep = 41
ORDER BY salaire DESC;


--  20.Afficher le titre, le salaire et le nom des employés classés par titre
--      croissant et par salaire décroissant.
SELECT titre, salaire, nom 
FROM employe 
ORDER BY titre ASC, salaire DESC;


-- 21.Afficher le taux de commission, le salaire et le nom des employés
--   classés par taux de commission croissante.
SELECT tauxcom, salaire, nom 
FROM employe 
ORDER BY tauxcom ASC;

--  22.Afficher le nom, le salaire, le taux de commission et le titre des
--  employés dont le taux de commission n'est pas renseigné.
SELECT nom, salaire, tauxcom, titre 
FROM employe 
WHERE tauxcom IS NULL; 

--  23.Afficher le nom, le salaire, le taux de commission et le titre des
--  employés dont le taux de commission est renseigné.
SELECT nom, salaire, tauxcom, titre 
FROM employe 
WHERE tauxcom IS NOT NULL;

--  24.Afficher le nom, le salaire, le taux de commission, le titre des
--  employés dont le taux de commission est inférieur à 15.
SELECT nom, salaire, tauxcom, titre FROM employe
WHERE tauxcom<15 AND tauxcom IS NOT NULL;

--  25. Afficher le nom, le salaire, le taux de commission, le titre des
--  employés dont le taux de commission est supérieur à 15.
SELECT nom, salaire, tauxcom, titre FROM employe
WHERE tauxcom>15 AND tauxcom IS NOT NULL;

--  26.Afficher le nom, le salaire, le taux de commission et la commission des
--  employés dont le taux de commission n'est pas nul. (la commission
--  est calculée en multipliant le salaire par le taux de commission)
SELECT nom, salaire, tauxcom, (salaire*tauxcom) AS 'commission' FROM employe
WHERE tauxcom IS NOT NULL;

--  27. Afficher le nom, le salaire, le taux de commission, la commission des
--  employés dont le taux de commission n'est pas nul, classé par taux de
--  commission croissant.
SELECT nom, salaire, tauxcom, (salaire*tauxcom) AS 'commission' 
FROM employe 
WHERE tauxcom IS NOT NULL ORDER BY (salaire*tauxcom) ASC; 

--  28. Afficher le nom et le prénom (concaténés) des employés. Renommer
--          les colonnes
SELECT CONCAT(nom,' ' , prenom) AS 'Nom et prénom' FROM employe;


--  29. Afficher les 5 premières lettres du nom des employés.
SELECT SUBSTRING(nom, 1, 5) AS '5 premieres lettres prenom' FROM employe;

--  30. Afficher le nom et le rang de la lettre « r » dans le nom des
--  employés.
SELECT nom, LOCATE('r', nom) AS 'position du R' FROM employe;


--  31. Afficher le nom, le nom en majuscule et le nom en minuscule de
--  l'employé dont le nom est Vrante.
SELECT nom, UPPER(nom) AS 'nom majuscule', nom FROM employe
WHERE nom = 'Vrante';

--  32. Afficher le nom et le nombre de caractères du nom des employés.
SELECT nom, length(nom) AS 'longueurnom des employés' FROM employe;



/!\ /!\ /!\ 
:: BASE EXEMPLE PARTIE 2
/!\ /!\ /!\ 

--  Rechercher le prénom des employés et le numéro de la région de leur
--  département.
SELECT noregion, prenom from dept INNER JOIN employe ON nodept=nodep; 

--  Rechercher le numéro du département, le nom du département, le
--  nom des employés classés par numéro de département (renommer les
--  tables utilisées).
SELECT nodept, dept.nom AS 'nom_departement', employe.nom FROM dept INNER JOIN employe ON nodept=nodep ORDER BY nodept; 

-- Rechercher le nom des employés du département Distribution.
SELECT employe.nom FROM employe INNER JOIN dept ON nodept=nodep WHERE dept.nom = "Distribution"; 

--  Rechercher le nom et le salaire des employés qui gagnent plus que
--  leur patron, et le nom et le salaire de leur patron.
SELECT emp1.nom, emp1.salaire, emp2.nom, emp2.salaire FROM employe AS emp1 JOIN employe AS emp2 ON emp1.nosup=emp2.noemp WHERE emp1.salaire>emp2.salaire; 

--  Rechercher le nom et le titre des employés qui ont le même titre que
--  Amartakaldire.
SELECT employe.nom, employe.titre FROM employe WHERE employe.titre IN (SELECT employe.titre FROM employe WHERE employe.nom='amartakaldire'); 

--  Rechercher le nom, le salaire et le numéro de département des
--  employés qui gagnent plus qu'un seul employé du département 31,
--  classés par numéro de département et salaire.

SELECT nom, salaire, nodep FROM employe
WHERE employe.salaire >= (SELECT employe.salaire FROM employe WHERE nodep='31' ORDER BY salaire ASC LIMIT 1)
ORDER BY nodep ASC, salaire DESC; 


--  Rechercher le nom, le salaire et le numéro de département des
--  employés qui gagnent plus que tous les employés du département 31,
--  classés par numéro de département et salaire.
SELECT nom, salaire, nodep FROM employe
WHERE employe.salaire >= (SELECT employe.salaire FROM employe WHERE nodep='31' ORDER BY salaire DESC LIMIT 1)
ORDER BY nodep ASC, salaire DESC;


--  Rechercher le nom et le titre des employés du service 31 qui ont un
--  titre que l'on trouve dans le département 32.
SELECT nom, titre, nodep FROM employe
WHERE nodep='31' AND titre = (SELECT employe.titre FROM employe WHERE nodep='32');

--  Rechercher le nom et le titre des employés du service 31 qui ont un
--  titre l'on ne trouve pas dans le département 32.
SELECT nom, titre, nodep FROM employe
WHERE nodep='31' AND titre != (SELECT employe.titre FROM employe WHERE nodep='32');

--  Rechercher le nom, le titre et le salaire des employés qui ont le même
--  titre et le même salaire que Fairant.
SELECT nom, titre, salaire FROM employe
WHERE salaire = (SELECT employe.salaire FROM employe WHERE nom='fairent') AND titre = (SELECT employe.titre FROM employe WHERE nom='fairent');


-- Rechercher le numéro de département, le nom du département, le
-- nom des employés, en affichant aussi les départements dans lesquels
-- il n'y a personne, classés par numéro de département.
SELECT dept.nodept, dept.nom AS 'NOM DEP.', employe.nom AS 'NOM EMPL.' FROM dept LEFT JOIN employe
ON dept.nodept=employe.nodep;


/!\ /!\ /!\
:: LES 10 REQUETES
/!\ /!\ /!\ 

--  Calculer le nombre d'employés de chaque titre.
SELECT titre, COUNT(nom) AS 'POPULATION' FROM employe
GROUP BY titre;

--  Calculer la moyenne des salaires et leur somme, par région
SELECT nodep, AVG(salaire) AS 'MOY. SALAIRES', SUM(salaire) AS 'SOM. SALAIRES' FROM employe
GROUP BY nodep;

--  Afficher les numéros des départements ayant au moins 3 employés.
SELECT nodep, COUNT(nom) AS 'POPULATION' FROM employe
WHERE 3 <= (SELECT COUNT(nom) FROM employe)
GROUP BY nodep;

--  Afficher les lettres qui sont l'initiale d'au moins trois employés.


--  Rechercher le salaire maximum et le salaire minimum parmi tous les
--  salariés et l'écart entre les deux.
SELECT max(salaire) AS 'max salaire', min(salaire) AS 'min.salaire', (max(salaire)-min(salaire)) 'écart des salaires'   FROM employe;


--  Rechercher le nombre de titres différents.
SELECT COUNT(DISTINCT titre) AS 'Nombre de titres' FROM employe;

--  Pour chaque titre, compter le nombre d'employés possédant ce titre.
SELECT COUNT(nom) AS 'NB_EMPLOYES', titre FROM employe
GROUP BY titre;

--  Pour chaque nom de département, afficher le nom du département et
--  le nombre d'employés.
SELECT dept.nom, COUNT(employe.nom) AS "Nombre d'employé par region" FROM dept JOIN employe ON nodep=nodept
GROUP BY dept.nom;

--  Rechercher les titres et la moyenne des salaires par titre dont la
--  moyenne est supérieure à la moyenne des salaires des Représentants.
SELECT titre, AVG(salaire) AS 'SALAIRE_MOY' FROM employe
WHERE AVG(salaire)>(SELECT AVG(salaire) FROM employe WHERE titre='représentant')
GROUP BY titre;

--  Rechercher le nombre de salaires renseignés et le nombre de taux de
--  commission renseignés



