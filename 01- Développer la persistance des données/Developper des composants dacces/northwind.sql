-- Active: 1665057120813@@127.0.0.1@3306@northwind

-- 1.Liste des contacts francais :
SELECT customers.CompanyName, customers.ContactName, customers.ContactTitle, customers.Phone FROM customers
WHERE Country = 'France' OR Country = 'france' OR Country = 'FR';

-- 2.Produits vendus par le fournisseur 'Exotic Liquids' :
SELECT products.ProductName, products.UnitPrice FROM products JOIN suppliers
ON suppliers.SupplierID = products.SupplierID
WHERE suppliers.CompanyName = 'Exotic Liquids'
GROUP BY products.ProductName;

-- 3.Nombre de produits vendus par les fournisseurs Français dans l’ordre décroissant :
SELECT suppliers.CompanyName, COUNT(products.ProductName) AS 'NBRE PRODUITS' FROM suppliers JOIN products
ON products.SupplierID = suppliers.SupplierID
WHERE suppliers.Country = 'France'
GROUP BY suppliers.CompanyName;

-- 4.Liste des clients Français ayant plus de 10 commandes :
SELECT customers.CompanyName, COUNT(orders.OrderID) AS 'NBRE COMMANDES' FROM customers JOIN orders
ON orders.CustomerID = customers.CustomerID
WHERE customers.Country = 'France'
GROUP BY customers.CompanyName;

-- 5.Liste des clients ayant un chiffre d’affaires > 30.000 :
SELECT customers.CompanyName, SUM( `order details`.UnitPrice * `order details`.Quantity) AS 'C.A.', customers.Country FROM customers 
JOIN orders ON orders.CustomerID = customers.CustomerID
JOIN `order details` ON `order details`.OrderID = orders.OrderID
GROUP BY customers.CompanyName
HAVING SUM( `order details`.UnitPrice * `order details`.Quantity) > 30000;

-- 6.Liste des pays dont les clients ont passé commande de produits fournis par « Exotic Liquids » :
SELECT customers.Country FROM customers 
JOIN orders ON orders.CustomerID = customers.CustomerID
JOIN `order details` ON `order details`.OrderID = orders.OrderID
JOIN products ON products.ProductID = `order details`.ProductID
JOIN suppliers ON suppliers.SupplierID = products.SupplierID
WHERE suppliers.CompanyName = 'Exotic Liquids'
GROUP BY customers.Country;

-- 7.Montant des ventes de 1997 :
SELECT SUM(`order details`.UnitPrice * `order details`.Quantity) AS 'TOTAL AMOUNT 1997' FROM `order details`
JOIN orders ON orders.OrderID = `order details`.OrderID
WHERE YEAR(orders.OrderDate) = 1997;

-- 8.Montant des ventes de 1997 mois par mois :
SELECT MONTH(orders.OrderDate) AS 'MOIS',SUM(`order details`.UnitPrice * `order details`.Quantity) AS 'TOTAL AMOUNT 1997' FROM `order details`
JOIN orders ON orders.OrderID = `order details`.OrderID
WHERE YEAR(orders.OrderDate) = 1997
GROUP BY MONTH(orders.OrderDate);

-- 9.Depuis quelle date le client « Du monde entier » n’a plus commandé ?
SELECT customers.CompanyName AS 'NOM DU CLIENT', orders.OrderDate AS 'DATE DERNIERE CMD' FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID
WHERE customers.CompanyName = 'Du monde entier'
ORDER BY YEAR(orders.OrderDate) DESC, MONTH(orders.OrderDate) DESC, DAY(orders.OrderDate) DESC
LIMIT 1;

-- 10.Quel est le délai moyen de livraison en jours ?
SELECT SUM(DATEDIFF(ShippedDate, OrderDate)) / COUNT(ShippedDate) AS 'DELAI LIVR. MOY.' FROM orders
WHERE ShippedDate IS NOT NULL;