CLASS zcl_01_abap_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_abap_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA vorname TYPE string.
    DATA nachname TYPE string.

    vorname = 'Bruce'.
    nachname = 'Wayne'.


    out->write( 'Hello' && | | && vorname && | | && nachname  && ', how are you?' ).

  ENDMETHOD.
ENDCLASS.
