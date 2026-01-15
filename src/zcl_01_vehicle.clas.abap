CLASS zcl_01_vehicle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION. "Zugriffsmodifikator public
    METHODS set_make
      IMPORTING make TYPE string.
    METHODS: get_model RETURNING value(model) TYPE string,
             set_model IMPORTING model TYPE string,
             get_make RETURNING value(make) TYPE string.

  PROTECTED SECTION. "Zugriffsmodifikator protected
  PRIVATE SECTION. "Zugriffsmodifikator private
    DATA make TYPE string.
    DATA model TYPE string.
    DATA speed_in_kmh TYPE i.

ENDCLASS.



CLASS zcl_01_vehicle IMPLEMENTATION.
  METHOD set_make.
    me->make = make.
  ENDMETHOD.
  METHOD get_model.
    model = me->model.
  ENDMETHOD.

  METHOD set_model.
    me->model = model.
  ENDMETHOD.

  METHOD get_make.
    make = me->make.
  ENDMETHOD.

ENDCLASS.
