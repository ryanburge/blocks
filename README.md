
### Installation

You can install:

  - the latest development version from GitHub with
    
    ``` r
    install.packages("devtools")
    devtools::install_github("ryanburge/blocks/building")
    ```

## There are two functions to building right now

### Counting Things

I love the functionality of tabyl, but it doesn’t take a weight
variable. Here’s the simple version `ct()`

``` r
library(tidyverse)
library(building)
cces <- read_csv("https://raw.githubusercontent.com/ryanburge/blocks/master/cces.csv")

cces %>% 
  ct(race)
#> # A tibble: 8 x 3
#>    race     n     pct
#>   <int> <int>   <dbl>
#> 1     1   368 0.736  
#> 2     2    54 0.108  
#> 3     3    38 0.0760 
#> 4     4    13 0.0260 
#> 5     5     7 0.0140 
#> 6     6     9 0.0180 
#> 7     7     8 0.0160 
#> 8     8     3 0.00600
```

Note that you are presented with a count column and a pct column.

Let’s add weights

``` r
cces %>% 
  ct(race, commonweight_vv)
#> # A tibble: 8 x 3
#>    race       n     pct
#>   <int>   <dbl>   <dbl>
#> 1     1 348     0.758  
#> 2     2  43.9   0.0956 
#> 3     3  34.0   0.0740 
#> 4     4   7.09  0.0154 
#> 5     5   3.87  0.00843
#> 6     6  15.2   0.0332 
#> 7     7   6.33  0.0138 
#> 8     8   0.704 0.00153
```

Notice that it’s pipeable. And if you don’t include the weight variable
then it won’t be calculated with a weight.

## Getting Confidence Intervals

Oftentimes in social science we like to see what our 95% confidence
intervals are, but that’s a lot of syntax. It’s easy with the `mean_ci`
function

``` r
cces %>% 
  mean_ci(gender)
#> # A tibble: 1 x 6
#>    mean    sd     n     se lower upper
#>   <dbl> <dbl> <int>  <dbl> <dbl> <dbl>
#> 1  1.54 0.499   500 0.0223  1.49  1.58
```

The default is a 95% confidence interval. However that can be changed
easily.

``` r
cces %>% 
  mean_ci(gender, .84)
#> # A tibble: 1 x 7
#>    mean    sd     n level     se lower upper
#>   <dbl> <dbl> <int> <dbl>  <dbl> <dbl> <dbl>
#> 1  1.54 0.499   500 0.160 0.0223  1.50  1.57
```

  - submit suggestions and report bugs:
    <https://github.com/ryanburge/building/issues>
  - let me know what you think on twitter
    <a href="https://twitter.com/ryanburge">@ryanburge</a>
