-- Active: 1665088951589@@127.0.0.1@3306@papyrus
--  1. Quelles sont les commandes du fournisseur 09120 ?
SELECT entcom.numcom, fournis.numfou FROM entcom JOIN fournis ON entcom.numfou=fournis.numfou
WHERE fournis.numfou = '9120';

--  2. Afficher le code des fournisseurs pour lesquels des commandes ont été
--  passées.
SELECT fournis.numfou FROM fournis JOIN entcom ON entcom.numfou=fournis.numfou;


--  3. Afficher le nombre de commandes fournisseurs passées, et le nombre
--  de fournisseur concernés.
SELECT COUNT(entcom.numcom) AS 'Nb commandes passées', COUNT(DISTINCT fournis.numfou) AS 'Nb de fournisseur concernés'
FROM entcom JOIN fournis ON entcom.numfou=fournis.numfou;

--  4. Editer les produits ayant un stock inférieur ou égal au stock d'alerte et
--  dont la quantité annuelle est inférieur est inférieure à 1000
--  (informations à fournir : n° produit, libellé produit, stock, stock actuel
--  d'alerte, quantité annuelle)
UPDATE produit SET stkphy=stkphy+1, qteann=qteann+1
WHERE stkphy<stkale AND qteann<1000;


--  5. Quels sont les fournisseurs situés dans les départements 75 78 92 77 ?
--  L’affichage (département, nom fournisseur) sera effectué par
--  département décroissant, puis par ordre alphabétique
SELECT nomfou , posfou FROM fournis WHERE 
posfou LIKE '78%' 
OR
posfou LIKE '75%'
OR
posfou LIKE '92%'
OR
posfou LIKE '77%';

--  6. Quelles sont les commandes passées au mois de mars et avril ?
SELECT * FROM entcom
WHERE MONTH(datcom) >= 3 AND MONTH(datcom) < 5;

--  7. Quelles sont les commandes du jour qui ont des observations
--  particulières ?
--  (Affichage numéro de commande, date de commande)
SELECT  numcom, datcom, obscom FROM entcom
WHERE entcom.obscom <> "";

--  8. Lister le total de chaque commande par total décroissant
--  (Affichage numéro de commande et total)
SELECT numcom, SUM(qteliv*priuni) AS 'TOTAL_COMMANDE' FROM ligcom
GROUP BY numcom;


--  9. Lister les commandes dont le total est supérieur à 10 000€ ; on exclura
--  dans le calcul du total les articles commandés en quantité supérieure
--  ou égale à 1000.
--  (Affichage numéro de commande et total)
SELECT numcom, SUM(qteliv * priuni) AS 'total' FROM ligcom
WHERE qtecde < 1000
GROUP BY numcom
HAVING SUM(qteliv * priuni) >= 10000;



--  10. Lister les commandes par nom fournisseur
--  (Afficher le nom du fournisseur, le numéro de commande et la date)
SELECT fournis.nomfou, fournis.numfou, entcom.datcom FROM fournis JOIN entcom ON fournis.numfou=entcom.numfou
ORDER BY nomfou;


--  11. Sortir les produits des commandes ayant le mot "urgent' en
--  observation?
--  (Afficher le numéro de commande, le nom du fournisseur, le libellé du
--  produit et le sous total = quantité commandée * Prix unitaire)
SELECT entcom.numcom, fournis.nomfou, produit.libart, (qtecde*priuni) AS 'Sous_total'
FROM fournis
JOIN entcom ON fournis.numfou=entcom.numfou
JOIN ligcom ON entcom.numcom=ligcom.numcom
JOIN produit ON ligcom.codart=produit.codart
WHERE entcom.obscom LIKE '%urgent%';

--  12. Coder de 2 manières différentes la requête suivante :
--  Lister le nom des fournisseurs susceptibles de livrer au moins un article
SELECT fournis.nomfou FROM fournis
JOIN vente ON vente.numfou=fournis.numfou
GROUP BY fournis.nomfou;

SELECT nomfou from fournis
WHERE numfou IN (SELECT numfou FROM vente)
GROUP BY nomfou;

--  13. Coder de 2 manières différentes la requête suivante
--  Lister les commandes (Numéro et date) dont le fournisseur est celui de
--  la commande 70210 :
SELECT entcom.numcom, entcom.datcom FROM entcom
JOIN fournis ON fournis.numfou=entcom.numfou
WHERE entcom.numcom = 70210;

SELECT numcom, datcom FROM entcom
WHERE numfou IN (SELECT numfou FROM fournis) AND numcom = 70210;


--  14. Dans les articles susceptibles d’être vendus, lister les articles moins
--  chers (basés sur Prix1) que le moins cher des rubans (article dont le
--  premier caractère commence par R). On affichera le libellé de l’article
--  et prix1
SELECT produit.libart, vente.prix1 FROM produit join vente ON produit.codart = vente.codart
WHERE vente.prix1 < (SELECT prix1  
                     FROM vente 
                     WHERE codart IN (SELECT codart 
                                      FROM produit
                                      WHERE (libart LIKE 'R%') OR (libart LIKE 'r%')
                                      ) 
                     ORDER BY prix1 ASC 
                     LIMIT 1
                     )
GROUP BY produit.libart;

--  15. Editer la liste des fournisseurs susceptibles de livrer les produits
--  dont le stock est inférieur ou égal à 150 % du stock d'alerte. La liste est
--  triée par produit puis fournisseur
SELECT * FROM fournis
JOIN vente ON vente.numfou = fournis.numfou
JOIN produit ON produit.codart = vente.codart
WHERE produit.stkphy < (1.5 * produit.stkale)
GROUP BY fournis.numfou;

--  16. Éditer la liste des fournisseurs susceptibles de livrer les produit dont
--  le stock est inférieur ou égal à 150 % du stock d'alerte et un délai de
--  livraison d'au plus 30 jours. La liste est triée par fournisseur puis
--  produit
SELECT * FROM fournis
JOIN vente ON vente.numfou = fournis.numfou
JOIN produit ON produit.codart = vente.codart
WHERE (produit.stkphy < (1.5 * produit.stkale)) AND vente.delliv <= 30
GROUP BY fournis.numfou
ORDER BY fournis.nomfou ASC, produit.libart ASC;

--  17. Avec le même type de sélection que ci-dessus, sortir un total des
--  stocks par fournisseur trié par total décroissant
SELECT SUM() FROM fournis
JOIN vente ON vente.numfou = fournis.numfou
JOIN produit ON produit.codart = vente.codart;

--  18. En fin d'année, sortir la liste des produits dont la quantité réellement
--  commandée dépasse 90% de la quantité annuelle prévue.

--  19. Calculer le chiffre d'affaire par fournisseur pour l'année 93 sachant
--  que les prix indiqués sont hors taxes et que le taux de TVA est 20%

--  20. Existe-t-il des lignes de commande non cohérentes avec les produits
--  vendus par les fournisseurs. ?




--  Réalisez les vues suivantes sur papyrus:

--      v_GlobalCde correspondant à la requête :
--     A partir de la table Ligcom, afficher par code produit, la somme des quantités commandées et le prix total correspondant :
--       on nommera la colonne correspondant à la somme des quantités commandées, QteTot et le prix total, PrixTot.

--      v_VentesI100 correspondant à la requête :
--     Afficher les ventes dont le code produit est le I100 (affichage de toutes les colonnes de la table Vente).

--      A partir de la vue précédente,
--     créez v_VentesI100Grobrigan remontant toutes les ventes concernant le produit I100 et le fournisseur 00120.
