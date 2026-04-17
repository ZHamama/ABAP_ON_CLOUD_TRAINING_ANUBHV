@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic Interfqce for Product'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #BASIC
@Analytics.dataCategory: #DIMENSION
define view entity ZI_ATS_ZH_Product
  as select from zats_zh_product
{
  key product_id as ProductId,
      name       as Name,
      category   as Category,
@Semantics.amount.currencyCode: 'Currency'
      price      as Price,
      currency   as Currency,
      discount   as Discount

}
