-- סעיף ב

create trigger t1 
before insert 
on 
Purchase
for each row 
execute procedure trigfi();

create or replace function trigfi() returns trigger as $$
declare unitinstock real;
declare unitpriceproduct real;
begin 
       select units from stock into unitinstock where new.bid = bid and new.code = code;
	   select uprice from product into unitpriceproduct where new.code = code;
	   if(new.units <= unitinstock) then 
	   update stock
	   set units = units - new.units
	   where new.bid = bid
	   and new.code = code;
	   
	   update receipt 
	   set total = total + (unitpriceproduct * new.units)
	   where new.bid = bid
	   and new.rdate = rdate 
	   and new. rtime = rtime;
	   
	   return new;
 else
       raise notice 'eror';
	   return null;
	   end if;
 end
 $$ language plpgsql;