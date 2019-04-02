select billingcity,sum(total) as invoice_totals from Invoice
group by 1
order by 2 Desc
limit 1