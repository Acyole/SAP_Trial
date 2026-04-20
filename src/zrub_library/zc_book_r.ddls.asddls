@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection - Cadastro de Livros'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_BOOK_R
  as projection on ZI_BOOK_R
{
  key BookUuid,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      Title,

      @Search.defaultSearchElement: true
      Author,

      Isbn,

      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_CATEGORY_R', element: 'Category' } }]
      Category,

      CategoryDescription,

      /* Dados Analíticos que criamos */
      TotalCopies,
      AvailableCopies,
      StockCriticality,
      DaysSinceLastMovement,
      MovementStatus,

      /* Adicionando as composições para navegação */
      _Copies : redirected to composition child ZC_COPY_R,
      _Category
}
