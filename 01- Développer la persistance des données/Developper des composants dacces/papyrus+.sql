DELIMITER |

CREATE PROCEDURE Lst_fournis()
BEGIN
    SELECT fournis.numfou FROM fournis JOIN entcom ON entcom.numfou=fournis.numfou;
END |

DELIMITER ;


DELIMITER |

CREATE PROCEDURE Lst_commandes()
BEGIN
    SELECT entcom.numcom, fournis.nomfou, produit.libart, (qtecde*priuni) AS 'Sous_total'
FROM fournis
JOIN entcom ON fournis.numfou=entcom.numfou
JOIN ligcom ON entcom.numcom=ligcom.numcom
JOIN produit ON ligcom.codart=produit.codart
WHERE entcom.obscom LIKE '%urgent%';
END |
DELIMITER ;


DELIMITER |

CREATE PROCEDURE CA_Fournisseur()
BEGIN
    