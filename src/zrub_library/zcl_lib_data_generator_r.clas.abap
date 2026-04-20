CLASS zcl_lib_data_generator_r DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lib_data_generator_r IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: lt_books   TYPE TABLE OF zlib_books_r,
          lt_copies  TYPE TABLE OF zlib_copies_r,
          lt_members TYPE TABLE OF zlib_members_r,
          lt_cats    TYPE TABLE OF zlib_cat_r.

    " 1. Limpar tabelas
    DELETE FROM zlib_books_r.
    DELETE FROM zlib_copies_r.
    DELETE FROM zlib_members_r.
    DELETE FROM zlib_cat_r.

    " 2. Categorias
    lt_cats = VALUE #(
      ( client = sy-mandt cat_id = 'FICC' description = 'Ficção Científica' )
      ( client = sy-mandt cat_id = 'TECH' description = 'Tecnologia e Código' )
      ( client = sy-mandt cat_id = 'HIST' description = 'História Geral' )
      ( client = sy-mandt cat_id = 'BIOG' description = 'Biografias' )
      ( client = sy-mandt cat_id = 'CIEN' description = 'Ciências e Natureza' )
    ).
    INSERT zlib_cat_r FROM TABLE @lt_cats.

    " 3. Livros e Exemplares (Gerando 15 livros com diferentes estados)
    " Usaremos uma macro ou helper para facilitar a inserção em cadeia
    DO 15 TIMES.
      TRY.
          DATA(lv_book_uuid) = cl_system_uuid=>create_uuid_x16_static( ).
        CATCH cx_uuid_error.
          "handle exception
      ENDTRY.

      CASE sy-index.
        WHEN 1.
          APPEND VALUE #( book_uuid = lv_book_uuid title = 'Clean Code' author = 'Robert C. Martin' isbn = '9780132350884' category = 'TECH' ) TO lt_books.
          TRY.
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'D' ) TO lt_copies. " Disponível
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'D' ) TO lt_copies. " Disponível
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'D' ) TO lt_copies. " Disponível
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'E' ) TO lt_copies. " Emprestado
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'E' ) TO lt_copies. " Emprestado
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'E' ) TO lt_copies. " Emprestado
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'E' ) TO lt_copies. " Emprestado
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'R' ) TO lt_copies. " Reservado
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'M' ) TO lt_copies. " Manutenção
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'P' ) TO lt_copies. " Perdido
              " ... Adicionar mais conforme necessário seguindo o padrão
            CATCH cx_uuid_error.
              "handle exception
          ENDTRY.
        WHEN 2.
          APPEND VALUE #( book_uuid = lv_book_uuid title = 'Duna' author = 'Frank Herbert' isbn = '9788576573135' category = 'FICC' ) TO lt_books.
          TRY.
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'D' ) TO lt_copies. " Disponível
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'D' ) TO lt_copies. " Disponível
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'E' ) TO lt_copies. " Emprestado
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'E' ) TO lt_copies. " Emprestado
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'E' ) TO lt_copies. " Emprestado
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'E' ) TO lt_copies. " Emprestado
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'E' ) TO lt_copies. " Emprestado
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'R' ) TO lt_copies. " Reservado
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'M' ) TO lt_copies. " Manutenção
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'P' ) TO lt_copies. " Perdido
              " ... Adicionar mais conforme necessário seguindo o padrão
            CATCH cx_uuid_error.
              "handle exception
          ENDTRY.
        WHEN 3.
          APPEND VALUE #( book_uuid = lv_book_uuid title = 'Sapiens' author = 'Yuval Noah Harari' isbn = '9788525063533' category = 'CIEN' ) TO lt_books.
          TRY.
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'D' ) TO lt_copies. " Disponível
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'D' ) TO lt_copies. " Disponível
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'D' ) TO lt_copies. " Disponível
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'D' ) TO lt_copies. " Disponível
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'D' ) TO lt_copies. " Disponível
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'E' ) TO lt_copies. " Emprestado
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'R' ) TO lt_copies. " Reservado
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'R' ) TO lt_copies. " Reservado
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'M' ) TO lt_copies. " Manutenção
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'P' ) TO lt_copies. " Perdido
              " ... Adicionar mais conforme necessário seguindo o padrão
            CATCH cx_uuid_error.
              "handle exception
          ENDTRY.
        WHEN 4.
          APPEND VALUE #( book_uuid = lv_book_uuid title = 'Steve Jobs' author = 'Walter Isaacson' isbn = '9788535919714' category = 'BIOG' ) TO lt_books.
          TRY.
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'D' ) TO lt_copies. " Disponível
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'D' ) TO lt_copies. " Disponível
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'D' ) TO lt_copies. " Disponível
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'E' ) TO lt_copies. " Emprestado
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'E' ) TO lt_copies. " Emprestado
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'E' ) TO lt_copies. " Emprestado
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'R' ) TO lt_copies. " Reservado
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'M' ) TO lt_copies. " Manutenção
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'P' ) TO lt_copies. " Perdido
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'P' ) TO lt_copies. " Perdido
              " ... Adicionar mais conforme necessário seguindo o padrão
            CATCH cx_uuid_error.
              "handle exception
          ENDTRY.
        WHEN 5.
          APPEND VALUE #( book_uuid = lv_book_uuid title = 'O Caminho dos Reis' author = 'Brandon Sanderson' isbn = '9788544102947' category = 'FICC' ) TO lt_books.
          TRY.
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'D' ) TO lt_copies. " Disponível
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'D' ) TO lt_copies. " Disponível
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'D' ) TO lt_copies. " Disponível
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'E' ) TO lt_copies. " Emprestado
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'E' ) TO lt_copies. " Emprestado
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'E' ) TO lt_copies. " Emprestado
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'E' ) TO lt_copies. " Emprestado
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'R' ) TO lt_copies. " Reservado
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'M' ) TO lt_copies. " Manutenção
              APPEND VALUE #( copy_uuid = cl_system_uuid=>create_uuid_x16_static( ) book_uuid = lv_book_uuid status = 'P' ) TO lt_copies. " Perdido
              " ... Adicionar mais conforme necessário seguindo o padrão
            CATCH cx_uuid_error.
              "handle exception
          ENDTRY.
      ENDCASE.
    ENDDO.

    INSERT zlib_books_r FROM TABLE @lt_books.
    INSERT zlib_copies_r FROM TABLE @lt_copies.

    " 4. Membros
    lt_members = VALUE #(
      ( member_id = '12345678901' name = 'Carlos Drummond' email = 'carlos@poesia.com' )
      ( member_id = '98765432100' name = 'Ada Lovelace' email = 'ada@firstcoder.com' )
      ( member_id = '77345678901' name = 'André Toledo' email = 'andre@navegar.com' )
      ( member_id = '55765432100' name = 'Sakura Ushira' email = 'sakura123@anime.com' )
      ( member_id = '03405678901' name = 'Bruce Wayne' email = 'batman_dc@comics.com' )
      ( member_id = '56765432100' name = 'Clark Kent' email = 'super_dc@comics.com' )
    ).
    INSERT zlib_members_r FROM TABLE @lt_members.

    out->write( 'Biblioteca populada com sucesso! Pressione F9 para ver os dados.' ).
  ENDMETHOD.

ENDCLASS.
