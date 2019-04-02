Select C.Email,C.FirstName,C.LastName,G.Name
From Customer C
Join Invoice I
On C.CustomerId= I.CustomerId
Join InvoiceLine Inv
On I.InvoiceId= Inv.InvoiceId
Join Track T
On T.TrackId = Inv.TrackId
Join Genre G
On G.GenreId = T.GenreId
where G.Name = 'Rock'
group by Email