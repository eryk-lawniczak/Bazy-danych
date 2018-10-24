use olejki_mysql;

-- wyświetl nazwy olejków produkowanych z tego samego składnika co cynamon

select
	nazwaolejku 
from olejki
where
	nazwaolejku <> 'cynamon'
		and idskladnikarosliny in(select
								idskladnikarosliny
								from
									olejki
								where 
									nazwaolejku = 'cynamon');

/*select
	nazwaolejku As 'Nazwa olejku'
from 
	olejki
where 	nazwaolejku <> 'cynamon'
		and idskladnikarosliny or idtypurosliny in (select
								idtypurosliny
								from
									olejki
								where 
									nazwaolejku = 'cynamon');*/
                                    
select 
	nazwaolejku
from 
	olejki
where
	nazwaolejku != 'imbir' and idolejku  in (select
			idolejku
            from 
				olejkistezenia
			where stezenie = (select
						stezenie
                        from 
							olejkistezenia
                            where
                            idolejku = (select
								idolejku
								from
									olejki
								where
									nazwaolejku = 'imbir')));
                                    
-- wypisz stężenia i identyfikatory tych olejków ktore mają stężenie przynajmniej takie jak stężenie olejków: cynamon Eukaliptus majeranek

select 
	idolejku as identyfikator,
    stezenie 
from 
	olejkistezenia
where
	stezenie >= any (select stezenie
				from olejkistezenia
                where idolejku in(select idolejku
								from olejki
                                where nazwaolejku in( 'cynamon', 'eukaliptus', 'majeranek')));
                                
-- wypisz stezenia i identyfikatory tych olejków, które mają stężenia większe od stężeń olejków
select 
	idolejku as identyfikator,
    stezenie 
from 
	olejkistezenia
where
	stezenie > any (select stezenie
				from olejkistezenia
                where idolejku in(select idolejku
								from olejki
                                where nazwaolejku in( 'cynamon', 'eukaliptus', 'majeranek')))
                                order by 1 desc;
                                
-- podaj nazwy olejków, które mają taką samą cenę jak olejek o numerze 9

select nazwaolejku
from olejki 
where idolejku = (select idolejku
				from olejkiceny
                where cena = (select cena
							from olejkiceny
                            where idolejku = 9));
                            
-- podaj nazwy olejkóz z tym samych zapachem co [pomarańczowy
                            
select nazwaolejku 
from olejki
where nazwaolejku <> 'pomarańcza' and idolejku in (select idolejku
													from olejkizapachy
                                                    where idzapachu in (select idzapachu 
																		from olejkizapachy
                                                                        where olejkizapachy.idolejku = (select idolejku
																							from olejki
                                                                                            where nazwaolejku = 'pomarańcza')))
order by 1;	


-- wyswietl te typy roslinn ktorych srednia cena olejkow jest mniejsza niz olejkow produkowanych z typu krzew

select
	ceil(avg(cena)) as średnia, typrosliny as 'typrosliny'
from
	olejki 
		inner join 
	roslinytypy on olejki.idtypurosliny = roslinytypy.idtypurosliny 
		inner join 
	olejkiceny on olejki.idolejku = olejkiceny.idolejku
    group by typrosliny
having avg(cena) < (select avg(cena)
					from olejkiceny
                    where idolejku in (select idolejku
									from olejki
                                    where idtypurosliny = (select idtypurosliny 
														from roslinytypy
                                                        where typrosliny = 'krzew')));

-- podaj nazwy tych olejkow ktore maja wieksze stezenie niz srednie stezenie olejkow produkowanych z lisci
select 
	nazwaolejku
from 
	olejki
where idolejku in (
			select idolejku
            from olejkistezenia
            where stezenie > (
				select avg(stezenie)
                from olejkistezenia
                where idolejku in (
					select idolejku
                    from olejki
                    where idskladnikaroslny = (
						select idskladnikarosliny 
                        from roslinyskladniki
                        where skladkinrosliny ='liście')));
	