@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel with Customer'
define view entity Z01_TravelWithCustomer
  as select from Z01_Customer as c
    inner join   Z01_Travel   as t on c.CustomerId = t.CustomerId

{
  key c.CustomerId,
  key t.TravelId,
      c.FirstName,
      c.LastName,
      c.Title,
      c.Street,
      c.PostalCode,
      c.City,
      c.CountryCode,
      t.AgencyId,
      t.BeginDate,
      t.EndDate,
      t.BookingFee,
      t.TotalPrice,
      t.CurrencyCode,
      t.Description,
      t.Status
}

where
  c.CountryCode = 'DE'
