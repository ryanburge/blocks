
#' A Mean with 84 percent CIs
#'
#' This function gives you a mean with 84 percent CIs
#' @param df Name of the Dataset
#' @param var Variable to find the mean of
#' @keywords Mean
#' @export
#' @examples
#' mean_pad()



mean_pad <- function(df, var) {
  var <- enquo(var)
  
  df %>% 
    summarise(mean = mean(!! var, na.rm = TRUE),
              sd = sd(!! var, na.rm = TRUE), 
              n = n()) %>% 
    mutate(se = sd/sqrt(n),
           lower = mean - qt(1 - (0.16 /2),  n -1) * se,
           upper = mean + qt(1 - (0.16 /2),  n -1) * se) 
}
