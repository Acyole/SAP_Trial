@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite - Travel Itinerary'
@Metadata.ignorePropagatedAnnotations: false
define root view entity ZR_Itinerary_RUB
  as select from ZI_Booking_RUB as Booking
  association [1] to ZI_TRAVEL_RUB as _Travel on $projection.TravelID = _Travel.TravelId
{
      /* Chaves da Granularidade do Item */
  key Booking.TravelID,
  key Booking.BookingID,

      /* Dados do Item (Booking) */
      Booking.BookingDate,
      Booking.CarrierID,
      Booking.ConnectionID,
      Booking.FlightDate,
      Booking.FlightPrice,
      Booking.CurrencyCode,

      /* Dados do Cabeçalho (Travel) enriquecendo a linha */
      _Travel.AgencyId,
      _Travel.CustomerId,
      _Travel.BeginDate,
      _Travel.EndDate,
      _Travel.Status
}
