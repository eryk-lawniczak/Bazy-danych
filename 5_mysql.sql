use olejki_mysql;

-- średnia cena olejków dla każdej grupy olejków ptodukowanych z innych składników rośliny

select skladnikrosliny, round(avg(cena),2) AS 'Śrenidnia cena'
from olejkiceny
		join olejki on olejkiceny.idolejku = olejki.idolejku
        join roslinyskladniki on olejki.idskladnikarosliny = roslinyskladniki.idskladnikarosliny
group by skladnikrosliny;

-- wypisz nazwy olejków wraz z ilością określeń w tabeli charakterystyki ale tylko te olejki które określono przynaj 6  wyrażeniami
-- olejki posortuj tak by te i ajwższej liczbie określeń były jako pierwsze a jeśli olejki o takiej samej liczbie charakterystykto 
-- posortuj je wg alfabetu


select 
	nazwaolejku As Nazwa_olejku,
    count(ch.idcharakterystyki) as ilosc
from
	olejki o 
join olejkicharakterystyki oc on o.idolejku = oc.idolejku
join charakterystyki ch on oc.idcharakterystyki = ch.idcharakterystyki
group by 1
having count(ch.idcharakterystyki) >= 6
order by 2 desc, 1;

-- wypisz te olejki które mają 2 lub więcej ostrzerzeń

select 
	nazwaolejku As Nazwa_olejku,
    count(os.idostrzezenia) as ilosc
from
	olejki o 
join olejkiostrzezenia oo on o.idolejku = oo.idolejku
join ostrzezenia os on oo.idostrzezenia = os.idostrzezenia
group by 1
having count(os.idostrzezenia) >= 2
order by 2 desc, 1;


-- informacje o najwyższym stężeniu olejków dla każdej grupy olejków produkowanych z innych składników rośliny

select skladnikrosliny, (cast(max(os.stezenie) AS decimal (3 ,2)))  AS 'Maksymalne steżenie dla grupy'
from roslinyskladniki
		join olejki on roslinyskladniki.idskladnikarosliny = olejki.idskladnikarosliny
        join olejkistezenia os on olejki.idolejku = os.idolejku
group by skladnikrosliny
order by max(os.stezenie) desc;

-- oblicz jaka jest średnia cena olejków produktowanych z kwiató i średnia cena olejków produkowanych w żywicy

select 
	(cast(avg(cena) as DECIMAL (5, 2))) AS Średnia_cena,
    skladnikrosliny AS Składnik
from 
	olejkiceny oc
join olejki o on oc.idolejku = o.idolejku
join roslinyskladniki rs on o.idskladnikarosliny = rs.idskladnikarosliny
where skladnikrosliny IN ('żywica', 'kwiaty')
group by 2;

-- jakla jest łączna ilość opakokowań olejków produkowanych z krzewów a jaka z drzew 

select 
	sum(iloscopakowan) as ilosc_opakowan,
    typrosliny as skladnik
from 
	olejkiilosci oi
join olejki o on oi.idolejku = o.idolejku
join roslinytypy sr on o.idtypurosliny = sr.idtypurosliny
where typrosliny in ('drzewo', 'krzew')
group by typrosliny;

-- wypisz te grupy olejkow , dla ktorych laczna wartosc jest ponizej 5000

select 
	skladnikrosliny as Składnik,
    sum(oc.cena* oi.iloscopakowan) as Wartosc
from
	roslinyskladniki sr
join olejki o on sr.idskladnikarosliny = o.idskladnikarosliny
join olejkiceny oc on o.idolejku = oc.idolejku
join olejkiilosci oi on o.idolejku = oi.idolejku
group by skladnikrosliny
having sum(oc.cena * oi.iloscopakowan)  < 5000;

-- oblicz jaka jest cena 1 ml dla każdego olejku
-- jaka jestr nazwa olejku najwyższa najniższa i średnia cena 1ml olejku

select
	nazwaolejku as Nazwa,
    (cast(max(cena/objetosc_ml) AS DECIMAL (4, 2))) as 'max',
    (cast(min(cena/objetosc_ml) AS DECIMAL (4, 2))) as 'min',
    (cast(avg(cena/objetosc_ml) AS DECIMAL (4, 2))) as 'avg'
from 
	olejki o 
join olejkiceny oc on o.idolejku = oc.idolejku;


-- zsumuj wartosci wszystkic olejkow produkowanych z liści

select 
    skladnikrosliny as składnik,
    sum(cena * iloscopakowan) as wartosc
from 
	olejkiceny oc
join olejki o on oc.idolejku = o.idolejku
join roslinyskladniki s on o.idskladnikarosliny = s.idskladnikarosliny
join olejkiilosci oi on o.idolejku = oi.idolejku
where skladnikrosliny = 'Liście'
group by skladnikrosliny;

-- wypisz średnie stężenia olejków większe od 40%

select 
    typrosliny as typ, 
    (cast(avg(stezenie) as decimal (3,2)))

from 
	roslinytypy r
join 
	olejki o on r.idtypurosliny = o.idtypurosliny
join
	olejkistezenia os on o.idolejku = os.idolejku
group by typrosliny
having avg(stezenie) > 0.40;

-- jaka jest łączna ilosć olejków o zapachu miętowym

select 
    zapach, 
    (objetosc_ml * iloscOpakowan) as ilosc

from 
	zapachy z
    
    join
		olejkizapachy oz on z.idzapachu = oz.idzapachu
join 
	olejki o on oz.idolejku = o.idolejku
join
	olejkiilosci oi on o.idolejku = oi.idolejku
join
	olejkiceny oc on o.idolejku = oc.idolejku

where zapach = 'Miętowy'
group by zapach;

-- wypisz pierwszą piątkę zapachów które mają odpowiadającą im najwyższą w ml ilość lejków 
select 
    zapach, 
    sum(objetosc_ml * iloscOpakowan) as ilosc

from 
	zapachy z
    
    join
		olejkizapachy oz on z.idzapachu = oz.idzapachu
join 
	olejki o on oz.idolejku = o.idolejku
join
	olejkiilosci oi on o.idolejku = oi.idolejku
join
	olejkiceny oc on o.idolejku = oc.idolejku
group by zapach
order by 2 desc
limit 5;