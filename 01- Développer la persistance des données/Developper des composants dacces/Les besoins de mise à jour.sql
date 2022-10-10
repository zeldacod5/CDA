-- Active: 1664791382629@@127.0.0.1@3306@papyrus
--  1. Application d'une augmentation de tarif de 4% pour le prix 1 et de 2%
--  pour le prix2 pour le fournisseur 9180
UPDATE vente JOIN produit
SET prix1 = prix1+(prix1 * 0.04), prix2 = prix2 + (prix2 * 0.02)
WHERE numfou = 9180;

--  2. Dans la table vente, mettre à jour le prix2 des articles dont le prix2 est
--  null, en affectant a prix2 la valeur de prix1.
UPDATE vente 
SET prix2 = prix1
WHERE prix2 = 0;

--  3. Mettre à jour le champ obscom en positionnant '*****' pour toutes les
--  commandes dont le fournisseur a un indice de satisfaction <5
UPDATE entcom JOIN fournis
SET obscom = '*****'
WHERE satisf < 5;

--  4. Suppression du produit I110
DELETE * FROM produit JOIN ligcom JOIN vente
WHERE codart = 'I110';

--  5. Suppression des entête de commande qui n'ont aucune ligne