CLASS zcl_01_main_vehicles DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_main_vehicles IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    "Deklarationen
    DATA vehicle TYPE REF TO zcl_00_vehicle.
    DATA vehicles TYPE TABLE OF REF TO zcl_00_vehicle.

    "Instanziierungen (Objecterzeugungen)
    vehicle = NEW #( make = 'Porsche' model = '911' ). "Fahrzeug wird erzeugt (Referenz)
    APPEND vehicle TO vehicles.

    vehicle = NEW #( make = 'MAN' model = 'TGX' ).
    APPEND vehicle TO vehicles.

    vehicle = NEW #( make = 'Skoda' model = 'Superb Combi' ).
    APPEND vehicle TO vehicles.
  "Ausgabe
    LOOP AT vehicles INTO vehicle.
    vehicle->accelerate( 30 ).
    vehicle->accelerate( 10 ).
    vehicle->accelerate( 100 ).
      out->write( | { vehicle->make } { vehicle->model } { vehicle->speed_in_kmh } km/h | ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
