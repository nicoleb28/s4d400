@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 9: Path Expresions'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z01_DEMO09 as select from Z01_DEMO08
{
    key CarrierId,
    key ConnectionId,
    key FlightDate,
    AirportFromId,
    AirportToId,
    _Carrier.name as Name, 
    
    /* Associations */
    _Carrier,
    _Flights
}
