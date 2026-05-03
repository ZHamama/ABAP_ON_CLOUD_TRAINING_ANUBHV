@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BOKKING CDS FIRST CHILD'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define view entity ZATS_ZH_BOOKING
  as select from /dmo/booking_m
  composition [0..*] of ZATS_ZH_BOOKSUPPL            as _BOOKSUPPL
  association        to parent ZATS_ZH_TRAVEL               as _Travel  on  $projection.TravelId = _Travel.TravelId
  association of one to one /DMO/I_Customer          as _Customer       on  $projection.CustomerId = _Customer.CustomerID
  association of one to one /DMO/I_Carrier           as _Carrier        on  $projection.CarrierId = _Carrier.AirlineID
  association of one to one /DMO/I_Connection        as _Connection     on  $projection.ConnectionId = _Connection.ConnectionID
                                                                        and $projection.CarrierId    = _Connection.AirlineID
  association of one to one /DMO/I_Booking_Status_VH as _Booking_Status on  $projection.BookingStatus = _Booking_Status.BookingStatus
  association of one to one I_Currency               as _Currency       on  $projection.CurrencyCode = _Currency.Currency

{

  key travel_id       as TravelId,
  key booking_id      as BookingId,
      booking_date    as BookingDate,
      @Consumption.valueHelpDefinition: [{
      entity : {
      name : '/DMO/I_Customer' ,
      element: 'CustomerID' }
      }]

      customer_id     as CustomerId,

      @Consumption.valueHelpDefinition: [{
      entity : {
      name : '/DMO/I_Carrier' ,
      element: 'AirlineID' }
      }]
      carrier_id      as CarrierId,

      @Consumption.valueHelpDefinition: [{
      entity : {
      name : '/DMO/I_Connection' ,
      element: 'AirlineID' },
      additionalBinding: [{
      localElement: 'CarrierId',
      element: 'AirlineID'
      }]
      }]
      connection_id   as ConnectionId,
      flight_date     as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price    as FlightPrice,

      @Consumption.valueHelpDefinition: [{
      entity : {
      name : 'I_Currency' ,
      element: 'Currency' }
      }]
      currency_code   as CurrencyCode,

      @Consumption.valueHelpDefinition: [{
      entity : {
      name : '/DMO/I_Booking_Status_VH' ,
      element: 'BookingStatus' }
      }]
      booking_status  as BookingStatus,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      _Customer,
      _Carrier,
      _Connection,
      _Booking_Status,
      _Travel,
      _BOOKSUPPL,
      _Currency
}
