CLASS zcl_01_rental DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  Interfaces zif_01_partner.
    TYPES ty_vehicles TYPE TABLE OF REF TO zcl_01_vehicle.
    DATA vehicles TYPE ty_vehicles READ-ONLY.

    METHODS add_vehicle
      IMPORTING vehicle TYPE REF TO zcl_01_vehicle.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_rental IMPLEMENTATION.
  METHOD add_vehicle.
    APPEND vehicle TO vehicles.
  ENDMETHOD.


  METHOD zif_01_partner~to_string.
    string = 'Ich bin die Autovermiedtung'.
  ENDMETHOD.

ENDCLASS.
