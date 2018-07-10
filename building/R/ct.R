#' A Count Function
#'
#' This function gives you a simple count with percentages
#' @param df Name of the Dataset
#' @param var Variable to Count
#' @keywords Count
#' @export
#' @examples
#' ct()

ct <- function(df, var) {
  var <- enquo(var)
  
  df %>%
    count(!! var) %>% 
    mutate(pct = prop.table(n)) 
}


