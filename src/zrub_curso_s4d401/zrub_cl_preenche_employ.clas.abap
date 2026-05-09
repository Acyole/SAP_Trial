CLASS zrub_cl_preenche_employ DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zrub_cl_preenche_employ IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA it_employ TYPE TABLE OF zrub_employee.
    DATA(lv_date) = cl_abap_context_info=>get_system_date( ).
    DATA(lv_time) = cl_abap_context_info=>get_system_time( ).
    DATA(lv_timestamp) = CONV abp_creation_tstmpl( lv_date && lv_time && '0' ).
    DATA(lv_user) = sy-uname.

    it_employ = VALUE #(
      ( client = sy-mandt employee_id = '000001' department_id = '000100' birth_date = '19800101' entry_date = '20100101' annual_salary = '900000.50' currency_code = 'BRL'
        name = VALUE #( first_name = 'James' last_name = 'Kirk' )
        address = VALUE #( street = 'Enterprise St' city = 'Riverside' country = 'US' postal_code = '52501' status = 'A' ) )

      ( client = sy-mandt employee_id = '000002' department_id = '000200' birth_date = '19750512' entry_date = '20150320' annual_salary = '95000.97'  currency_code = 'USD'
        name = VALUE #( first_name = 'Jean-Luc' last_name = 'Picard' )
        address = VALUE #( street = 'Vineyard Lane' city = 'La Barre' country = 'FR' postal_code = '70100' status = 'A' ) )

      ( client = sy-mandt employee_id = '000003' department_id = '000100' birth_date = '19920824' entry_date = '20200210' annual_salary = '55000.65'  currency_code = 'EUR'
        name = VALUE #( first_name = 'Ada' last_name = 'Lovelace' )
        address = VALUE #( street = 'Algorithm Rd' city = 'London' country = 'GB' postal_code = 'SW1A' status = 'A' ) )

      ( client = sy-mandt employee_id = '000004' department_id = '000100' birth_date = '19881130' entry_date = '20180901' annual_salary = '75000.76'  currency_code = 'BRL'
        name = VALUE #( first_name = 'Margaret' last_name = 'Hamilton' )
        address = VALUE #( street = 'Apollo Way' city = 'Cambridge' country = 'US' postal_code = '02139' status = 'A' ) )

      ( client = sy-mandt employee_id = '000005' department_id = '000300' birth_date = '19950115' entry_date = '20230101' annual_salary = '45000.04'  currency_code = 'BRL'
        name = VALUE #( first_name = 'Alan' last_name = 'Turing' )
        address = VALUE #( street = 'Bletchley Park' city = 'Milton Keynes' country = 'GB' postal_code = 'MK3' status = 'P' ) )
    ).

    " Preenchendo campos de auditoria (zrub_admin)
    MODIFY it_employ FROM VALUE #( created_by = lv_user
                                   created_at = lv_timestamp
                                   last_changed_by = lv_user
                                   last_changed_at = lv_timestamp
                                   local_last_changed_at = lv_timestamp )
           TRANSPORTING created_by created_at last_changed_by last_changed_at local_last_changed_at
           WHERE employee_id IS NOT INITIAL.

    DELETE FROM zrub_employee.
    INSERT zrub_employee FROM TABLE @it_employ.

    out->write( |{ sy-dbcnt } funcionários atualizados com departamento e auditoria!| ).
  ENDMETHOD.
ENDCLASS.
