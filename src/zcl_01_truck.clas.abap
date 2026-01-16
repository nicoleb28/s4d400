CLASS zcl_01_truck DEFINITION
  PUBLIC
  INHERITING FROM zcl_01_vehicle
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA cargo_in_tons TYPE i READ-ONLY.
    DATA is_transformed TYPE c LENGTH 1 READ-ONLY.

    METHODS constructor
      IMPORTING make          TYPE string
                model         TYPE string
                cargo_in_tons TYPE i.

    METHODS to_string REDEFINITION.

    METHODS transform returning value(is_transformed) type string.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_01_truck IMPLEMENTATION.
  METHOD constructor.
    super->constructor( make  = make
                        model = model ).
    me->cargo_in_tons = cargo_in_tons.
  ENDMETHOD.

  METHOD to_string.
    string = super->to_string( ).
    string &&= |, Frachtkapazität: { cargo_in_tons }t|.
  ENDMETHOD.

  METHOD transform.
    IF is_transformed = 'X'.
      is_transformed = ''.
    ELSE.
      is_transformed = 'X'.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
