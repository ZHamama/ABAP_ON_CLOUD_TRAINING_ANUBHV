@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cube of Sales'
@Metadata.ignorePropagatedAnnotations: false
@VDM.viewType: #COMPOSITE
@Analytics.dataCategory: #CUBE
define view entity ZCO_ATS_ZH_SALES_CUBE 
as select from ZCO_ATS_ZH_SALES( I_CURR: 'USD' ) as sales
association of many to many ZI_ATS_ZH_BP  as _BusinessPartnr
on $projection.Buyer = _BusinessPartnr.BpId
{
    key OrderId,
    key ItemId,
    OrderNo,
    Product,
//    Amount,
//    Currency,
    ConvertCurrency,
@Aggregation.default: #SUM
    ConvertedAmount,
    Qty,
    Uom,
    Buyer,
    ProductName,
    ProductCategory,
    _BusinessPartnr.CompanyName
}
