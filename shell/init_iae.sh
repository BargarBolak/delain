#!/bin/ksh
repertoire=/home/sdewitte/shell
logdir=/home/sdewitte/logs
tmp_sortie=$repertoire/tmp_resultat
sortie=$repertoire/resultat
fichier=$repertoire/liste_monstre.txt
/usr/local/pgsql/bin/psql -q -t << EOF >> /home/sdewitte/logs/iae.log 2>&1
insert into news (news_titre,news_texte,news_date,news_auteur,news_mail_auteur) values
('Enfin !','...krrrrrrrr... Kchhhhhhhhh... Message du Comit� de D�fense des Monstres Gentils, des R�ves Enfantins et autres Bisounours (le CDMGREAB).<br><br>A dater de ce jour, nous, les monstres des souterrains, d�clarons qu\'il suffit !<br><br>Nous en avons assez d\'�tre les instruments de Malkiar qui nous cr�e et nous oblige � combattre afin de ralentir la progression des aventuri�res et aventuriers.<br>Nous en avons assez d\'�tre la chair � canon de ces aventuri�res et aventuriers qui nous d�ciment par centaine sans chercher � nous comprendre et nous aimer.<br><br>Pourtant tous ont oubli� qu\'ils nous ont aim� quand ils �taient jeunes ; tous ont oubli� que nous les faisions rire apr�s l\'�cole par l\'interm�diaire du petit �cran ; tous ont oubli� qu\'ils se sont endormis en nous serrant dans leurs bras.<br><br>Aussi nous faisons dor�navant s�cession car nous trouvons que cela manque d\'Amour dans ces souterrains !!! Nous d�cidons de cr�er une zone pleine de bonheur, de sucrerie et de rires (z� des chants) qui sera notre propre havre de paix et nous l\'investissons de suite : il s\'agit de l\'�le aux Enfants !!!<br>Si vous d�cidez de rentrer dans ce lieu, vous devrez en suivre <u>NOS</u> lois et non celle de Malkiar ni la votre !<br><br><i>Les passages myst�rieux luisent d\'une clart� bizarre. Vous comprenez qu\'ils sont maintenant ouverts.</i>',
now(),'Casimir, porte-parole des monstres gentils.','casimir@jdr-delain.net');
update lieu set lieu_url = 'passage_escalier.php' where lieu_nom = 'Passage myst�rieux';
EOF
