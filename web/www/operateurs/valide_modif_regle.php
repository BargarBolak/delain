<?php 
include "../connexion.php";
?>
<html>
<head>
<title>Les souterrains de Delain : partie op�rateurs</title>
<link rel="stylesheet" type="text/css" href="../style.css" title="essai">
</head>
<body background="../images/fond5.gif">
<?php 
$user = $_SERVER["REMOTE_USER"];
include "../jeu/tab_haut.php";
$req_ins = "update regles set regle_titre='" .addslashes($titre) . "',regle_texte='" . addslashes($texte) . "' where regle_cod = $code ";
$res_ins = pg_exec($dbconnect,$req_ins);
if (!$res_ins)
{
	echo("<p>Une anomalie est survenue !");
}
else
{
	echo("<p>R�gle modifi�e !");
}
echo("<p><a href=\"index.php\">Retour � la page d'accueil op�rateurs</a>");
echo("<p><a href=\"gestion_regles.php\">Retour � la page de gestion des r�gles</a>");
include "../jeu/tab_bas.php";
?>
</body>
</html>

