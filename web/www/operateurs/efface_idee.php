<?php 
include "../includes/classes.php";
$db = new base_delain;
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
$req_ins = "delete from idees where idee_cod = $idee";
$db->query($req_ins);
	echo("<p>Entr�e effac�e !!");
echo("<p><a href=\"index.php\">Retour � la page d'accueil op�rateurs</a>");
echo("<p><a href=\"gestion_idee.php\">Retour � la page de gestion des id�es</a>");
include "../jeu/tab_bas.php";
?>
</body>
</html>

