with c as(select Invoice.CustomerId as id_cst, Invoice.BillingCountry as Country, sum(Invoice.Total) as som from Invoice
join Customer on Invoice.BillingCountry = Customer.Country and Invoice.CustomerId = Customer.CustomerId
group by 1,2
order by 2 ),
Customers as (select Customer.CustomerId as cust_id, Customer.FirstName as name_customer, Customer.LastName as lastname_customer from Customer)

select customers.cust_id, customers.name_customer,customers.lastname_customer, b.country, b.max_som from Customers,
(select a.country as country, max(a.som) as max_som from
(select Invoice.CustomerId as id_cst, Invoice.BillingCountry as Country, sum(Invoice.Total) as som from Invoice join Customer on Invoice.BillingCountry = Customer.Country and Invoice.CustomerId = Customer.CustomerId
group by 1,2
order by 2 ) as a
group by 1
order by 2 ) as b
join c
on c.country = b.country and c.som = b.max_som
where Customers.cust_id = c.id_cst