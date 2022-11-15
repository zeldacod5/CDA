<?php

$departements = array(
    "Hauts-de-france" => array("Aisne", "Nord", "Oise", "Pas-de-Calais", "Somme"),
    "Bretagne" => array("Côtes d'Armor", "Finistère", "Ille-et-Vilaine", "Morbihan"),
    "Grand-Est" => array("Ardennes", "Aube", "Marne", "Haute-Marne", "Meurthe-et-Moselle", "Meuse", "Moselle", "Bas-Rhin", "Haut-Rhin", "Vosges"),
    "Normandie" => array("Calvados", "Eure", "Manche", "Orne", "Seine-Maritime")
);

foreach ($departements as $key => $v) {
    echo $key." => ";
    foreach ($v as $key2 => $v2) {
        echo $v2." . ";
    }
    echo "<br>";
}

echo "<br><br>";

foreach ($departements as $key => $v) {
    $x = count($v);
    echo $key." => ".$x;
    echo "<br>";
}