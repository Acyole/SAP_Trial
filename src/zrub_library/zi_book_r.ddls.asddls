@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cadastro de Livros'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_BOOK_R
  as select from zlib_books_r
  
  composition [0..*] of ZI_COPY_R  as _Copies
  
  association [1] to ZI_CATEGORY_R as _Category 
  on $projection.Category = _Category.Category
  
  association [1] to ZI_BOOK_COPY_SUM_R as _CopySum 
  on $projection.BookUuid = _CopySum.BookUuid
{
  key book_uuid             as BookUuid,

      @EndUserText.label: 'Título'
      title                 as Title,

      @EndUserText.label: 'Autor'
      author                as Author,

      isbn                  as Isbn,
      category              as Category,
      
      /* Indicadores de Estoque (Vindos da Sumarização) */
      _CopySum.TotalCopies,
      _CopySum.AvailableCopies,
      _CopySum.StockCriticality,
      _CopySum.LoanCopies,
      _CopySum.ReservedCopies,
      _CopySum.MaintenanceCopies,
      _CopySum.LostCopies,
      _CopySum.DaysSinceLastMovement,
      _CopySum.MovementStatus,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at       as LastChangedAt,

      /* Adicionando a descrição da categoria via associação */
      _Category.Description as CategoryDescription,

      /* Compositions / Associations */
      _Copies,
      _Category,
      _CopySum
}
