CLASS zcl_01_demo_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_demo_04 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    WHILE sy-index <= 10.
      out->write( sy-index ).
    ENDWHILE.

    Do 10 Times.
    out->write( sy-index ).
    ENDDO.

  ENDMETHOD.
ENDCLASS.
