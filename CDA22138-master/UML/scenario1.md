# NUMERO 1 - LE CLIENT CONSULTE LE CATALOGUE
# VILLAGE_GREEN / LOUCAS

Description: Le client entre sur le site marchand et consulte le catalogue.

Pré-requis: Le client est attéri sur notre site internet via des liens, une consultation, une navigation internet.

Résultat: Le client à consulter le catalogue, les catégories, les sous-catégories, les produits.

# FLUX NOMINAL

Le client entre sur le site
La machine envoi l'URL lien d'acceuil
Le client se connecte sur son compte utilisateur
La machine vérifie la véracité des informations et connecte l'utilisateur
La machine envoi l'utilisateur vers le catalogue

# FLUX ALTERNATIF




# NUMERO 2 - LE CLIENT CONSTRUIT SON PANIER, AJOUTE DES PRODUITS
# VILLAGE_GREEN / LOUCAS


Description: Le client à ajouté un produit dans son panier, possède plusieurs choix:

Pré-requis: Le client est connecté à notre site
	    Les produits que le client recherche son disponible
	    

Résultat: Le client à ajouté des produits à son panier.

# FLUX NOMINAL

Le client aime un produit et l'ajoute à son panier
La machine calcule le prix, ajoute la tva et le prix hors taxe
La machine affiche le panier mis à jour
Le client visualise en fond son panier mis à jour
La machine propose aux clients de continuer ses achats
Le client ajoute un nouveau produits à son panier
La machine fait la somme des produits ajoutées
La machine affiche le panier mis à jour

# FLUX ALTERNATIF

Le client supprime un produit à son panier
Le client se déconnecte
Nous proposons une offre alternative au client




# NUMERO 3 - LE CLIENT VALIDE SON PANIER

Descrpition : Le client est satisfait de sa commande et valide son panier.

Pré-requis: Le client à passé commande sur notre site
	    Les processsus d'ajout, de visualisation et de propositions ont fonctionnés.
	    
Résultat: Une nouvelle commande est passée.

# FLUX NOMINAL

Le client valide son panier
La machine propose un formulaire d'achat, adresse de facturation.
Le client entre ses données dans le formulaire
La machine traite la véracité des données
La machine propose une méthode d'achat
Le client entre ses coordonnées bancaires
La machine valide la commande
La machine transmet une page de validation à l'utilisateurs
La machine envoi un mail de validation à l'utilisateurs
La machine retire des produits dans la bases de données
La machine met à jour la bases de données.


