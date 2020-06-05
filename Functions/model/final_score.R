#' Final score
#' 
#' Calculates final suitability score for solar energy generation per county
#'
#' @param score_gen data frame with scores for energy generation, needs to have a column named "County" and a column named "score_gen"
#' @param score_econ data frame with scores for economics, needs to have a column named "County" and a column a column named "score_econ"
#' @param  score_land data frame with scores for land suitability, needs to have a column named "County" and a column named "score_land"
#' @param weights vector of weights for each score starting with the generation, economics, and then land suitability. Default is c(1,1,1)
#'
#' @return returns a list with a dataframe of the finals scores (scores_df) and a map of the final scores (final_score_map)


final_score <- function (score_gen,
                             score_econ,
                             score_land,
                             weights = c(1, 1, 1)) {
  ### FINAL SCORES ###
  # Create a dataframe with all the scores
  scores_df <- left_join(score_gen,
                         left_join(score_econ, score_land, by = "County"),
                         by = "County")
  
  # Add final score column
  scores_df$final_score <- NA
  
  # Calculate final scores
  for (i in 1:nrow(scores_df)) {
    scores_df$final_score[i] <-
      weights[1] * scores_df$score_gen[i] +
      weights[2] * scores_df$score_land[i] +
      weights[3] * scores_df$score_econ[i]
  }
  
  
  ### MAP ###
  # Read CA counties file
  counties_proj <- read_sf(dsn = "generated_files/",
                           layer = "counties_proj")
  
  # Add scores to counties file
  county_scores <- counties_proj %>%
    left_join(scores_df, by = "County")
  
  # Create map
  final_score_map <- ggplot() +
    geom_sf(
      data = county_scores,
      color = "gray30",
      size = 0.1,
      aes(fill = county_scores$final_score)
    ) +
    scale_fill_paletteer_c("ggthemes::Temperature Diverging",
                           name = "Score") +
    theme_minimal() +
    coord_sf(datum = NA) +
    labs(x = "", y = "", title = "Best Counties for Solar Farms in 2020") +
    annotation_scale(location = "bl", style = "ticks") # scale bar
  
  # Return dataframe with scores and map
  return(list(scores_df, final_score_map))
}

