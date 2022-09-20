/*Premi�re partie*/

--Nombre d'enregistrements par prix de vente (30 lignes, 498 enregistrements � 6 euros)*/


--Nombre d��uvres par ann�e (350 lignes, 9 �uvres en 1260)
select ann�e,count (titreOeuvre) as "Nbr d'oeuvres par an."
from Oeuvre
group by ann�e order by ann�e


--M�me chose en ne conservant que les ann�es o� plus de trois �uvres ont �t� publi�es (228 lignes)
select ann�e,count (titreOeuvre) as "Nbr d'oeuvres par an."
from Oeuvre
group by ann�e having COUNT (titreOeuvre) >3
order by ann�e

--Nombre d��uvres par tonalit�, class�es par nombre d�croissant, en ne gardant que les �uvres dont la tonalit� est sp�cifi�e. Soyez curieux : quels sont les attributs de la table �uvre ? (46 lignes, 97 �uvres en 'do majeur')
select tonalit�, count (tonalit�) as "Nbr d'oeuvres par tonalit�"
from Oeuvre
where tonalit� is not null
group by tonalit�


--Nombre d��uvres par ann�e, en ne tenant compte que des �uvres ayant une tonalit� sp�cifi�e (� choisir) (par exemple, en do mineur : 37 lignes, 2 �uvres en 1710)
select ann�e, count (tonalit�) as "Nbr d'oeuvres par ann�e"
from Oeuvre
where tonalit� like 'do mineur' and ann�e is not null
group by ann�e

/*Deuxi�me partie*/
--Nombre d'albums par ann�e de parution (59 lignes, 4 albums en 1961)
select ann�eAlbum, count (codeAlbum)  as "Nbr d'album paru"
from Album
group by ann�eAlbum

--Nombre d'albums par ann�e de parution, class�s par ordre d�croissant d'ann�e (59 lignes)
select ann�eAlbum, count (codeAlbum)  as "Nbr d'album paru"
from Album
group by ann�eAlbum order by ann�eAlbum desc


--M�me chose en ne conservant que les ann�es o� plus de 30 albums sont r�pertori�s, par ordre d�croissant du nombre d'albums (6 lignes)
select ann�eAlbum, count (codeAlbum)  as "Nbr d'album paru"
from Album
where (ann�eAlbum >30)
group by ann�eAlbum order by ann�eAlbum desc

--Dur�e totale des enregistrements (en secondes) (3 412 016 sec)
select sum(dur�eMillisecondes / 1000) as "dur�e totale"
from Enregistrement


--Plus longue et plus courte dur�e des enregistrements (en minutes et secondes) (plus longue = 48 min 26 sec, plus courte = 0 min 0 sec) 
select max(dur�eMillisecondes / 60000) , (max(dur�eMillisecondes /1000)%60)
from Enregistrement


--Plus longue dur�e des enregistrements, mais en affichant '48 min 26 sec' dans la m�me colonne
select CONCAT(max(dur�eMillisecondes / 60000) , ' min et ', (max(dur�eMillisecondes /1000)%60), ' sec') AS  "Time"
from Enregistrement


--Dur�e moyenne des enregistrements (en secondes) (226.710364)



--Nombre de pr�noms de musiciens diff�rents (1 138)
select count (*) 
from Musicien

--Dur�e de vie de chaque musicien (hormis les toujours vivants, et ceux dont on ignore la date de naissance), du plus "vieux" au plus "jeune" (729 lignes)