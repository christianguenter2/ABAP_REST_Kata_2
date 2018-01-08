CLASS zcl_rest_resource_person DEFINITION
  PUBLIC
  INHERITING FROM cl_rest_resource
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      if_rest_resource~post REDEFINITION.

ENDCLASS.



CLASS ZCL_REST_RESOURCE_PERSON IMPLEMENTATION.


  METHOD if_rest_resource~post.

    DATA: BEGIN OF ls_request,
            name TYPE char50,
            age  TYPE i,
            city TYPE char50,
          END OF ls_request.

    DATA(lv_request_body) = mo_request->get_entity( )->get_string_data( ).

    /ui2/cl_json=>deserialize(
      EXPORTING
        json             = lv_request_body
      CHANGING
        data             = ls_request ).

    IF ls_request-name IS INITIAL.

      RAISE EXCEPTION TYPE cx_rest_resource_exception
        EXPORTING
          status_code    = cl_rest_status_code=>gc_client_error_bad_request
          request_method = if_rest_request=>gc_method_post.

    ENDIF.

    DATA(lo_response) = NEW zcl_complex_response( ).

    lo_response->name = ls_request-name.
    lo_response->age = ls_request-age.
    lo_response->city = ls_request-city.
    lo_response->telno = VALUE #(
      ( type = 'Home'   number = '1234567' )
      ( type = 'Mobile' number = '890873487' )
     ).

    DATA(lo_entity) = mo_response->create_entity( ).
    lo_entity->set_content_type( if_rest_media_type=>gc_appl_json ).
    lo_entity->set_string_data( /ui2/cl_json=>serialize( lo_response ) ).
    mo_response->set_status( cl_rest_status_code=>gc_success_ok ).

  ENDMETHOD.
ENDCLASS.
