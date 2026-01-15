CLASS zcl_01_abap_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_abap_05 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

  DATA(customer) = ZCL_ABAP_HELPER=>get_customer( customer_id = '100').
  out->write( customer ).


  ENDMETHOD.
ENDCLASS.
