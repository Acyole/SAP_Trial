@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exemplares do Livro'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_COPY_R
  as select from zlib_copies_r
  
  association to parent ZI_BOOK_R as _Book 
  on $projection.BookUuid = _Book.BookUuid
{
  key copy_uuid       as CopyUuid,
      book_uuid       as BookUuid,

      @EndUserText.label: 'Situação'
      status          as Status,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at as LastChangedAt,

      /* Association */
      _Book
}
