@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie'
@Metadata.allowExtensions: true
@Search.searchable: true


define root view entity ZC_01_MovieTP
  provider contract transactional_query // C = ConsumptionView
  as projection on ZR_01_MovieTP // R = Restricted
{
  key MovieUuid,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Title,
      @ObjectModel.text.element: ['GenreText']
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_01_GenreVH', element: 'Genre' } }]
      Genre,
      PublishingYear,
      RuntimeInMin,
      ImageUrl,
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,

      _AverageRating.AverageRating            as AverageRating,
      _AverageRating.AverageRatingCriticality as AverageRatingCriticality,
      _GenreText.GenreText,


      _Rating : redirected to composition child ZC_01_RatingTP
  
}
