CLASS zcl_01_demo_10 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_demo_10 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT
    FROM z01_DEMO08
    FIELDS CarrierId, ConnectionId, \_Carrier-name
*    WHERE CarrierId = 'LH'
    INTO TABLE @DATA(connections).

    out->write( connections ).

  ENDMETHOD.
ENDCLASS.
