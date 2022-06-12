declare
total number(6):=0;
bid int;
dt date;
cid int;
rate int;
l int;
n int;
q int:=0;
pnm varchar(20);
cnm varchar(20);
pr int;
flag int:=1;
fla int:=2;
pid int;
bcid int;
bill int;
begin
n:=&n;
for bd in (select * from  billdetails)
loop
pid:=bd.p_id;
bill:=bd.billid;
	if n=bd.billid then
		for b in (select * from tbl_billing where billid=bill)
		loop
			dt:=b.bill_date;
			cid:=b.id;
			bcid:=b.id;
		
			for p in (select * from tbl_product where p_id=pid)
			loop
				pr:=p.price;
				pnm:=p.name;
			end loop;	
			for c in (select * from tbl_customer where id = bcid)
			loop	
				cnm:=c.name;
			end loop;

		end loop;

		if flag=1 then 

			dbms_output.put_line('--------------------------------------------------------------------');
			dbms_output.put_line('BILL ID : '||n);
			dbms_output.put_line('BILL DATE : '||dt);
			dbms_output.put_line('Customer Name : '||cnm);
			dbms_output.put_line('--------------------------------------------------------------------');
			dbms_output.put_line('Product Id	Name		 Quantity  Rate/Kg          Total	');	
			dbms_output.put_line('--------------------------------------------------------------------');
			flag:=flag+1;
		end if;
		rate:=bd.qty*pr;
		total:=total+rate;
		q:=q+bd.qty;
		dbms_output.put_line(bd.p_id||'               '||rpad(pnm,20,' ') ||' '||bd.qty||'Kg    '||pr||'              '||rate);
		
	end if;
	
end loop;
	dbms_output.put_line('---------------------------------------------------------------------');
	dbms_output.put_line('Total  :'||'		   	     '||q||'Kg		    '||total||'/-');
	dbms_output.put_line('---------------------------------------------------------------------');			
	
end;
/