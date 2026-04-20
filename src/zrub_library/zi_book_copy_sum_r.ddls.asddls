@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sumarização de Cópias e Status'

define view entity ZI_BOOK_COPY_SUM_R
  as select from zlib_copies_r
{
  key book_uuid                                           as BookUuid,

      /* Contadores por Status */
      @DefaultAggregation: #SUM
      count( distinct case when status = 'D' then 1 end ) as AvailableCopies,

      @DefaultAggregation: #SUM
      count( distinct case when status = 'E' then 1 end ) as LoanCopies,

      @DefaultAggregation: #SUM
      count( distinct case when status = 'R' then 1 end ) as ReservedCopies,

      @DefaultAggregation: #SUM
      count( distinct case when status = 'M' then 1 end ) as MaintenanceCopies,

      @DefaultAggregation: #SUM
      count( distinct case when status = 'P' then 1 end ) as LostCopies,

      @DefaultAggregation: #SUM
      count(*)                                            as TotalCopies,

      /* Lógica de Criticidade baseada em Disponíveis */
      case
        when count( distinct case when status = 'D' then 1 end ) = 0 then 1
        when count( distinct case when status = 'D' then 1 end ) = 1 then 2
        else 3
      end                                                 as StockCriticality,

      /* Função de Data Corrigida */
      dats_days_between(
        tstmp_to_dats( max(last_changed_at),
                       $session.user_timezone,
                       $session.client,
                       'INITIAL' ),
        $session.system_date
      )                                                   as DaysSinceLastMovement,

      case
      when dats_days_between(tstmp_to_dats( max(last_changed_at),$session.user_timezone,$session.client,'INITIAL' ),$session.system_date)
      > 90 then 'Parado'
      when dats_days_between(tstmp_to_dats( max(last_changed_at),$session.user_timezone,$session.client,'INITIAL' ),$session.system_date)
      > 30 then 'Pouco Giro'
      else 'Ativo'
      end                                                 as MovementStatus
}
group by
  book_uuid
