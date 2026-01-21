@AbapCatalog.viewEnhancementCategory: [#NONE]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel'

@Search.searchable: true //Anwendung ist durchsuchbar

@Metadata.allowExtensions: true //Erlaubnis für die Erweiterung durch Metadaten
define view entity ZC_01_TravelTP // C = ConsumptionView
  as select from ZR_01_TravelTP // R = Restricted
  // Wiederverwendbarkeit der Daten
{
  key TravelId,
      AgencyId,
      CustomerId,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      Description,
      Status,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt
}
