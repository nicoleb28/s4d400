CLASS zcl_01_demo_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_demo_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA text TYPE string. "Groß-/Kleinschreibung egal

    text = 'Hello World'. "Deklaration

* Ausgabe
    out->write( text ). "Wertzuweisung

  ENDMETHOD. "Keine geschw. Klammern -> z.B. Method + Endmethod

ENDCLASS.




