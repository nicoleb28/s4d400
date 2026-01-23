@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 8: Associations'

define view entity Z01_DEMO08
  as select from /dmo/connection

  //Aus sicht der Flugverbindung nach Fluggesellschaft (genau 1 Flugverbindung)
  association [1..1] to /dmo/carrier as _Carrier on  $projection.CarrierId = _Carrier.carrier_id

  association [0..*] to /dmo/flight  as _Flights on  _Flights.carrier_id    = $projection.CarrierId
                                                 and _Flights.connection_id = $projection.ConnectionId

{
  key carrier_id as CarrierId,
  key connection_id              as ConnectionId,
  key _Flights.flight_date       as FlightDate,
      airport_from_id            as AirportFromId,
      airport_to_id              as AirportToId,
      
      /* Associations. Exponieren/zur Verfügung stellen */
      _Carrier,
      _Flights
}
