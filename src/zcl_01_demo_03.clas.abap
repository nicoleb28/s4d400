CLASS zcl_01_demo_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_demo_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    "Einfache Verzweigungen
    DATA age TYPE i VALUE 17.
    DATA gender TYPE c LENGTH 1 VALUE 'w'. "DATA gender.
    DATA first_name TYPE c LENGTH 40 VALUE 'Emily'.
    DATA last_name TYPE c LENGTH 40 VALUE 'Müller'.

    "Vergleichsoperatoren: >, >=, <, <=, =, <>
    "Logische Operatoren: AND, OR, NOT
    "+ IS (NOT) INITIAL
    IF age < 18. "Initaliwert: age = 0
      out->write( |Hallo { first_name }| ).
    ELSEIF gender = 'm' OR gender = 'M'. "Ausdruck auswerten: Einfaches Gleichzeichen für Vergleich
      out->write( |Hallo Herr { last_name }| ).
    ELSEIF gender = 'w' OR gender = 'W'.
      out->write( |Hallo Frau { last_name }| ).
    ELSE.
      out->write( |Hallo { last_name }| ).
    ENDIF.

    "SQL-Standard
    out->write( |Hallo { cond #( when age < 18 then first_name
    when gender = 'm' OR gender = 'M' then |Herr | && last_name
    when gender = 'w' OR gender = 'W' then |Frau | && last_name
    else last_name )  }| ).


  ENDMETHOD.
ENDCLASS.
