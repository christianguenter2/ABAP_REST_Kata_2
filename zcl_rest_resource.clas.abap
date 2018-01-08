CLASS zcl_rest_resource DEFINITION
  PUBLIC
  INHERITING FROM cl_rest_resource
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: if_rest_resource~get REDEFINITION.

ENDCLASS.



CLASS ZCL_REST_RESOURCE IMPLEMENTATION.


  METHOD if_rest_resource~get.

    mo_response->create_entity( )->set_string_data( |Hello World!| ).

  ENDMETHOD.
ENDCLASS.
