use olejki_mysql;

-- zlicz olejki które mają słodki zapach, 
-- kolumnie wyliczanej nadaj alias

select count(o.idolejku) as Liczba_olejkow
from olejki o
	join olejkizapachy oz on o.idolejku = oz.idolejku
    join zapachy z on oz.idzapachu = z.idzapachu
where zapach ='słodki';

-- ile w bazie jest olejków dla których nie maopisu zapachów
select count(o.idolejku) as Liczba_olejkow
from olejki o
	left join olejkizapachy oz on o.idolejku = oz.idolejku
    left join zapachy z on oz.idzapachu = z.idzapachu
where  zapach is null;

-- zlicz dla każdego zapachy ilość olejków 
-- posortuj malejąco
select count(o.idolejku) as Liczba_olejkow, zapach as zapach
from olejki o
	left join olejkizapachy oz on o.idolejku = oz.idolejku
    left join zapachy z on oz.idzapachu = z.idzapachu
group by 2 ASC
order by 1 DESC;

-- oblicz przez  ile zapachów opisany jest każdy olejek 
-- posortuj nierosnąco

select nazwaolejku AS 'Nazwa olejku', count(zapach) AS 'Ilość zapachów'
from olejki o
	left join olejkizapachy oz on o.idolejku = oz.idolejku
    left join zapachy z on oz.idzapachu = z.idzapachu
Group by 1
order by 2 desc;

-- oblicz ile ostrzerzen ma każdy z olejków


-- oblicz jaka jest srednia cena olejku dla każdej grupy olejków produkowanych z innych składników

select round(avg(cena),2) As średnia_cena, skladnikrosliny As składnik_rośliny
from olejkiceny oc
	join olejki o on oc.idolejku = o.idolejku
    join roslinyskladniki os on o.idskladnikarosliny = os.idskladnikarosliny
group by 2
order by 1 DESC;
    
/*
	WYpisz nazwy olejków wraz z ilością określeń w tabeli charakterystyki ale tylko te olejki które określono przynajmniej 6 wyrażeniami
    olejki posortuj tak by te o najwyższej liczbie określeń były jako pierwsze a jeśli są olejki o takiej samej liczbie to alfabetycznie
*/

select nazwaolejku as Nazwa_olejku, count(charakterystyka) as liczba_określeń
from olejki o
	join olejkicharakterystyki oc on o.idolejku = oc.idolejku
    join charakterystyki c on oc.idcharakterystyki = c.idcharakterystyki
group by 1
having count(c.idcharakterystyki) >= 6
order by 2 Desc, 1; 

-- olejki 2 lub więcej ostrzezen

select nazwaolejku as Nazwa_olejku, count(os.idostrzezenia) as ilosc_ostrzezen
from olejki o
	join olejkiostrzezenia oo on o.idolejku = oo.idolejku
    join ostrzezenia os on oo.idostrzezenia = os.idostrzezenia
    group by 1
having count(os.idostrzezenia) >=2
order by 2;


select nazwaolejku as Nazwa_olejku, count(os.idostrzezenia) as ilosc_ostrzezen from olejki o join olejkiostrzezenia oo on o.idolejku = oo.idolejku join ostrzezenia os on oo.idostrzezenia = os.idostrzezenia group by 1 having count(os.idostrzezenia) >=2 order by 2;
