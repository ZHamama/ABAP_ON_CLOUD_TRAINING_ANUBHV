@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BOOKSuplment Projection entity view'
@Metadata.ignorePropagatedAnnotations: false
@VDM.viewType: #CONSUMPTION
define view entity ZATS_ZH_BOOKSUPPL_PROCESSOR 
as projection on ZATS_ZH_BOOKSUPPL
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    SupplementId,
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _BOOKING       : redirected to parent ZATS_ZH_BOOKING_PROCESSOR,
    _Supplement,
    _SupplementText,
    _Travel       : redirected to  ZATS_ZH_TRAVEL_PROCESSO
}
