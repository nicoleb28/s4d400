@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating'
@Metadata.allowExtensions: true
define view entity ZC_01_RatingTP
  as projection on ZR_01_Rating
{
  key RatingUuid,
      MovieUuid,
      UserName,
      Rating,
      RatingDate,


      _Movie : redirected to parent ZC_01_MovieTP
}
