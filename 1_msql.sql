SELECT @@datadir;

USE olejki_mysql;

SELECT * 
FROM olejki;
-- pokazuje tabele
SHOW tables;

-- opisy itp
DESCRIBE olejkiostrzezenia;
DESCRIBE olejki;
DESCRIBE roslinyskladniki;
describe zapachy;

SELECT NazwaOlejku AS 'nazwa polska', NazwaLacinska AS 'nazwa laciska'
FROM olejki;

SELECT zapach AS 'zapach'
FROM zapachy;

SELECT concat(NazwaOlejku, ' ', '(',  NazwaLacinska, ')') AS 'Nazwa_laciska'
FROM olejki;

SELECT zapach AS 'nazwa zapachu'
FROM zapachy
LIMIT 4;

-- 10 pierwszych nazww
SELECT NazwaOlejku AS nazwa_olejku
	FROM olejki
    GROUP BY NazwaOlejku
LIMIT 10;

SELECT SkladnikRosliny AS 'sladniki rosliny'
FROM roslinyskladniki
GROUP BY SkladnikRosliny
LIMIT 4;

-- rupownie i sortowanie  olejków
SELECT NazwaOlejku AS 'nazwa polska'
FROM olejki
ORDER BY NazwaLacinska DESC

LIMIT 5;

-- najwyższe identyfikatory nazw lacinski

SELECT NazwaLacinska AS Nazwa_laciska
FROM olejki
ORDER BY IDOlejku DESC
LIMIT 5;

-- wszystkie oleki info 

SELECT *
FROM olejki
ORDER BY IDTypuRosliny ASC, NazwaOlejku DESC;

SELECT NazwaLacinska AS nazwy_lacinskie
FROM olejki
WHERE idolejku > 10;


-- a
SELECT *
FROM olejki 
WHERE IDOlejku <> 5 AND IDOlejku <> 6;
 -- b
SELECT *
FROM olejki 
WHERE IDOlejku NOT IN (5, 6) ; 
 
 -- zaczyna sie od d
SELECT NazwaLacinska AS nazwy_lacinskie
FROM olejki
WHERE NazwaOlejku LIKE 'D%';
 
 -- like ___%%
SELECT *
FROM olejki
WHERE NazwaLacinska LIKE '_a%'; 

-- długość srtinka a lamerska b pro
SELECT IDOlejku AS ID_olekow
FROM olejki
WHERE NazwaOlejku LIKE '_____';

SELECT IDOlejku AS ID_olekow
FROM olejki
WHERE length(NazwaOlejku) = 5;

-- rózne id od 5 i druga lirera w lacinskiej to i
SELECT * 
FROM olejki
WHERE IDSkladnikaRosliny <> 5 AND NazwaLacinska LIKE '_i%';


SELECT NumZapachu AS 'nr zaachu', Zapach AS 'zapach'
FROM zapachy
WHERE IDZapachu BETWEEN 3 AND 12;


SELECT NazwaLacinska AS nazwa_lacinkska
FROM olejki
WHERE NazwaOlejku IN('róża', 'mirra', 'imbir');

-- id 456 
SELECT *
FROM zapachy
WHERE IDZapachu IN(4,6,10);

-- 7 pierwzych
SELECT ostrzezenie, opis
FROM ostrzezenia
LIMIT 7;

-- zaczynajace sie od d do l wlacznie
SELECT NazwaOlejku AS Nazwa_olejku
FROM olejki
WHERE NazwaOlejku Between 'D%' AND 'm%'
order by NazwaOlejku; 

SELECT NazwaOlejku AS Nazwa_olejku
FROM olejki
WHERE LEFT(NazwaOlejku,1) Between 'D' AND 'm'
order by NazwaOlejku; 

-- nie takie  zaczynające od e
SELECT IDolejku AS id, NazwaOlejku AS 'nazwa olejku'
FROM olejki
WHERE NazwaOlejku NOT LIKE 'E%';

-- można też bawić sie w ory  ale poco zaczynające sie od a do g
SELECT NazwaOlejku AS 'nazwa olejku'
FROM olejki
WHERE LEFT(NazwaOlejku,1) between 'a' AND 'g'
ORDER BY NazwaOlejku;

-- opis nie zaczynający sie od n i di > 7
SELECT idostrzezenia as id, opis
FROM ostrzezenia
WHERE ostrzezenie NOT LIKE 'n%' AND idostrzezenia > 7;


-- Idolejku, nazwelaciska jako alsias nazwalacinska i nazwa olejku, dla wierszy spelniajacych warunek: nazwaolejku rozpoczyna sie od litery A, B C
-- posrtowac nierosnaco

SELECT idolejku, nazwalacinska AS 'Nazwa Łacińska', nazwaolejku AS 'Nazwa'
From olejki
where left(nazwaolejku, 1) between 'a' and 'b'
order by nazwaolejku DESC;
-- zle

-- olejki ceny wyswietlic 9 najtanszych

select nazwaolejku AS 'Nazwa', cena
from olejki, olejkiceny
ORDER BY 2
LIMIT 9;

-- olejkiceny; policz ile lacznie jast olejkow o danej
 -- objetosci i wyszczegolnij jaki stanowia one procent wszystkich zasobow lacznie

select count(idolejku)AS 'ilosc olejku', objetosc_ml AS 'Objetosc', round(count(idolejku)/47*100,2) AS 'procent' 
from olejkiceny
group by 2;-- zle

select
	objetosc_ml, count(*) AS ile_olejkow, sum(100) / licz AS procent_zasobow
from olejkiceny
cross join
	(select count(*) AS licz
    from olejkiceny) licz
group by 1;

