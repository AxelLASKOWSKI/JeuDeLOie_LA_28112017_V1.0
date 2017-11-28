{Jeu de l'oie :
le jeu se joue seul, le joueur est caractériser par un nombre "place" qui situe sa position sur le jeu de l'oie, sachant qu'aprés jet des 2 dés, on applique les règle suivantes:
	-on avance du nombre de cases indiquer par la somme des dés
	-si on arrive juste sur la cases 66 on gange, sinon on recule
	-une oie toute les 9 cases sauf en 63 double le déplacement (si on tombe sur 9 la valeur est doublé)
	-une tête de mort à la case 58 renvoie en position dépard case 0
on s'efforcera d'utiliser au maximum l'emploie de constante.
vous devez produire un algo et un code lisible et claire (COMMENTAIRE)
vous devrez vérifier que le jet de dés est valide
il est conseiller d'utiliser MOD pour tester si une cases est un multiple de 9
AMELIORATION : utiliser un randome pour les dés}

{Algorithme oie

//BUT : cet algorithme fait un jeu de l'oie
//ENTREE : le nombre des dés
//SORTIE : le numéros de la case

CONST
	Min=2
	Max=12
	Depart=0
	Cspec=63
	tetemort=58
	Fini=66

VAR
	de1, de2, result, place, Oie : ENTIER;
DEBUT

    place <- Depart
    REPETER       //début de la boucle qui répètera le lancer de dés et les actions de déplacement
        REPETER	 //boucle qui répète le lancer de dé jusqu'a ce qu'il soit conforme
            ECRIRE "entrer le premier dé"
            LIRE de1
            ECRIRE "entrer le second dé"
            LIRE de2
            result <- de1 + de2
            ECRIRE "Votre lancé est de : "&result
            SI (result < Min) OU (result > Max) ALORS
                ECRIRE "Les dés vont de 2 à 12, relancer"
            FIN SI
        JUSQUA (result >= Min)ET (result <= Max)
        //début des instruction  de déplacement
	        place <- place + result
	        ECRIRE "Vous êtes sur la case : "&place
	        SI place MOD Oie=0 ET place <> Cspec ALORS //cases oie, le déplacement est doubler
	            ECRIRE "déplacement doubler"
	            place <- place + result
	            ECRIRE "vous êtes sur la case : "&place
	        FINSI
	        SI place = tetemort ALORS //cases tête de mort, le joueur retourne à la case départ
	            place <- Depart
	            ECRIRE "La case 58 est une tête de mort, vous retournez au début"
	        FIN SI
	        SI place > Fini ALORS  //cases de fin attent, mais déplacement dépasser
	            ECRIRE "La case 66 à  été dépassée, reculer du nombre de déplacement restant"
	            place <- place-(place - Fini)*2
	            ECRIRE "Vous êtes sur la case : "&place
	        FINSI
	JUSQUA (place=Fini)
FIN}

Program oie;
uses crt;

//BUT : ce programme fait un menu pour un jeu de l'oie, le menu contier les rèlge et 2 vertion de jeu
//ENTREE : le nombre des dés
//SORTIE : le numéros de la case
CONST
	Min=2;
	Max=12;
	Depart=0;
	Cspec=63;
	tetemort=58;
	Fini=66;

VAR
	de1, de2, result, place, Oies, choix : integer;

BEGIN
	clrscr;
    
    repeat  //début de la boucle du menu
        begin

          writeln('jeu de l''oie');
          writeln('1:regles');
          writeln('2:jeu sans random');
          writeln('3:jeu avec random');
          writeln('0:Quitter');

          writeln('Entrez votre choix');
          readln(choix);

          case choix of
          	1: //début du livret des règle
	          	begin
	          	 	writeln ('le jeu se joue seul, le joueur est caracteriser par un "place" qui situe sa position sur le jeu de l''oie, sachant qu''aprés jet des 2 dés, on applique les règle suivantes:');
					writeln	('-on avance du nombre de cases indiquer par la somme des des');
					writeln	('-si on arrive juste sur la cases 66 on gagne, sinon on recule');
					writeln	('-une oie se trouve toute les 9 cases sauf en 63, elles double le déplacement');
					writeln	('-une tete de mort à la case 58 renvoie en position depard case 0');
					readln;
				end;
			2: //début du programme dont les dés sont donner par l'utilisateur
				begin
					place:= Depart;
				    repeat	 //début de la boucle qui répètera le lancer de dés et les actions de déplacement(  
				        repeat	 //boucle qui répète le lancer de dé jusqu'a ce qu'il soit conforme
					            writeln ('entrer le premier de');
					            readln (de1);
					            writeln ('entrer le second de');
					            readln (de2);
					            result:= de1 + de2;
					            if ((result < Min) or (result > Max)) then
					                writeln ('Les des vont de 2 a 12, relancer');
					            readln;
				        until ((result >= Min) and (result <= Max)); //début des instruction  de déplacement
					        place := place + result;
					        writeln ('Vous etes sur la case : ',place);
					        readln;
					        if ((place MOD Oies=0) and (place <> Cspec)) then //cases oie, le déplacement est doubler
					        	begin
					            	writeln ('deplacement doubler');
					            	place:= place + result;
					           		writeln ('vous etes sur la case : ',place);
					           		readln;
					            end;
					        if place = tetemort then //cases tête de mort, le joueur retourne à la case départ
					        	begin
					            	place:= Depart;
					            	writeln ('La case 58 est une tete de mort, vous retournez au debut');
					            	readln;
					            end;
					        if place > Fini then //cases de fin attent, mais déplacement dépasser
					        	begin
					            	writeln ('La case 66 à  ete depassee, reculer du nombre de deplacement restant');
					            	place := place-((place - Fini)*2);
					            	writeln ('Vous etes sur la case : ',place);
					            	readln;
					            end;
					        readln;
					until (place=Fini);
				end;
			3:// début du programme ou les dés sont fait en aléatoire
				begin
					place:= Depart;
				    repeat     //début de la boucle qui répètera le lancer de dés et les actions de déplacement
				        repeat	 //boucle qui répète le lancer de dé jusqu'a ce qu'il soit conforme
				            randomize;
				            result:= (random(11)+1);
				            writeln ('Votre lance est de : ',result);
				        until ((result >= Min) and (result <= Max));
				       //début des instruction  de déplacement
					        place := place + result;
					        if ((place MOD Oies=0) and (place <> Cspec)) then //cases oie, le déplacement est doubler
					        	begin
					            	writeln ('deplacement doubler');
					            	place:= place + result;
					           		writeln ('vous etes sur la case : ',place);
					           		readln;
					            end;
					        if place = tetemort then //cases tête de mort, le joueur retourne à la case départ
					        	begin
					            	place:= Depart;
					            	writeln ('La case 58 est une tete de mort, vous retournez au debut');
					            	readln;
					            end;
					        if place > Fini then //cases de fin attent, mais déplacement dépasser
					        	begin
					            	writeln ('La case 66 a ete dépassée, reculer du nombre de deplacement restant');
					            	place := place-((place - Fini)*2);
					            	writeln ('Vous etes sur la case : ',place);
					            	readln;
					            end;
					until (place=Fini);
				end;
					        
			0:  writeln('au revoir');
			else  writeln('choix incorrect');
          	end;
          	writeln('Appuyez sur ENTER pour continuer');
          	readln;
          	clrscr;
        end;

    until choix=0;
END.