@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Anakytical SALES Dshborad For Fiori 17042026'
@Metadata.ignorePropagatedAnnotations: false
@VDM.viewType: #CONSUMPTION
@Analytics.query: true
define view entity ZC_ATS_ZH_SALEs_ANA as select from ZCO_ATS_ZH_SALES_CUBE
{
    key     ProductName,
    key     ProductCategory,
    key     CompanyName,
    ConvertCurrency,
    ConvertedAmount
    
}
