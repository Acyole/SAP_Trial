CLASS lhc_zr_rub_flight DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Flight
        RESULT result,
      CheckSemanticKey FOR VALIDATE ON SAVE
        IMPORTING keys FOR Flight~CheckSemanticKey,
      CheckCarrierExist FOR VALIDATE ON SAVE
        IMPORTING keys FOR Flight~CheckCarrierExist,
      GetNameCarrier FOR DETERMINE ON SAVE
        IMPORTING keys FOR Flight~GetNameCarrier.
ENDCLASS.

CLASS lhc_zr_rub_flight IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD CheckSemanticKey.

    READ ENTITIES OF zr_rub_flight IN LOCAL MODE
    ENTITY Flight
    FIELDS ( uuid Carrid Connid ) WITH CORRESPONDING #( keys )
    RESULT DATA(connections).

    READ TABLE connections INTO DATA(connection) INDEX 1.

    SELECT FROM zrub_flight
        FIELDS uuid
        WHERE carrid = @connection-Carrid
          AND connid = @connection-Connid
        INTO TABLE @DATA(check_result).

    IF sy-subrc EQ 0.
      DATA(message) = me->new_message(
                          id          = 'ZCL_MESSAGE'
                          number      = '002'
                          severity    = ms-error
                          v1          = connection-Carrid
                          v2          = connection-Connid
                          ).

      DATA reported_record LIKE LINE OF reported-flight.
      reported_record-%tky              = connection-%tky.
      reported_record-%msg              = message.
      reported_record-%element-carrid   = if_abap_behv=>mk-on.
      reported_record-%element-connid   = if_abap_behv=>mk-on.
      APPEND reported_record TO reported-flight.

*      DATA failed_record LIKE LINE OF failed-flight.
*      APPEND failed_record TO failed-flight.

    ENDIF.

  ENDMETHOD.

  METHOD CheckCarrierExist.

    READ ENTITIES OF zr_rub_flight IN LOCAL MODE
    ENTITY Flight
    FIELDS ( Carrid ) WITH CORRESPONDING #( keys )
    RESULT DATA(connections).

    READ TABLE connections INTO DATA(connection) INDEX 1.

    SELECT SINGLE FROM /DMO/I_Carrier
           FIELDS AirlineID
           WHERE AirlineID = @connection-Carrid
           INTO @DATA(achouAirlineID).

    IF sy-subrc NE 0.
      DATA(message) = me->new_message(
                          id          = 'ZCL_MESSAGE'
                          number      = '003'
                          severity    = ms-error
                          v1          = connection-Carrid
                      ).

      DATA reported_record LIKE LINE OF reported-flight.
      reported_record-%tky              = connection-%tky.
      reported_record-%msg              = message.
      reported_record-%element-carrid   = if_abap_behv=>mk-on.
      APPEND reported_record TO reported-flight.

      DATA failed_record LIKE LINE OF failed-flight.
      APPEND failed_record TO failed-flight.

    ENDIF.

  ENDMETHOD.

  METHOD GetNameCarrier.
**********************************************************************
    READ ENTITIES OF zr_rub_flight IN LOCAL MODE
         ENTITY Flight
         FIELDS ( Carrid ) WITH CORRESPONDING #( keys )
         RESULT DATA(flights).
**********************************************************************

    READ TABLE flights INTO DATA(flight) INDEX 1.

    SELECT SINGLE
    FROM /DMO/I_Carrier
    FIELDS Name
    WHERE AirlineID = @flight-Carrid
    INTO @flight-NameCarrier.

    MODIFY flights FROM flight INDEX 1.

**********************************************************************
    DATA flight_update TYPE TABLE FOR UPDATE zr_rub_flight.

    " A linha a seguir trás os campos da tabela com os nomes para essa nova tabela de update
    flight_update = CORRESPONDING #( flights ).

    MODIFY ENTITIES OF zr_rub_flight IN LOCAL MODE
      ENTITY Flight
      UPDATE FIELDS ( NameCarrier ) WITH flight_update
      REPORTED DATA(reported_records).

    reported-flight = CORRESPONDING #( reported_records-flight ).

  ENDMETHOD.

ENDCLASS.
