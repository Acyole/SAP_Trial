@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection - Exemplares'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_COPY_R
  as projection on ZI_COPY_R
{
  key CopyUuid,
      BookUuid,
      Status,

      /* Redirecionamento para a Projeção do Pai */
      _Book : redirected to parent ZC_BOOK_R
}
