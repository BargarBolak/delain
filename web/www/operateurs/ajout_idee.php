<?php 
include "../connexion.php";
include "../includes/classes.php";
$db = new base_delain;
$db2 = new base_delain;
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
$req_tot = "select idee_etat from idees group BY idee_etat ";
$db2->query($req_tot);
echo("<table>");
echo("<form name=\"ajout_faq\" method=\"post\" action=\"valide_ajout_idee.php\">");
echo("<tr>");
echo("<td class=\"soustitre3\"><p>Priorit� :</td>");
?>
<td><p><select  name="nouveau">
				<OPTION value =""><-- Id�e ancienne --></OPTION>
				<option value ="new" "selected">Nouveaut�</option>
<?php 					echo "</select></td>";
echo("</tr>");

echo("<tr>");
echo("<td class=\"soustitre3\"><p>Domaine :</td>");
?>
<td><p><select  name="domaine">
				<OPTION value ="" "selected"><-- S�lectionner un domaine --></OPTION>
				<OPTION value ="Magie">Magie</OPTION>
				<option value ="Combat" >Combat</option>
				<option value ="Modification de l'interface">Modification de l'interface</option>
				<option value ="Religion">Religion</option>
				<option value ="Qu�te">Qu�te</option>										
				<option value ="Nouveau concept ou modification d'un concept du jeu">Nouveau concept ou modification d'un concept du jeu</option>		
<?php 					echo "</select></td>";
echo("</tr>");

echo("<tr>");
echo("<td class=\"soustitre3\"><p>Nom :</td>");
echo("<td><p><textarea name=\"nom\" cols=\"40\" rows=\"10\"></textarea></td>");
echo("</tr>");

echo("<tr>");
echo("<td class=\"soustitre3\"><p>Lien :</td>");
echo("<td><p><textarea name=\"lien\" cols=\"40\" rows=\"10\"></textarea></td>");
echo("</tr>");

echo("<td class=\"soustitre3\"><p>Etat :</td>");
echo("<td>					<select name=\"etat\" >
					<OPTION value =\"\"><-- Toutes les id�es --></OPTION>
					<OPTION value =\"\">� analyser par l'�quipe</OPTION>");
						while($db2->next_record())
						{
							$sel = "";
							$etat = $db2->f("idee_etat");
							if ($etat == $db->f("idee_etat"))
							{
								$sel = "selected";
							}
							echo "<OPTION value='". $etat ."'\" $sel>". $etat ."</OPTION>\n";
						}
					echo "</select></td>";
echo("</tr>");
echo("<td class=\"soustitre3\"><p>Priorit� :</td>");
?>
<td><p><select  name="priorite">
				<OPTION value =""><-- Priorit� --></OPTION>
				<option value ="0" "selected">Priorit� 0</option>
				<option value ="1" >Priorit� 1</option>
				<option value ="2" >Priorit� 2</option>
				<option value ="3" >Priorit� 3</option>
<?php 					echo "</select></td>";
echo("</tr>");
echo("<tr>");
echo("<td class=\"soustitre3\"><p>Commentaire :</td>");
echo("<td><p><textarea name=\"commentaire\" cols=\"40\" rows=\"10\"></textarea></td>");
echo("</tr>");
echo("<tr>");
echo("<tr>");
echo("<td class=\"soustitre3\"><p>Avancement : <br><i>(en %)</i></td>");
echo("<td><p><textarea name=\"avancement\">0</textarea></td>");
echo("</tr>");
echo("<tr>");
echo("<td colspan=\"2\"><center><input type=\"submit\" value=\"valider\" class=\"test\"></center></td>");
echo("</tr>");


echo("</table>");
include "../jeu/tab_bas.php";
?>
</body>
</html>

