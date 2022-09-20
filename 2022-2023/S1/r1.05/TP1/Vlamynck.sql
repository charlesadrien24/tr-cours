/*Exercice pr�paratoire

En consultant le compteur de lignes du r�sultat d'une requ�te (en bas � droite) :
Combien la base Classique contient-elle de musiciens (1962), d��uvres (3585), d'enregistrements (15077), de pays (67), d'�diteurs (111), de disques (1032), d'albums (725) ?
Premi�re partie
*/
select * from musicien

--i	Liste des noms des �diteurs tri�e par ordre alphab�tique (111 lignes)

/*select nomMusicien
from Musicien
where nomMusicien */


--Liste des titres d'albums par ordre alphab�tique d�croissant (725 lignes)
select titreAlbum 
from Album
order by titreAlbum

--Liste des pr�noms des musiciens, sans r�p�tition (1138 lignes)
select distinct pr�nomMusicien 
from Musicien
where pr�nomMusicien is NOT NULL


--Liste des titres d��uvres comportant le mot "hiver" (2 lignes)
select titreOeuvre
from Oeuvre
where titreOeuvre like '%hiver%'

--i	Liste des enregistrements de plus de 10 minutes par dur�e d�croissante (801 lignes)



--Deuxi�me partie

--Liste des �diteurs dont le nom commence par la lettre R (2 ligne
select nomEditeur
from Editeur
where nomEditeur like 'R%'

--i Liste des �diteurs dont le nom commence par D ou R (13 lignes)
--Liste des musiciens dont le nom commence par une lettre entre P et T (bornes comprises) (478 lignes)
select nomMusicien
from Musicien
where 'P%'<= nomMusicien and nomMusicien <'U'

--Liste des musiciens dont le nom contient les lettres "rs" (cons�cutives) (26 lignes)
select nomMusicien
from Musicien
where nomMusicien like '%rs%'

--Liste des musiciens dont le nom se termine par les lettres "rs" suivies d�une (unique) lettre quelconque (1 ligne)
select nomMusicien
from Musicien
where nomMusicien like '%rs_'


--i	Liste des musiciens dont le nom se termine par "rson" (8 lignes)
select nomMusicien
from Musicien
where nomMusicien like '%rson'

--i	Liste des musiciens dont le nom se termine par les lettres "rs" suivies de deux lettres quelconques (13 lignes)
select nomMusicien
from Musicien
where nomMusicien like '%rs__'

--i	Liste des musiciens dont le nom se termine par les lettres "rs" suivies de deux lettres quelconques et dont la naissance est post�rieure � 1950 (8 lignes)
--i	Liste des musiciens dont le nom se termine par les lettres "rs" suivies de deux lettres quelconques ou dont la naissance est post�rieure � 1950 (727 lignes)
--i	Liste des musiciens n�s au XVIIe si�cle (107 lignes)





--Troisi�me partie

--Liste alphab�tique des types d'�uvres (73 lignes)
select distinct *
from TypeOeuvre

--Nom et pr�nom des musiciens n�s en 1930 dont le nom commence par 'C' (3 lignes)
select pr�nomMusicien, nomMusicien
from Musicien
where ann�eNaissance = '1930' and nomMusicien like 'C%'

--i	Nom et pr�nom des musiciens n�s en 1900, 1920 ou 1930 (31 lignes)
--Nom et pr�nom des musiciens des musiciens vivants, du plus jeune au plus vieux (1233 lignes)
select pr�nomMusicien, nomMusicien
from Musicien
where ann�eD�c�s is null

--i	M�me question, mais sans afficher les musiciens dont la date de naissance n'est pas connue (1154 lignes)
--Liste des �uvres en sol mineur, par ordre alphab�tique des titres (66 lignes)
select , 
from Oeuvre


--Liste des �uvres dont le titre laisse � penser qu'il s'agit d'une sonate (300 lignes)