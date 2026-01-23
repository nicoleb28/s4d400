@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating'
define view entity ZR_01_Rating
  as select from ZI_01_Rating
  association to parent ZR_01_MovieTP as _Movie on $projection.MovieUuid = _Movie.MovieUuid
{
  key RatingUuid,
      MovieUuid,
      UserName,
      RatingDate,
      Rating,

      _Movie
}
