@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 4'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z01_Demo04
  as select from /dmo/travel                                                   as t
    inner join   DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: '/DMO/STATUS' ) as s on  s.value_low = t.status
                                                                                    and s.language  = cast(
      'E'                                                                      as abap.lang
    )
{
  key t.travel_id as TravelID,
      t.status    as Status,
      s.text      as StatusText
}
