@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Categorias de Livros'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CATEGORY_R
  as select from zlib_cat_r
{
      @EndUserText.label: 'Código'
  key cat_id      as Category,

      @EndUserText.label: 'Descrição'
      @Semantics.text: true -- Define que este campo é o texto da chave
      @Search.defaultSearchElement: true -- Permite buscar pelo texto
      description as Description
}
