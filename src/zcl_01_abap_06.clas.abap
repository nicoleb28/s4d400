CLASS zcl_01_abap_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS get_travel_with_customer
      IMPORTING travel_id                   TYPE  /dmo/travel_id
      RETURNING VALUE(travel_with_customer) TYPE zabap_travel_with_customer.


    CLASS-METHODS get_travels
      IMPORTING customer_id    TYPE /dmo/customer_id
      RETURNING VALUE(travels) TYPE z01_travels.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_abap_06 IMPLEMENTATION.
  METHOD get_travel_with_customer.
    TRY.
        travel_with_customer = CORRESPONDING #( zcl_abap_helper=>get_travel( travel_id ) ).
      CATCH zcx_abap_no_data.
        "handle exception
    ENDTRY.

    TRY.
        travel_with_customer = CORRESPONDING #( BASE ( travel_with_customer ) zcl_abap_helper=>get_customer( travel_with_customer-customer_id ) ).
      CATCH zcx_abap_no_data.
        "handle exception
    ENDTRY.

    ENDMETHOD.

    METHOD get_travels.

      TRY.
          travels = zcl_abap_helper=>get_travels( customer_id ).
        CATCH zcx_abap_no_data.
          "handle exception
      ENDTRY.




    ENDMETHOD.


  METHOD if_oo_adt_classrun~main.

    out->write( get_travel_with_customer( travel_id = '0400' ) ).

    DATA travels Type Z01_TRAVELS.
    DATA(current_date) = cl_abap_context_info=>get_system_date( ).

    travels = ZCL_01_ABAP_06=>get_travels( '0400' ).
    out->write( travels ).
    DELETE travels WHERE BEGIN_DATE < current_date.





  ENDMETHOD.
ENDCLASS.
