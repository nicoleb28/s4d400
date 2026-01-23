@AbapCatalog.viewEnhancementCategory: [#NONE]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel'

@Search.searchable: true //Anwendung ist durchsuchbar

@Metadata.allowExtensions: true //Erlaubnis für die Erweiterung durch Metadaten
define root view entity ZC_01_TravelTP // C = ConsumptionView
  provider contract transactional_query
  as projection on ZR_01_TravelTP // R = Restricted
  // Wiederverwendbarkeit der Daten
{
  key TravelId,

      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Agency_StdVH', element: 'AgencyId' } }]
      AgencyId,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_01_CUSTOMERVH', element: 'CustomerId' } }]
      CustomerId,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,

      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH', element: 'Currency' } }]
      CurrencyCode,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Description,
      Status,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,

      /* Transient Data */
      StatusCriticality,
      CustomerName,

      /* Associations */
      _Bookings : redirected to composition child ZC_01_BookingTP
}
