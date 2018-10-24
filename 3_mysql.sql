use olejki_mysql;


-- roślina z której nie robią olejków
select typrosliny as 'typ rosliny'
from olejki o 
	right join
	roslinytypy rt 
    On 
    rt.Idtypurosliny = o.idtypurosliny
where nazwaolejku is null;

-- nazwy olejków z ostrzerzeniami i opisem posortowane tak zeby pierwsze były te z ostrzerzeniami

select nazwaolejku as 'nazwa olejku', Ostrzezenie as 'ostrzezenie', Opis
from olejki ol
	left join
    olejkiostrzezenia oo on ol.idolejku =oo.idolejku
    left join ostrzezenia o
    on oo.idostrzezenia = o.idostrzezenia
order by Ostrzezenie DESC, nazwaolejku ASC;

-- Wypisz wszystkie nazwy olejków, z których można korzystać bez żadnych przeciwskazań

select nazwaolejku as 'nazwa olejku'
from olejki ol
	left join
    olejkiostrzezenia oo on ol.idolejku =oo.idolejku
    left join ostrzezenia o
    on oo.idostrzezenia = o.idostrzezenia
where ostrzezenie is null;

-- wypisz nazwy i nazwy łacińskie olejków mających słodku zapach

select nazwaolejku as 'nazwa olejku', nazwalacinska as 'nazwa łacińska'
from olejki o
	left join olejkizapachy oz on o.idolejku = oz.idolejku
    left join zapachy z on oz.idzapachu = z.idzapachu
where zapach = 'słodki';

-- wypisz nazwy olejkow mających choć jedno z działań uspokajający lub antydepresyjny

select distinct nazwaolejku as 'nazwa olejku', charakterystyka 
from olejki o
	left join olejkicharakterystyki oc on o.idolejku = oc.idolejku
    left join charakterystyki c on oc.idcharakterystyki = c.idcharakterystyki
where charakterystyka in ('uspokajający', 'antydepresyjny');

-- które olejki mające charakter pobudzający i moczopędny i kwiatowy zapach

select distinct nazwaolejku as 'nazwa olejku'
from olejki o
	join olejkicharakterystyki oc on o.idolejku = oc.idolejku
    join charakterystyki c on oc.idcharakterystyki = c.idcharakterystyki
	join olejkizapachy oz on o.idolejku = oz.idolejku
    join zapachy z on oz.idzapachu = z.idzapachu
where charakterystyka in ('pobudzający', 'moczopędny') and zapach = 'kwiatowy';

-- jakich olejków nie powinny zażywać kobiety ciężarne albo chore na apilepsje 

select nazwaolejku as 'Nazwa olejku'
from olejki o
	join olejkiostrzezenia oo on o.idolejku = oo.idolejku
    join ostrzezenia os on oo.idostrzezenia = os.idostrzezenia
where ostrzezenie in ('ciąża', 'epilepsja');

-- typy roślin z których produkowane są olejki z bazy

select distinct typrosliny
from roslinytypy rt
	join olejki o on rt.idtypurosliny = o.idtypurosliny;

-- składniki roślinne z których robią

select distinct skladnikrosliny
from roslinyskladniki rs
	join olejki o on rs.idskladnikarosliny = o.idskladnikarosliny;

-- wyswietl nazwe olejku, date produkcji a w oddzielnych kolumnach miesiac, ilosc tygodni od daty produkcji do dnia dzisiejszego, 
-- ilosc dni od daty produkcji do dnia dzisiejszego

select nazwaolejku as nazwa,
		dataprodukcji as data_produkcj,
        month(dataprodukcji) as miesiac,
        floor(datediff(now(), dataprodukcji)/7) as tygodnie,
        datediff(now(), dataprodukcji) as dnie
from olejki;

-- wypisz nazwy olejkow , nazwe lacinską date produkcji ale tlko dzien i miesiac w oddzielnych kolumnach

select upper(nazwaolejku) as Nazwa_olejku, lower(nazwalacinska)as Nazwa_lacinska,  month(dataprodukcji) as miesiac, datediff(now(), dataprodukcji) as dni
from olejki;

-- nazwa olejku i data produkcji z 2013

select nazwaolejku, dataprodukcji
from olejki o
where year(dataprodukcji) = 2013;

-- 