-- Active: 1665088951589@@127.0.0.1@3306@exemple
/!\ /!\ /!\ 
:: BASE EXEMPLE PARTIE 1
/!\ /!\ /!\ ;


-- 1. Afficher toutes les informations concernant les employés.

SELECT * FROM employe;

-- 2. Afficher toutes les informations concernant les départements.
SELECT * FROM dept;

-- 3. Afficher le nom, la date dembauche, le numéro du supérieur, le
--          numéro de département et le salaire de tous les employés.
SELECT nom, dateemb, nosup, nodep, salaire FROM employe;

-- 4. Afficher le titre de tous les employés.
SELECT nom, titre FROM employe;

-- 5. Afficher les différentes valeurs des titres des employés.
SELECT DISTINCT titre FROM employe;

--6. Afficher le nom, le numéro d'employé et le numéro du
--   département des employés dont le titre est « Secrétaire ».
SELECT nom, noemp, nodep FROM employe
WHERE titre = "secrétaire";

--7. Afficher le nom et le numéro de département dont le numéro de
--   département est supérieur à 40.
SELECT nodept, nom
from dept
where nodept>40;

--8. Afficher le nom et le prénom des employés dont le nom est
--   alphabétiquement antérieur au prénom.


--9. Afficher le nom, le salaire et le numéro du département des employés
--   dont le titre est « Représentant », le numéro de département est 35 et
--   le salaire est supérieur à 20000.


--  10.Afficher le nom, le titre et le salaire des employés dont le titre est
--    « Représentant » ou dont le titre est « Président ».


--  11.Afficher le nom, le titre, le numéro de département, le salaire des
--      employés du département 34, dont le titre est « Représentant » ou
--      « Secrétaire ».


--  12.Afficher le nom, le titre, le numéro de département, le salaire des
--      employés dont le titre est Représentant, ou dont le titre est Secrétaire
--      dans le département numéro 34.


--  13.Afficher le nom, et le salaire des employés dont le salaire est compris
--      entre 20000 et 30000


--  15.Afficher le nom des employés commençant par la lettre « H ».



--  16.Afficher le nom des employés se terminant par la lettre « n ».



--  17.Afficher le nom des employés contenant la lettre « u » en 3ème
--      position.


--  18.Afficher le salaire et le nom des employés du service 41 classés par
--      salaire croissant.


--  19.Afficher le salaire et le nom des employés du service 41 classés par
--      salaire décroissant.


--  20.Afficher le titre, le salaire et le nom des employés classés par titre
--      croissant et par salaire décroissant.


-- 21.Afficher le taux de commission, le salaire et le nom des employés
--   classés par taux de commission croissante.


--  22.Afficher le nom, le salaire, le taux de commission et le titre des
--  employés dont le taux de commission n'est pas renseigné.


--  23.Afficher le nom, le salaire, le taux de commission et le titre des
--  employés dont le taux de commission est renseigné.


--  24.Afficher le nom, le salaire, le taux de commission, le titre des
--  employés dont le taux de commission est inférieur à 15.

--  25. Afficher le nom, le salaire, le taux de commission, le titre des
--  employés dont le taux de commission est supérieur à 15.

--  26.Afficher le nom, le salaire, le taux de commission et la commission des
--  employés dont le taux de commission n'est pas nul. (la commission
--  est calculée en multipliant le salaire par le taux de commission)

--  27. Afficher le nom, le salaire, le taux de commission, la commission des
--  employés dont le taux de commission n'est pas nul, classé par taux de
--  commission croissant.

--  28. Afficher le nom et le prénom (concaténés) des employés. Renommer
--          les colonnes



--  29. Afficher les 5 premières lettres du nom des employés.


--  30. Afficher le nom et le rang de la lettre « r » dans le nom des
--  employés.


--  31. Afficher le nom, le nom en majuscule et le nom en minuscule de
--  l'employé dont le nom est Vrante.

--  32. Afficher le nom et le nombre de caractères du nom des employés.

/!\ /!\ /!\ 
:: BASE EXEMPLE PARTIE 2
/!\ /!\ /!\ 

--  Rechercher le prénom des employés et le numéro de la région de leur
--  département.

--  Rechercher le numéro du département, le nom du département, le
--  nom des employés classés par numéro de département (renommer les
--  tables utilisées).


-- Rechercher le nom des employés du département Distribution.


--  Rechercher le nom et le salaire des employés qui gagnent plus que
--  leur patron, et le nom et le salaire de leur patron.


--  Rechercher le nom et le titre des employés qui ont le même titre que
--  Amartakaldire.


--  Rechercher le nom, le salaire et le numéro de département des
--  employés qui gagnent plus qu'un seul employé du département 31,
--  classés par numéro de département et salaire.



--  Rechercher le nom, le salaire et le numéro de département des
--  employés qui gagnent plus que tous les employés du département 31,
--  classés par numéro de département et salaire.


--  Rechercher le nom et le titre des employés du service 31 qui ont un
--  titre que l'on trouve dans le département 32.

--  Rechercher le nom et le titre des employés du service 31 qui ont un
--  titre l'on ne trouve pas dans le département 32.

--  Rechercher le nom, le titre et le salaire des employés qui ont le même
--  titre et le même salaire que Fairant.


-- Rechercher le numéro de département, le nom du département, le
-- nom des employés, en affichant aussi les départements dans lesquels
-- il n'y a personne, classés par numéro de département.

/!\ /!\ /!\
:: LES 10 REQUETES
/!\ /!\ /!\ 

--  Calculer le nombre d'employés de chaque titre.


--  Calculer la moyenne des salaires et leur somme, par région

--  Afficher les numéros des départements ayant au moins 3 employés.


--  Afficher les lettres qui sont l'initiale d'au moins trois employés.


--  Rechercher le salaire maximum et le salaire minimum parmi tous les
--  salariés et l'écart entre les deux.

--  Rechercher le nombre de titres différents.

--  Pour chaque titre, compter le nombre d'employés possédant ce titre.

--  Pour chaque nom de département, afficher le nom du département et
--  le nombre d'employés.

--  Rechercher les titres et la moyenne des salaires par titre dont la
--  moyenne est supérieure à la moyenne des salaires des Représentants.

--  Rechercher le nombre de salaires renseignés et le nombre de taux de
--  commission renseignés



