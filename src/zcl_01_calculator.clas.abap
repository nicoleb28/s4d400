CLASS zcl_01_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    CLASS-METHODS divide
      IMPORTING
                "Datentyp Z01_DECIMAL selbst anlegen /Other ABAP Repository Object (Dictonary -> Data Element)
                operand1      TYPE z01_decimal
                operand2      TYPE z01_decimal
      RETURNING VALUE(result) TYPE z01_decimal
      RAISING   cx_sy_zerodivide. "weil unten ""raise""

    CLASS-METHODS calculate_precentage
      IMPORTING
                precentage              TYPE z01_decimal
                base                    TYPE z01_decimal
      RETURNING VALUE(precentage_value) TYPE z01_decimal.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_calculator IMPLEMENTATION.
  METHOD divide.
    "Eingabeprüfung
    IF operand2 IS INITIAL. "IF operand2 = 0.
      RAISE EXCEPTION TYPE cx_sy_zerodivide.
    ENDIF.

    result = operand1 / operand2.
*RETURN = operand1 / operand2.
  ENDMETHOD.

  METHOD calculate_precentage.
  precentage_value = precentage * base / 100.

  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.

  DATA(result) = zcl_01_calculator=>calculate_precentage( precentage = 30 base = 100 ).
  out->write( result ).

    TRY.
        DATA(result2) = zcl_01_calculator=>divide( operand1 = 5 operand2 = 3 ).
        out->write( result2 ).
      CATCH cx_sy_zerodivide INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.





