@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection - Travel Itinerary'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define root view entity ZC_ITINERARY_RUB
  provider contract transactional_query
  as projection on ZR_Itinerary_RUB
{
  key TravelID,
  key BookingID,
      BookingDate,
      CarrierID,
      ConnectionID,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      AgencyId,
      CustomerId,
      BeginDate,
      EndDate,
      Status
}
