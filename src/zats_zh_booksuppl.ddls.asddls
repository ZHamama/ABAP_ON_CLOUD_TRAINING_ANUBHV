@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement child entity'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define view entity ZATS_ZH_BOOKSUPPL
  as select from /dmo/booksuppl_m
  association        to parent ZATS_ZH_BOOKING as _BOOKING    
  on  $projection.BookingId = _BOOKING.BookingId
  and $projection.TravelId  = _BOOKING.TravelId
  association of one to one ZATS_ZH_TRAVEL     as _Travel    
  on  $projection.TravelId = _Travel.TravelId
  association of one to one /DMO/I_Supplement  as _Supplement 
  on  $projection.SupplementId = _Supplement.SupplementID  
  association of one to one /DMO/I_SupplementText as _SupplementText
  on $projection.SupplementId  = _SupplementText.SupplementID
  
  
{

  key /dmo/booksuppl_m.travel_id             as TravelId,
  key /dmo/booksuppl_m.booking_id            as BookingId,
  key /dmo/booksuppl_m.booking_supplement_id as BookingSupplementId,
      /dmo/booksuppl_m.supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      /dmo/booksuppl_m.price                 as Price,
      /dmo/booksuppl_m.currency_code         as CurrencyCode,
@Semantics.systemDateTime.lastChangedAt: true
      /dmo/booksuppl_m.last_changed_at       as LastChangedAt,
      _BOOKING,
      _Travel,
      _Supplement,
      _SupplementText
}
