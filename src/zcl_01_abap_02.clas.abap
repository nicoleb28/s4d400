CLASS zcl_01_abap_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_abap_02 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA kundennr Type n LENGTH 6.
    DATA vorname Type string.
    DATA nachname Type string.
    DATA fullname Type string.
    DATA city Type string.
    DATA country Type string.

    kundennr = 19286.
    vorname = 'Bruce'.
    nachname = 'Wayne'.
    fullname = vorname && | | && nachname.
    city = 'Gotham City'.
    country = '(US)'.


    out->write( kundennr && ',' && | | && fullname && ',' && | | && city && | | && country ).




  ENDMETHOD.
ENDCLASS.
