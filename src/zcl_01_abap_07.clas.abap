CLASS zcl_01_abap_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_abap_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    out->write( zcl_01_abap_06=>get_travels( '0440' ) ).


  ENDMETHOD.
ENDCLASS.
