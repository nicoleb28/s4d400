CLASS zcl_01_demo_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_demo_06 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA connection  TYPE z01_connection.
    data flight type z01_flight.
    data flight_extended type z01_flight_extended.


    connection-carrier_id = 'LH'.
    connection-connection_id = '0400'.
    connection-airport_from_id = 'FRA'.
    connection-airport_to_id = 'JFK'.

    flight-carrier_id = 'LH'.
    flight-connection_id = '0400'.
    flight-flight_date = '20260113'.

    flight_extended = corresponding #( flight ).
    flight_extended = corresponding #( BASE ( flight_extended ) connection ).

    out->write( connection ).

  ENDMETHOD.
ENDCLASS.





