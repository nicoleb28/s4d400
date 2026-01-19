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
    DATA vehicle TYPE REF TO zcl_01_vehicle.
    DATA vehicles TYPE TABLE OF REF TO zcl_01_vehicle.
    DATA truck TYPE REF TO zcl_01_truck.

    DATA rental TYPE REF TO zcl_01_rental.
    DATA carrier TYPE REF TO zcl_01_carrier.
    DATA partners TYPE TABLE OF REF TO zif_01_partner.

    "Instanziierungen (Objecterzeugungen)
    out->write( zcl_01_vehicle=>number_of_vehicles ).

    vehicle = NEW zcl_01_truck( make = 'Porsche'
        model = '911'
        cargo_in_tons = 5 ). "Fahrzeug wird erzeugt (Referenz)
    APPEND vehicle TO vehicles.

    vehicle = NEW zcl_01_car( make = 'MAN' model = 'TGX' seats = 3 ).
    APPEND vehicle TO vehicles.

    vehicle = NEW zcl_01_car( make = 'Skoda' model = 'Superb Combi' seats = 5 ).
    APPEND vehicle TO vehicles.

    rental = NEW #(  ).
    carrier = NEW #( 'Lufthansa' ).

    APPEND rental TO partners.
    APPEND carrier TO partners.

    "Ausgabe
    out->write( zcl_01_airplane=>number_of_airplanes ).


    LOOP AT vehicles INTO vehicle.
      TRY.
          vehicle->accelerate( 30 ).
          vehicle->accelerate( 10 ).
          vehicle->accelerate( 100 ).
        CATCH zcx_01_value_too_high INTO DATA(x).
          out->write( | { vehicle->make } { vehicle->model } { vehicle->speed_in_kmh } km/h | ).
      ENDTRY.


      IF vehicle IS INSTANCE OF zcl_01_truck.
        truck = CAST #( vehicle ). "Truck truck = (Truck) vehicle -> Downcast
        truck->transform( ).
        out->write( | { COND #( WHEN truck->is_transformed = 'X' THEN 'Der LKW hat sich in  einen Autobot transformiert'
        ELSE 'Der Autobot hat sich wieder in einen LKW transformiert' ) } | ).
      ENDIF.
      out->write( vehicle->to_string( ) ).


      LOOP AT partners INTO DATA(partner).
        out->write( partner->to_string( ) ).

        IF partner IS INSTANCE OF zcl_01_carrier.
          rental = CAST #( partner ).
          out->write( carrier->get_biggest_cargo_plane( ) ).
        ENDIF.
      ENDLOOP.


    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
