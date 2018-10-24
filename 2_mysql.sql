-- nazwy olejkow ktore wytwarzane sa z calych roslin
-- i z lisci (skladnik roslini - liscie, cala roslina)
use olejki_mysql;
select nazwaolejku AS Nazwa
from olejki inner join roslinyskladniki on olejki.idskladnikarosliny = roslinyskladniki.IDSkladnikaRosliny
where skladnikrosliny in ('Liście', 'Cała roślina'); 

select nazwaolejku as nazwa
from olejki inner join roslinyskladniki on olejki.IDSkladnikaRosliny = roslinyskladniki.IDSkladnikaRosliny
where skladnikrosliny = 'liście'
		or skladnikrosliny like ' Cała roślina'
        order by skladnikrosliny; -- zle
        
select nazwalacinska as nazwa_lacinska
from roslinytypy inner join olejki on roslinytypy.IDTypuRosliny = olejki.IDTypuRosliny 
					inner join roslinyskladniki on olejki.IDSkladnikaRosliny = roslinyskladniki.IDSkladnikaRosliny
where 
	typrosliny = 'Krzew' and skladnikrosliny ='Kwiaty';
    
-- nazwy olejkow na M wytwarzane ze skladnika drzewo

select nazwaolejku as nazwa
from roslinytypy
	inner join
	olejki on
    roslinytypy.IDTypuRosliny = olejki.IDTypuRosliny
    where typrosliny = 'drzewo'
    and nazwaolejku like 'm%';