-- Active: 1665057120813@@127.0.0.1@3306@northwind

-- Liste des contacts francais :
SELECT customers.CompanyName, customers.ContactName, customers.ContactTitle, customers.Phone FROM customers
WHERE Country = 'France' OR Country = 'france' OR Country = 'FR';

-- Produits vendus par le fournisseur 'Exotic Liquids' :
SELECT products.ProductName, products.UnitPrice FROM products JOIN suppliers
ON suppliers.SupplierID = products.SupplierID
WHERE suppliers.CompanyName = 'Exotic Liquids'
GROUP BY products.ProductName;

-- Nombre de produits vendus par les fournisseurs Français dans l’ordre décroissant :
SELECT suppliers.CompanyName, COUNT(products.ProductName) AS 'Nbre produits' FROM suppliers JOIN products
ON products.SupplierID = suppliers.SupplierID
WHERE suppliers.Country = 'France'
GROUP BY suppliers.CompanyName;

-- Liste des clients Français ayant plus de 10 commandes :
SELECT customers.CompanyName, COUNT(orders.OrderID) AS 'Nbre commandes' FROM customers JOIN orders
ON orders.CustomerID = customers.CustomerID
WHERE customers.Country = 'France'
GROUP BY customers.CompanyName;

-- Liste des clients ayant un chiffre d’affaires > 30.000 :
SELECT customers.CompanyName, SUM( `order details`.UnitPrice * `order details`.Quantity) AS 'C.A.', customers.Country FROM customers 
JOIN orders ON orders.CustomerID = customers.CustomerID
JOIN `order details` ON `order details`.OrderID = orders.OrderID
GROUP BY customers.CompanyName
HAVING SUM( `order details`.UnitPrice * `order details`.Quantity) > 30000;

-- Liste des pays dont les clients ont passé commande de produits fournis par « Exotic Liquids » :
SELECT customers.Country FROM customers 
JOIN orders ON orders.CustomerID = customers.CustomerID
JOIN `order details` ON `order details`.OrderID = orders.OrderID
JOIN products ON products.ProductID = `order details`.ProductID
JOIN suppliers ON suppliers.SupplierID = products.SupplierID
WHERE suppliers.CompanyName = 'Exotic Liquids'
GROUP BY customers.Country;

-- Montant des ventes de 1997 :
SELECT SUM(`order details`.UnitPrice * `order details`.Quantity) AS 'TOTAL AMOUNT 1997' FROM `order details`
JOIN orders ON orders.OrderID = `order details`.OrderID
WHERE orders.OrderDate LIKE '1997%';

-- Montant des ventes de 1997 mois par mois :
SELECT ;