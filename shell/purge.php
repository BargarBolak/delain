<?
/* Affichage des erreurs sur chaque page */

/* Script de connexion � la base smeweb n�cessaire avant toute requ�te */
$dbconnect = pg_connect("host=127.0.0.1 dbname=sdewitte user=sdewitte password=") or die("En cours de maintenance");; 
  if(!$dbconnect)
        {
         echo("Une erreur est survenue.\n");
		 exit;
       }

$req = "select purge_evenements(0) ";
$res = pg_exec($dbconnect,$req);
$tab = pg_fetch_array($res,0);
echo("R�sultat de la purge des �v�nements : $tab[0]\r\n");
$req = "select purge_mes(0) ";
$res = pg_exec($dbconnect,$req);
$tab = pg_fetch_array($res,0);

echo("R�sultat de la purge des messages : $tab[0]\r\n");
$req = "select joueur_inactif(0) ";
$res = pg_exec($dbconnect,$req);
$tab = pg_fetch_array($res,0);
echo("R�sultat de la purge des joueurs inactifs : $tab[0]\r\n");
$req = "select compte_inactif(0) ";
$res = pg_exec($dbconnect,$req);
$tab = pg_fetch_array($res,0);
echo("R�sultat de la purge des comptes inactifs : $tab[0]\r\n");
$close=pg_close($dbconnect);
?>
