@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ABAP-CDS-05'

define view entity Z01_CustomerKPIs 
  with parameters
    P_City : /dmo/city
  as select from Z01_TravelWithCustomer
{
  key CustomerId,
      CustomerName,
      Street,
      PostalCode,
      City,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum(BookingFee + TotalPrice)    as TotalRevenue,
      avg(Duration as abap.dec(16,0)) as AverageDuration,
      CurrencyCode,
      count( distinct AgencyId )      as NumberOfDifferentAgencyIds

}

where
  City = $parameters.P_City

group by
  CustomerId,
  CustomerName,
  Street,
  PostalCode,
  City,
  CurrencyCode

having
  sum(BookingFee + TotalPrice) >= 5000
