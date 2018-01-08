CLASS zcl_rest_handler DEFINITION
  PUBLIC
  INHERITING FROM cl_rest_http_handler
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: if_rest_application~get_root_handler REDEFINITION.

ENDCLASS.


CLASS zcl_rest_handler IMPLEMENTATION.

  METHOD if_rest_application~get_root_handler.

    DATA(lo_router) = NEW cl_rest_router( ).

    lo_router->attach( iv_template      = '/hello'
                       iv_handler_class = 'ZCL_REST_RESOURCE' ).
    lo_router->attach( iv_template      = '/document'
                       iv_handler_class = 'ZCL_ANOTHER_REST_RESOURCE' ).
    lo_router->attach( iv_template      = '/person'
                       iv_handler_class = 'ZCL_REST_RESOURCE_PERSON' ).

    ro_root_handler = lo_router.

  ENDMETHOD.

ENDCLASS.
