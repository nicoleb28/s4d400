CLASS zcl_01_airplane DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor IMPORTING id TYPE string plane_type TYPE string empty_weight_in_tons TYPE i
    RAISING ZCX_ABAP_INITIAL_PARAMETER.

    methods get_total_weight_in_tons returning value(total_weight_in_tons) type i.

    DATA id TYPE string READ-ONLY.
    DATA plane_type TYPE string READ-ONLY.
    DATA empty_weight_in_tons TYPE i READ-ONLY.

    CLASS-DATA number_of_airplanes TYPE i READ-ONLY.



  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_01_airplane IMPLEMENTATION.

  METHOD constructor.

    IF id is initial.
      RAISE EXCEPTION NEW ZCX_ABAP_INITIAL_PARAMETER( parameter = id ).
    ENDIF.

    IF plane_type is initial.
      RAISE EXCEPTION NEW ZCX_ABAP_INITIAL_PARAMETER( parameter = plane_type ).
    ENDIF.

    IF empty_weight_in_tons is initial.
      RAISE EXCEPTION NEW ZCX_ABAP_INITIAL_PARAMETER( parameter = 'Empty Weight' ).
    ENDIF.


  me->id = id.
  me->plane_type = plane_type.
  me->empty_weight_in_tons = empty_weight_in_tons.

  number_of_airplanes += 1.

  ENDMETHOD.

  METHOD get_total_weight_in_tons.
    total_weight_in_tons = empty_weight_in_tons * 11 / 10.
  ENDMETHOD.

ENDCLASS.
