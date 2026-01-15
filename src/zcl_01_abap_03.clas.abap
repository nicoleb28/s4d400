CLASS zcl_01_abap_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_abap_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA operand_1 TYPE p LENGTH 8 VALUE 5 DECIMALS 2.
    DATA operand_2 TYPE p LENGTH 8 VALUE 3 DECIMALS 2.
    DATA operator VALUE '/'.
    DATA result_p TYPE p LENGTH 8 DECIMALS 2.

    CASE operator.
      WHEN '+'.
        result_p = operand_1 + operand_2.
      WHEN '/'.
        result_p = operand_1 / operand_2.
      WHEN '-'.
        result_p = operand_1 - operand_2.
      WHEN '*'.
        result_p = operand_1 * operand_2.
      WHEN OTHERS.
    ENDCASE.
    out->write( |{ operand_1 NUMBER = USER } + { operand_2 NUMBER = USER } = { result_p }| ).

    result_p = SWITCH #( operator
                         WHEN '+' THEN operand_1 + operand_2
                         WHEN '-' THEN operand_1 - operand_2
                         WHEN '/' THEN operand_1 / operand_2
                         WHEN '*' THEN operand_1 * operand_2 ).

    out->write( |{ operand_1 NUMBER = USER } + { operand_1 NUMBER = USER } = { result_p }| ).

    result_p = operand_1 / operand_2.
    out->write( |{ operand_1 } / { operand_2 } = { result_p }| ).

    result_p = operand_1 * operand_2.
    out->write( |{ operand_1 } * { operand_2 } = { result_p }| ).

    result_p = operand_1 + operand_2.
    out->write( |{ operand_1 } + { operand_2 } = { result_p }| ).

    result_p = operand_1 - operand_2.
    out->write( |{ operand_1 } - { operand_2 } = { result_p }| ).







  ENDMETHOD.
ENDCLASS.
