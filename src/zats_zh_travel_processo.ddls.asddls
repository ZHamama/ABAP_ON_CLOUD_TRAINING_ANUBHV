@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection for Root Travel Entity'
@Metadata.ignorePropagatedAnnotations: false
@VDM.viewType: #CONSUMPTION
define root view entity ZATS_ZH_TRAVEL_PROCESSO 
as projection on ZATS_ZH_TRAVEL
{
    key TravelId,
    AgencyId,
    CustomerId,
    BeginDate,
    EndDate,
    BookingFee,
    TotalPrice,
    CurrencyCode,
    Description,
    OverallStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    /* Associations */
    _Agency,
    _Booking  : redirected to composition child ZATS_ZH_BOOKING_PROCESSOR,
    _Currency,
    _Customer,
    _Overallstatus
}
