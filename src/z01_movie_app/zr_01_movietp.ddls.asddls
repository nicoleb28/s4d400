@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie'
/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define root view entity ZR_01_MovieTP
  as select from ZI_01_Movie
  association [0..1] to ZI_01_AverageRating as _AverageRating on $projection.MovieUuid = _AverageRating.MovieUuid
  association [0..1] to ZI_01_GenreText     as _GenreText     on $projection.Genre = _GenreText.Genre
  composition [0..*] of ZR_01_Rating        as _Rating

{
  key MovieUuid,
      Title,
      Genre,
      PublishingYear,
      RuntimeInMin,
      ImageUrl,
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,

      _AverageRating,
      _Rating,
      _GenreText
      
}
