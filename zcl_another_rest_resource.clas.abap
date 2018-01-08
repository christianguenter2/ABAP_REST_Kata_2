CLASS zcl_another_rest_resource DEFINITION
  PUBLIC
  INHERITING FROM cl_rest_resource
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      if_rest_resource~get REDEFINITION.

ENDCLASS.


CLASS zcl_another_rest_resource IMPLEMENTATION.

  METHOD if_rest_resource~get.

    TYPES: BEGIN OF ty_data,
             key   TYPE string,
             value TYPE string,
           END OF ty_data.


    TRY.
        DATA(json) =  cl_bcs_convert=>string_to_xstring( /ui2/cl_json=>serialize( data = VALUE ty_data( key   = 'Test'
                                                                                                        value = '1234' ) ) ).

      CATCH cx_bcs INTO DATA(error).
    ENDTRY.

    mo_response->create_entity( )->set_binary_data( json ).

  ENDMETHOD.

ENDCLASS.
