CLASS zcl_rub_copy DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rub_copy IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: it_flights TYPE TABLE OF zrub_flight.

    " 1. Preparando os dados de exemplo (Internal Table)
    it_flights = VALUE #(
      ( client = sy-mandt uuid = '1111222233334444' carrid = 'LH' connid = '0400' cityfrom = 'Frankfurt' cityto = 'New York' price = '850.50' currency = 'EUR' )
      ( client = sy-mandt uuid = '5555666677778888' carrid = 'AA' connid = '0017' cityfrom = 'New York'  cityto = 'Miami'    price = '320.00' currency = 'USD' )
      ( client = sy-mandt uuid = '9999000011112222' carrid = 'TP' connid = '0001' cityfrom = 'Lisboa'    cityto = 'Porto'    price = '150.00' currency = 'EUR' )
      ( client = sy-mandt uuid = 'AAAAABBBBBCCCCCD' carrid = 'AD' connid = '4002' cityfrom = 'Campinas'  cityto = 'Recife'   price = '600.00' currency = 'BRL' )
      ( client = sy-mandt uuid = 'DDDDDEEEEEFFFFFD' carrid = 'JJ' connid = '3030' cityfrom = 'São Paulo' cityto = 'Londres'  price = '4200.00' currency = 'BRL' )
      ( client = sy-mandt uuid = '1234123412341234' carrid = 'AF' connid = '0010' cityfrom = 'Paris'     cityto = 'Tóquio'   price = '1100.00' currency = 'EUR' )
      ( client = sy-mandt uuid = '4321432143214321' carrid = 'BA' connid = '0222' cityfrom = 'Londres'   cityto = 'Roma'     price = '250.00' currency = 'GBP' )
      ( client = sy-mandt uuid = '6789678967896789' carrid = 'QR' connid = '0701' cityfrom = 'Doha'      cityto = 'Sidney'   price = '1500.00' currency = 'USD' )
      ( client = sy-mandt uuid = '9876987698769876' carrid = 'EK' connid = '0202' cityfrom = 'Dubai'     cityto = 'Pequim'   price = '1350.00' currency = 'USD' )
      ( client = sy-mandt uuid = '0000111100001111' carrid = 'IB' connid = '0555' cityfrom = 'Madri'     cityto = 'México'   price = '980.00' currency = 'EUR' )
    ).

    " 2. Limpando dados antigos para evitar duplicidade (opcional)
    DELETE FROM zrub_flight.

    " 3. Inserindo os dados na tabela do banco de dados 🗄️
    INSERT zrub_flight FROM TABLE @it_flights.

    " 4. Feedback no console do Eclipse 🖥️
    out->write( 'Dados inseridos com sucesso na tabela ZRUB_FLIGHT!' ).
  ENDMETHOD.

ENDCLASS.
