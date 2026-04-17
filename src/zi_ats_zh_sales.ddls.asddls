@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Basic Data'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #BASIC
@Analytics.dataCategory: #FACT
define view entity ZI_ATS_ZH_SALES
  as select from zats_zh_so_hdr as Head
  association  of one to many zats_zh_so_item as _Items
  on  $projection.OrderId = _Items.order_id 
{
  key order_id        as OrderId,
  key _Items.item_id  as ItemId,
      order_no        as OrderNo,
      _Items.product  as Product,
 @Semantics.amount.currencyCode: 'Currency'
      _Items.amount   as Amount,
      _Items.currency as Currency,
@Semantics.quantity.unitOfMeasure: 'Uom'
      _Items.qty      as Qty,
      _Items.uom      as Uom,
      _Items.created_by as CreatedBy,
      _Items.created_on as CreatedOn,
      _Items.changed_by as ChangedBy,
      _Items.changed_on as ChangedOn,
      Head.buyer             as Buyer
       

}
