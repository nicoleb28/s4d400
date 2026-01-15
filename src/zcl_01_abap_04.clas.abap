CLASS zcl_01_abap_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    CLASS-METHODS calculate_precentage
      IMPORTING
                precentage              TYPE z01_decimal
                base                    TYPE z01_decimal
      RETURNING VALUE(precentage_value) TYPE z01_decimal
      RAISING cx_sy_zerodivide.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_01_abap_04 IMPLEMENTATION.
  METHOD calculate_precentage.
    IF base IS INITIAL. "IF operand2 = 0.
      RAISE EXCEPTION TYPE cx_sy_zerodivide.
    ENDIF.
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
  TRY.
    DATA(precentage_value) = ZCL_ABAP_CALCULATOR=>CALCULATE_POWER( exponent = 3 base = 100 ).
    out->write( precentage_value ).
    catch cx_sy_zerodivide into data(x).
    out->write( x->get_text( ) ).
   ENDTRY.


  ENDMETHOD.
ENDCLASS.
