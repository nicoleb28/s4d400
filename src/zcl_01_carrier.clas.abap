CLASS zcl_01_carrier DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
  Interfaces zif_01_partner.
    DATA name      TYPE string        READ-ONLY.
    DATA airplanes TYPE z01_airplane READ-ONLY.

    METHODS constructor
      IMPORTING !name TYPE string.

    METHODS add_airplane
      IMPORTING airplane TYPE REF TO zcl_01_airplane.

    METHODS get_biggest_cargo_plane
      RETURNING VALUE(biggest_cargo_plane) TYPE REF TO zcl_01_cargo_plane.
ENDCLASS.


CLASS zcl_01_carrier IMPLEMENTATION.
  METHOD add_airplane.
    APPEND airplane TO airplanes.
  ENDMETHOD.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD get_biggest_cargo_plane.
    DATA max_cargo_in_tons TYPE i VALUE 0.

    LOOP AT airplanes INTO DATA(airplane).
      IF     airplane IS INSTANCE OF zcl_01_cargo_plane
         AND airplane->get_total_weight_in_tons( )  > max_cargo_in_tons.
        biggest_cargo_plane = CAST #( airplane ).
        max_cargo_in_tons = biggest_cargo_plane->get_total_weight_in_tons( ).
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
  METHOD zif_01_partner~to_string.
    string = 'Ich bin die Fluggesellschaft'.
  ENDMETHOD.

ENDCLASS.
