@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Membros da Biblioteca'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_MEMBER_R
  as select from zlib_members_r
{
      @EndUserText.label: 'ID do Membro'
  key member_id as MemberId,

      @EndUserText.label: 'Nome Completo'
      name      as Name,

      @EndUserText.label: 'E-mail de Contato'
      @Semantics.eMail.address: true
      email     as Email
}
