
#' A Quick ggcol chart
#'
#' This function gives you a histogram with percentage annotations
#' @param df Name of the Dataset
#' @param xvar What is going to be on the x-axis
#' @param yvar What is going to be on the y-axis, usually pct
#' @param fff What font you would like from Google fonts. Must be surrounded with quotation marks. Example: "Roboto". Defaults to Oswald.
#' @keywords plotting
#' @export
#' @examples
#' gg_col()


gg_col <- function (df, xvar, yvar, fff){
  xvar <- enquo(xvar)
  yvar <- enquo(yvar)
  if(missing(fff)){
    font_add_google("Oswald", "font")
    
    showtext_auto()
    
    ggplot(df, aes(x=!! xvar, y = !! yvar)) + 
      geom_col(aes(fill = as.factor(!! xvar)), color = "black") +
      theme_minimal() + 
      theme(text=element_text(size=64, family="font")) +
      geom_text(aes(y = !! yvar + .025, label = paste0(!! yvar*100, '%')), position = position_dodge(width = .9), size = 16, family = "font") +
      scale_y_continuous(labels = scales::percent) + theme(legend.position="none") 
    
  } else {
    
    font_add_google(fff, "font")
    
    showtext_auto()
    
    ggplot(df, aes(x=!! xvar, y = !! yvar)) + 
      geom_col(aes(fill = as.factor(!! xvar)), color = "black") +
      theme_minimal() + 
      theme(text=element_text(size=64, family="font")) +
      geom_text(aes(y = !! yvar + .025, label = paste0(!! yvar*100, '%')), position = position_dodge(width = .9), size = 16, family = "font") +
      scale_y_continuous(labels = scales::percent) + theme(legend.position="none") 
  }
  
}