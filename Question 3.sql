select c.CustomerId,
c.FirstName,
c.LastName,
sum(inv.UnitPrice) as invoices
from Invoice i
join InvoiceLine inv
on inv.Invoiceid = i.Invoiceid
join customer c
on c.customerid = i.customerid
group by c.CustomerId,c.FirstName,c.LastName
order by i.total desc
limit 1