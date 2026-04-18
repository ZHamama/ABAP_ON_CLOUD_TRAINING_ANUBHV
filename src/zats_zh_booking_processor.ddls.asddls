@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BOOKING Projection'
@Metadata.ignorePropagatedAnnotations: false
@VDM.viewType: #CONSUMPTION
define view entity ZATS_ZH_BOOKING_PROCESSOR as projection on ZATS_ZH_BOOKING
{
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    LastChangedAt,
    /* Associations */
    _Booking_Status,
    _BOOKSUPPL  : redirected to composition child ZATS_ZH_BOOKSUPPL_PROCESSOR,  
    _Carrier,
    _Connection,
    _Customer,
    _Travel : redirected to parent ZATS_ZH_TRAVEL_PROCESSO
}
