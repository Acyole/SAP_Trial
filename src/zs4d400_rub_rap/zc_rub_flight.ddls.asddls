@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZRUB_FLIGHT'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_RUB_FLIGHT
  provider contract transactional_query
  as projection on ZR_RUB_FLIGHT
  association [1..1] to ZR_RUB_FLIGHT as _BaseEntity on $projection.UUID = _BaseEntity.UUID
{
  key UUID,
  Carrid,
  Connid,
  NameCarrier,
  Cityfrom,
  Cityto,
  Price,
  @Consumption: {
    valueHelpDefinition: [ {
      entity.element: 'Currency', 
      entity.name: 'I_CurrencyStdVH', 
      useForValidation: true
    } ]
  }
  Currency,
  @Semantics: {
    user.createdBy: true
  }
  CreatedBy,
  @Semantics: {
    systemDateTime.createdAt: true
  }
  CreatedAt,
  @Semantics: {
    user.lastChangedBy: true
  }
  LastChangedBy,
  @Semantics: {
    systemDateTime.lastChangedAt: true
  }
  LastChangedAt,
  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: true
  }
  LocalLastChangedAt,
  _BaseEntity
}
