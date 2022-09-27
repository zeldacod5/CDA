1. Afficher toutes les informations concernant les employés.
Select * from employe

2. Afficher toutes les informations concernant les départements.
SELECT * FROM dept; 

3. Afficher le nom, la date dembauche, le numéro du supérieur, le
numéro de département et le salaire de tous les employés.
SELECT 



:: BASE EXEMPLE PARTIE 2

SELECT noregion, prenom from dept INNER JOIN employe ON nodept=nodep; 

SELECT nodept, dept.nom AS 'nom_departement', employe.nom FROM dept INNER JOIN employe ON nodept=nodep ORDER BY nodept; 

SELECT employe.nom FROM employe INNER JOIN dept ON nodept=nodep WHERE dept.nom = "Distribution"; 


SELECT emp1.nom, emp1.salaire, emp2.nom, emp2.salaire FROM employe AS emp1 JOIN employe AS emp2 ON emp1.nosup=emp2.noemp WHERE emp1.salaire>emp2.salaire; 

SELECT employe.nom, employe.titre FROM employe WHERE employe.titre IN (SELECT employe.titre FROM employe WHERE employe.nom='amartakaldire'); 


