
#' A Count Function with Weights
#'
#' This function gives you a simple count with percentages that is weighted
#' @param df Name of the Dataset
#' @param var Variable to Count
#' @param wt Weighting Variable
#' @keywords Count
#' @export
#' @examples
#' ct_wt()

ct_wt <- function(df, var, wt) {
  var <- enquo(var)
  wt <- enquo(wt)
  
  df %>%
    count(!! var, wt = !! wt) %>% 
    mutate(pct = prop.table(n)) 
}