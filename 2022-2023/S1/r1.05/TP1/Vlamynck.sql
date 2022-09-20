/*Exercice préparatoire

En consultant le compteur de lignes du résultat d'une requête (en bas à droite) :
Combien la base Classique contient-elle de musiciens (1962), d’œuvres (3585), d'enregistrements (15077), de pays (67), d'éditeurs (111), de disques (1032), d'albums (725) ?
Première partie
*/
select * from musicien

--i	Liste des noms des éditeurs triée par ordre alphabétique (111 lignes)

/*select nomMusicien
from Musicien
where nomMusicien */


--Liste des titres d'albums par ordre alphabétique décroissant (725 lignes)
select titreAlbum 
from Album
order by titreAlbum

--Liste des prénoms des musiciens, sans répétition (1138 lignes)
select distinct prénomMusicien 
from Musicien
where prénomMusicien is NOT NULL


--Liste des titres d’œuvres comportant le mot "hiver" (2 lignes)
select titreOeuvre
from Oeuvre
where titreOeuvre like '%hiver%'

--i	Liste des enregistrements de plus de 10 minutes par durée décroissante (801 lignes)



--Deuxième partie

--Liste des éditeurs dont le nom commence par la lettre R (2 ligne
select nomEditeur
from Editeur
where nomEditeur like 'R%'

--i Liste des éditeurs dont le nom commence par D ou R (13 lignes)
--Liste des musiciens dont le nom commence par une lettre entre P et T (bornes comprises) (478 lignes)
select nomMusicien
from Musicien
where 'P%'<= nomMusicien and nomMusicien <'U'

--Liste des musiciens dont le nom contient les lettres "rs" (consécutives) (26 lignes)
select nomMusicien
from Musicien
where nomMusicien like '%rs%'

--Liste des musiciens dont le nom se termine par les lettres "rs" suivies d’une (unique) lettre quelconque (1 ligne)
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

--i	Liste des musiciens dont le nom se termine par les lettres "rs" suivies de deux lettres quelconques et dont la naissance est postérieure à 1950 (8 lignes)
--i	Liste des musiciens dont le nom se termine par les lettres "rs" suivies de deux lettres quelconques ou dont la naissance est postérieure à 1950 (727 lignes)
--i	Liste des musiciens nés au XVIIe siècle (107 lignes)





--Troisième partie

--Liste alphabétique des types d'œuvres (73 lignes)
select distinct *
from TypeOeuvre

--Nom et prénom des musiciens nés en 1930 dont le nom commence par 'C' (3 lignes)
select prénomMusicien, nomMusicien
from Musicien
where annéeNaissance = '1930' and nomMusicien like 'C%'

--i	Nom et prénom des musiciens nés en 1900, 1920 ou 1930 (31 lignes)
--Nom et prénom des musiciens des musiciens vivants, du plus jeune au plus vieux (1233 lignes)
select prénomMusicien, nomMusicien
from Musicien
where annéeDécès is null

--i	Même question, mais sans afficher les musiciens dont la date de naissance n'est pas connue (1154 lignes)
--Liste des œuvres en sol mineur, par ordre alphabétique des titres (66 lignes)
select , 
from Oeuvre


--Liste des œuvres dont le titre laisse à penser qu'il s'agit d'une sonate (300 lignes)