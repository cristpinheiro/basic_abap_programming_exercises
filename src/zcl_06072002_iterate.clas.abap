CLASS zcl_06072002_iterate DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_06072002_iterate IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    CONSTANTS count TYPE i VALUE 20.
    DATA numbers TYPE TABLE OF i.
    DATA(valueVar) = 0.
    DATA(pastValueVar) = 0.
    DATA(indexVar) = 1.
    DO count TIMES.
      IF indexVar = 1.
        APPEND valueVar TO numbers.
        valueVar = 1.
        indexVar = indexVar + 1.
      ENDIF.
      IF indexVar = 2.
        APPEND valueVar TO numbers.
        valueVar = 1.
        indexVar = indexVar + 1.
      ENDIF.
      DATA(soma) = valueVar + pastValueVar.
      APPEND soma TO numbers.
      pastValueVar = valueVar.
      valueVar = soma.
    ENDDO.

    DATA(output) = ``.
    LOOP AT numbers INTO DATA(actual).
      IF sy-tabix > 1.
        output = output && `, `.
      ENDIF.
      output = output && |{ actual }|.
    ENDLOOP.
    out->write( output ).
  ENDMETHOD.
ENDCLASS.
