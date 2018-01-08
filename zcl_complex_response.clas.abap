CLASS zcl_complex_response DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_phone_number,
             type   TYPE char50,
             number TYPE char50,
           END OF ty_phone_number,
           tt_phone_number TYPE STANDARD TABLE OF ty_phone_number
                                WITH NON-UNIQUE DEFAULT KEY.

    TYPES: BEGIN OF ty_address,
             street TYPE char50,
             city   TYPE char50,
           END OF ty_address.

    DATA: name    TYPE char50,
          age     TYPE i,
          city    TYPE char50,
          address TYPE ty_address,
          telno   TYPE tt_phone_number.

ENDCLASS.



CLASS ZCL_COMPLEX_RESPONSE IMPLEMENTATION.
ENDCLASS.
