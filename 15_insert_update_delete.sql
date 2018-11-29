use kopia_olejki;

insert into olejki (idolejku, nazwaolejku)
values (52, 'Truskawka');

select * from olejki;

insert into olejki (idolejku, nazwaolejku)
values (53, 'Malina');
insert into olejki (idolejku, nazwaolejku)
values (54, 'Estragon');

update olejki
set  NazwaLacinska = 'Nieznana'
where nazwalacinska is null;

select nazwalacinska from olejki;

Update olejkiceny
set cena=cena+1
where idolejku between 5 and 10;

select * from olejkiceny
where idolejku in (select
idolejku from olejki where nazwaolejku like 'C%');

update olejkiceny
set cena = cena*1.1
where idolejku in (select
		idolejku from olejki where nazwaolejku like 'C%');

delete from olejki where nazwalacinska = 'Nieznana';

update olejkiceny 
set cena = cena*0.75
where cena > (
	select * from (select avg(cena) from olejkiceny) a);
    
update olejkiilosci
set iloscopakowan = (select *from (select iloscopakowan
from olejkiilosci inner join olejki on olejkiilosci.IDolejku=olejki.idolejku
where nazwaolejku = 'Majeranek') o)
where idolejku = (select idolejku from olejki where nazwaolejku = 'bazylia');

update olejkiilosci
set IloscOpakowan = IloscOpakowan+100
where IDOlejku in (select IDOlejku
from olejki where idskladnikarosliny = (select idskladnikarosliny 
from roslinyskladniki where skladnikrosliny = 'drewno'));
    
select * from roslinyskladniki;

update olejkiceny
set cena = cena*1.65
where idolejku in (select idolejku from olejki where idskladnikarosliny = (select idskladnikarosliny 
from roslinyskladniki where skladnikrosliny = 'kwiaty'));

update olejkiilosci
set iloscopakowan = iloscopakowan*1.1
where iloscopakowan < 35;

delete from olejkiostrzezenia
where idolejku in (select  idolejku
from olejki where nazwaolejku = 'cynamon');

delete from olejkizapachy
where idzapachu in (select idzapachu from zapachy  where zapach = 'ostry');

delete from olejki 
where idolejku = (select idolejku from olejkiostrzezenia having count(*) > 2);




	


        
