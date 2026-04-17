@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic Interfqce for Buisness Partner'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #BASIC
@Analytics.dataCategory: #DIMENSION
define view entity ZI_ATS_ZH_BP
  as select from zats_zh_bpa
{
  key bp_id        as BpId,
      bp_role      as BpRole,
      company_name as CompanyName,
      street       as Street,
      country      as Country,
      region       as Region,
      city         as City
}
