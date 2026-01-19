@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ABAP CDS 02'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z01_TravelWithCustomer
  as select from /dmo/customer as c
    inner join   /dmo/travel   as t on t.customer_id = c.customer_id

{
  key c.customer_id     as CustomerId,
  key t.travel_id       as TravelId,
      c.first_name      as FirstName,
      c.last_name       as LastName,
      c.title           as Title,
      c.street          as Street,
      c.postal_code     as PostalCode,
      c.city            as City,
      c.country_code    as CountryCode,
      c.last_changed_at as LastChangedAt,
      t.agency_id       as AgencyId,
      t.begin_date      as BeginDate,
      t.end_date        as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      t.booking_fee     as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      t.total_price     as TotalPrice,
      t.currency_code   as CurrencyCode,
      t.description     as Description,
      t.status          as Status
}

where
  c.country_code = 'DE'
