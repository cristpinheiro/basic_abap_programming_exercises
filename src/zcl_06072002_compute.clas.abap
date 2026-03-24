CLASS zcl_06072002_compute DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_06072002_compute IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA number1 TYPE i VALUE -8.
    DATA number2 TYPE i VALUE 0.
    DATA op TYPE c LENGTH 1.
    DATA output TYPE string.
    " DATA result TYPE i.
    DATA result TYPE p LENGTH 8 DECIMALS 2.
    op = '/'.
    TRY.
        CASE op.
          WHEN '+'.
            result = number1 + number2.
          WHEN '-'.
            result = number1 - number2.
          WHEN '*'.
            result = number1 * number2.
          WHEN '/'.
            result = number1 / number2.
          WHEN OTHERS.
            RAISE EXCEPTION TYPE cx_sy_range_out_of_bounds.
        ENDCASE.
      CATCH cx_sy_range_out_of_bounds.
        out->write( 'INVALID OPERATION' ).
        RETURN.
      CATCH cx_sy_zerodivide.
        out->write( 'DIVISION OPERATION INVALID' ).
        RETURN.
    ENDTRY.
    output = number1 && op && number2 && '=' && result.
    out->write( output ).
  ENDMETHOD.
ENDCLASS.
