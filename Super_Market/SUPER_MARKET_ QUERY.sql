-- סעיף ד

select Product.code,Product.pname
from Product
where Product.menu = 'manufacturer2'
AND   Product.uprice > 10;

select p.bid,p.rdate,p.rtime from Purchase p
where EXTRACT(MONTH FROM p.rdate) = EXTRACT(MONTH FROM current_date)
and (select count(p2.code)
	 from Purchase p2 
	  where p.bid = p2.bid
      and p.rdate = p2.rdate 
	  and p.rtime = p2.rtime) < 3; 

select p.bid,p.rdate,p.rtime from Purchase p
where EXTRACT(MONTH FROM p.rdate) = EXTRACT(MONTH FROM current_date)
and (select count(p2.code)
	 from Purchase p2 
	  where p.bid = p2.bid
      and p.rdate = p2.rdate 
	  and p.rtime = p2.rtime) < 3;

select s.sname,p.pname 
from Supplier s,Product p
where s.sid = p.sid
and (select count(p2.sid) 
	 from product p2
	 where p2.sid = p.sid) = 1;

select Brunch.bid, Brunch.bname
from Brunch, Receipt
where Brunch.bid = Receipt.bid 
AND Receipt.total = (select  max(Receipt.total) as total from Receipt) 

select distinct b.* 
from Branch b, Stock s
where b.bid = s.bid
group by b.bid,s.code
having not exists(SELECT * from product p1
where p1.code not in (SELECT s2.code from stock s2 where b.bid = s2.bid));

SELECT
r.bid, r.rdate, r.rtime ,count(DISTINCT pr.sid) AS  SupplierCount
from Receipt r natural join Purchase p natural join Product pr
WHERE r.total>50
AND NOT EXISTS ( SELECT 1 FROM Purchase x
                 natural join Product pr2
                 WHERE x.bid=r.bid
                 AND x.rdate=r.rdate
                 AND x.rtime=r.rtime
                 AND pr2.pname='cucumber')
GROUP BY r.bid, r.rdate, r.rtime
ORDER BY SupplierCount  limit 1;


