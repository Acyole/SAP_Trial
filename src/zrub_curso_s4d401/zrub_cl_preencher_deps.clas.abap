CLASS zrub_cl_preencher_deps DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zrub_cl_preencher_deps IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA lt_dept TYPE TABLE OF zrub_depment.
    DATA(lv_date) = cl_abap_context_info=>get_system_date( ).
    DATA(lv_time) = cl_abap_context_info=>get_system_time( ).
    DATA(lv_timestamp) = CONV abp_creation_tstmpl( lv_date && lv_time && '0' ).
    DATA(lv_user)      = sy-uname.

    lt_dept = VALUE #(
      ( id = '000100' description = 'Tecnologia da Informação' head_id = '000004' assistant_id = '000001' )
      ( id = '000200' description = 'Recursos Humanos'        head_id = '000002' assistant_id = '000009' )
      ( id = '000300' description = 'Financeiro'              head_id = '000005' assistant_id = '000008' )
    ).

    " Preenchendo os campos de auditoria (include zrub_admin)
    MODIFY lt_dept FROM VALUE #( created_by = lv_user
                                 created_at = lv_timestamp
                                 last_changed_by = lv_user
                                 last_changed_at = lv_timestamp
                                 local_last_changed_at = lv_timestamp )
           TRANSPORTING created_by created_at last_changed_by last_changed_at local_last_changed_at
           WHERE id IS NOT INITIAL.

    DELETE FROM zrub_depment.
    INSERT zrub_depment FROM TABLE @lt_dept.

    out->write( |{ sy-dbcnt } departamentos inseridos com sucesso!| ).
  ENDMETHOD.
ENDCLASS.
