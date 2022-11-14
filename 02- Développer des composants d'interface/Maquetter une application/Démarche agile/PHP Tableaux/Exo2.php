<?php
$capitales = array(
    "Bucarest" => "Roumanie",
    "Bruxelles" => "Belgique",
    "Oslo" => "Norvège",
    "Ottawa" => "Canada",
    "Paris" => "France",
    "Port-au-Prince" => "Haïti",
    "Port-d'Espagne" => "Trinité-et-Tobago",
    "Prague" => "République tchèque",
    "Rabat" => "Maroc",
    "Riga" => "Lettonie",
    "Rome" => "Italie",
    "San José" => "Costa Rica",
    "Santiago" => "Chili",
    "Sofia" => "Bulgarie",
    "Alger" => "Algérie",
    "Amsterdam" => "Pays-Bas",
    "Andorre-la-Vieille" => "Andorre",
    "Asuncion" => "Paraguay",
    "Athènes" => "Grèce",
    "Bagdad" => "Irak",
    "Bamako" => "Mali",
    "Berlin" => "Allemagne",
    "Bogota" => "Colombie",
    "Brasilia" => "Brésil",
    "Bratislava" => "Slovaquie",
    "Varsovie" => "Pologne",
    "Budapest" => "Hongrie",
    "Le Caire" => "Egypte",
    "Canberra" => "Australie",
    "Caracas" => "Venezuela",
    "Jakarta" => "Indonésie",
    "Kiev" => "Ukraine",
    "Kigali" => "Rwanda",
    "Kingston" => "Jamaïque",
    "Lima" => "Pérou",
    "Londres" => "Royaume-Uni",
    "Madrid" => "Espagne",
    "Malé" => "Maldives",
    "Mexico" => "Mexique",
    "Minsk" => "Biélorussie",
    "Moscou" => "Russie",
    "Nairobi" => "Kenya",
    "New Delhi" => "Inde",
    "Stockholm" => "Suède",
    "Téhéran" => "Iran",
    "Tokyo" => "Japon",
    "Tunis" => "Tunisie",
    "Copenhague" => "Danemark",
    "Dakar" => "Sénégal",
    "Damas" => "Syrie",
    "Dublin" => "Irlande",
    "Erevan" => "Arménie",
    "La Havane" => "Cuba",
    "Helsinki" => "Finlande",
    "Islamabad" => "Pakistan",
    "Vienne" => "Autriche",
    "Vilnius" => "Lituanie",
    "Zagreb" => "Croatie"
);


var_dump($capitales);   // affiche les composants d'un tableau
echo '<br>';
echo '<br>';
ksort($capitales); // Tri un tableau en fonction des clés en ordre décroissant
print_r($capitales);   // print_r retourne en print le contenu des choses
echo '<br>';
echo '<br>';
print_r(array_count_values($capitales)); // n'est pas bon mais retourne le nombre de valeurs étant attribuer à une key
echo '<br>';
echo '<br>';
var_dump(count($capitales)); // compte l'entiéreté des valeurs d'un tableau

echo "<br>";
echo "<br>";

$x = count($capitales);
echo "On denombre ".$x." pays dans ce tableau.<br><br>";                // cela ne marche pas!
foreach ($capitales as $key => $v) {
    if ($key[0] != "B") {
        unset($capitales[$key]);
    }
}
print_r($capitales);

echo '<br>';
echo '<br>';





function drop_function($pays) // suppression des pays commençant par la lettre B
{
    return $pays[0] != "B";
}
$dropper_arr = array_filter($capitales, 'drop_function', ARRAY_FILTER_USE_KEY);

$capitales = $dropper_arr;

$nb = count($capitales);

?>