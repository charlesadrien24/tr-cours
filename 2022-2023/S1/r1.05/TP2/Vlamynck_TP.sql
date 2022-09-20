/*Première partie*/

--Nombre d'enregistrements par prix de vente (30 lignes, 498 enregistrements à 6 euros)*/


--Nombre d’œuvres par année (350 lignes, 9 œuvres en 1260)
select année,count (titreOeuvre) as "Nbr d'oeuvres par an."
from Oeuvre
group by année order by année


--Même chose en ne conservant que les années où plus de trois œuvres ont été publiées (228 lignes)
select année,count (titreOeuvre) as "Nbr d'oeuvres par an."
from Oeuvre
group by année having COUNT (titreOeuvre) >3
order by année

--Nombre d’œuvres par tonalité, classées par nombre décroissant, en ne gardant que les œuvres dont la tonalité est spécifiée. Soyez curieux : quels sont les attributs de la table Œuvre ? (46 lignes, 97 œuvres en 'do majeur')
select tonalité, count (tonalité) as "Nbr d'oeuvres par tonalité"
from Oeuvre
where tonalité is not null
group by tonalité


--Nombre d’œuvres par année, en ne tenant compte que des œuvres ayant une tonalité spécifiée (à choisir) (par exemple, en do mineur : 37 lignes, 2 œuvres en 1710)
select année, count (tonalité) as "Nbr d'oeuvres par année"
from Oeuvre
where tonalité like 'do mineur' and année is not null
group by année

/*Deuxième partie*/
--Nombre d'albums par année de parution (59 lignes, 4 albums en 1961)
select annéeAlbum, count (codeAlbum)  as "Nbr d'album paru"
from Album
group by annéeAlbum

--Nombre d'albums par année de parution, classés par ordre décroissant d'année (59 lignes)
select annéeAlbum, count (codeAlbum)  as "Nbr d'album paru"
from Album
group by annéeAlbum order by annéeAlbum desc


--Même chose en ne conservant que les années où plus de 30 albums sont répertoriés, par ordre décroissant du nombre d'albums (6 lignes)
select annéeAlbum, count (codeAlbum)  as "Nbr d'album paru"
from Album
where (annéeAlbum >30)
group by annéeAlbum order by annéeAlbum desc

--Durée totale des enregistrements (en secondes) (3 412 016 sec)
select sum(duréeMillisecondes / 1000) as "durée totale"
from Enregistrement


--Plus longue et plus courte durée des enregistrements (en minutes et secondes) (plus longue = 48 min 26 sec, plus courte = 0 min 0 sec) 
select max(duréeMillisecondes / 60000) , (max(duréeMillisecondes /1000)%60)
from Enregistrement


--Plus longue durée des enregistrements, mais en affichant '48 min 26 sec' dans la même colonne
select CONCAT(max(duréeMillisecondes / 60000) , ' min et ', (max(duréeMillisecondes /1000)%60), ' sec') AS  "Time"
from Enregistrement


--Durée moyenne des enregistrements (en secondes) (226.710364)



--Nombre de prénoms de musiciens différents (1 138)
select count (*) 
from Musicien

--Durée de vie de chaque musicien (hormis les toujours vivants, et ceux dont on ignore la date de naissance), du plus "vieux" au plus "jeune" (729 lignes)