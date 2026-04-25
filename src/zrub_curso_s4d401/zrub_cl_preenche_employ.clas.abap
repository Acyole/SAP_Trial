CLASS zrub_cl_preenche_employ DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zrub_cl_preenche_employ IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA it_employ TYPE TABLE OF zrub_employee.

    it_employ = VALUE #(
      ( client = sy-mandt employee_id = '000001' birth_date = '19800101' entry_date = '20100101' annual_salary = '900000.50' currency_code = 'BRL'
        name = VALUE #( first_name = 'James' last_name = 'Kirk' )
        address = VALUE #( street = 'Enterprise St' city = 'Riverside' country = 'US' postal_code = '52501' status = 'A' ) )

      ( client = sy-mandt employee_id = '000002' birth_date = '19750512' entry_date = '20150320' annual_salary = '95000.97' currency_code = 'USD'
        name = VALUE #( first_name = 'Jean-Luc' last_name = 'Picard' )
        address = VALUE #( street = 'Vineyard Lane' city = 'La Barre' country = 'FR' postal_code = '70100' status = 'A' ) )

      ( client = sy-mandt employee_id = '000003' birth_date = '19920824' entry_date = '20200210' annual_salary = '55000.65' currency_code = 'EUR'
        name = VALUE #( first_name = 'Ada' last_name = 'Lovelace' )
        address = VALUE #( street = 'Algorithm Rd' city = 'London' country = 'GB' postal_code = 'SW1A' status = 'A' ) )

      ( client = sy-mandt employee_id = '000004' birth_date = '19881130' entry_date = '20180901' annual_salary = '75000.76' currency_code = 'BRL'
        name = VALUE #( first_name = 'Margaret' last_name = 'Hamilton' )
        address = VALUE #( street = 'Apollo Way' city = 'Cambridge' country = 'US' postal_code = '02139' status = 'A' ) )

      ( client = sy-mandt employee_id = '000005' birth_date = '19950115' entry_date = '20230101' annual_salary = '45000.04' currency_code = 'BRL'
        name = VALUE #( first_name = 'Alan' last_name = 'Turing' )
        address = VALUE #( street = 'Bletchley Park' city = 'Milton Keynes' country = 'GB' postal_code = 'MK3' status = 'P' ) )

      ( client = sy-mandt employee_id = '000006' birth_date = '19820310' entry_date = '20120505' annual_salary = '110000.01' currency_code = 'USD'
        name = VALUE #( first_name = 'Grace' last_name = 'Hopper' )
        address = VALUE #( street = 'Cobol Blvd' city = 'Arlington' country = 'US' postal_code = '22201' status = 'A' ) )

      ( client = sy-mandt employee_id = '000007' birth_date = '19900707' entry_date = '20211115' annual_salary = '68000.99' currency_code = 'EUR'
        name = VALUE #( first_name = 'Linus' last_name = 'Torvalds' )
        address = VALUE #( street = 'Kernel Ave' city = 'Helsinki' country = 'FI' postal_code = '00100' status = 'A' ) )

      ( client = sy-mandt employee_id = '000008' birth_date = '19871225' entry_date = '20190412' annual_salary = '82000.34' currency_code = 'BRL'
        name = VALUE #( first_name = 'Guido' last_name = 'Van Rossum' )
        address = VALUE #( street = 'Python Path' city = 'Amsterdam' country = 'NL' postal_code = '1011' status = 'A' ) )

      ( client = sy-mandt employee_id = '000009' birth_date = '19930418' entry_date = '20220801' annual_salary = '52000.45' currency_code = 'USD'
        name = VALUE #( first_name = 'Hedy' last_name = 'Lamarr' )
        address = VALUE #( street = 'Frequency St' city = 'Vienna' country = 'AT' postal_code = '1010' status = 'A' ) )

      ( client = sy-mandt employee_id = '000010' birth_date = '19840630' entry_date = '20110701' annual_salary = '125000.00' currency_code = 'BRL'
        name = VALUE #( first_name = 'Katherine' last_name = 'Johnson' )
        address = VALUE #( street = 'Orbit Circle' city = 'Hampton' country = 'US' postal_code = '23666' status = 'A' ) )
    ).

    DELETE FROM zrub_employee.
    INSERT zrub_employee FROM TABLE @it_employ.

    out->write( |{ sy-dbcnt } funcionários inseridos!| ).
  ENDMETHOD.

ENDCLASS.
