@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ABAP-CDS-07'
define view entity Z01_CustomerWithTravels
  as select from Z01_Customer as c

//  association [1..1] to /dmo/customer as _Customer on $projection.CustomerId = _Customer.customer_id
  
  association [1..*] to Z01_Travel as _Travels on $projection.CustomerId = _Travels.CustomerId


{
  key CustomerId,
      FirstName,
      LastName,
      Title,
      Street,
      PostalCode,
      City,
      CountryCode,
      
      _Travels
}

where
  c.CountryCode = 'DE'
