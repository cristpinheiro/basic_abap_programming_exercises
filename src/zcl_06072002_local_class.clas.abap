CLASS zcl_06072002_local_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_06072002_local_class IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA connections TYPE TABLE OF REF TO lcl_connection.
    TRY.
        DATA(connection) = NEW lcl_connection( i_carrier_id = 'LH' i_connection_id = '0400' ).
        "connection->set_attributes( EXPORTING
        "i_carrier_id    = 'LH'
        "i_connection_id = '0400' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
    ENDTRY.
    TRY.
        connection = NEW lcl_connection( i_carrier_id = 'LH' i_connection_id = '0500' ).
        "connection->set_attributes( EXPORTING
        "i_carrier_id    = 'LH'
        "i_connection_id = '0500' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
    ENDTRY.
    TRY.
        connection = NEW lcl_connection( i_carrier_id = 'LH' i_connection_id = '0600' ).
        "connection->set_attributes( EXPORTING
        "i_carrier_id    = 'LH'
        "i_connection_id = '0500' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
    ENDTRY.
    DATA cn TYPE REF TO lcl_connection.
    LOOP AT connections INTO cn.
      out->write( cn->get_output( ) ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
