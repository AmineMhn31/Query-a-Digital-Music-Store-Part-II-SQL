select billingcountry, Count(*) as number_invoices from Invoice
group by 1
order by 2 desc