@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SALES Composite Entity'
@Metadata.ignorePropagatedAnnotations: false
@VDM.viewType: #COMPOSITE

define view entity ZCO_ATS_ZH_SALES
  with parameters
    I_CURR : abap.cuky( 5 )
  as select from ZI_ATS_ZH_SALES as Sales
  association of many to many ZI_ATS_ZH_Product as _Product on $projection.Product = _Product.ProductId
{
  key OrderId,
  key ItemId,
      OrderNo,
      Product,
      Amount,
      Currency,
      cast('USD' as abap.cuky )                                         as ConvertCurrency,
      @Semantics.amount.currencyCode: 'ConvertCurrency'
      currency_conversion( amount => Amount,
                           source_currency => Currency,
                           target_currency => $parameters.I_CURR,
                           exchange_rate_date => $session.system_date ) as ConvertedAmount,
      Qty,
      Uom,
      //   CreatedBy,
      //   CreatedOn,
      //   ChangedBy,
      //   ChangedOn,
      Buyer,
      _Product.Name                                                     as ProductName,
      _Product.Category                                                 as ProductCategory
}
