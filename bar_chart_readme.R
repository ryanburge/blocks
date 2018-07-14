## Making a quick visualization of a bar chart

I make a lot of really quick bar charts. Too many of them. So if I use
the `ct()` function, this moves easily into making a `geom_col()` type
bar chart. This gives a percentage annotation at the top of each bar.

``` r
a1 <- cces %>% 
  ct(race, commonweight_vv)

gg_col(a1, race, pct)
```

<img src="gg_col1.png" alt="drawing" width="600px"/> <!-- -->
  
  You can easily add the percentages to the top of the bars

``` r

gg_col(a1, race, pct, add_labels = TRUE)
```

<img src="gg_col2.png" alt="drawing" width="600px"/> <!-- -->
  
  
  And you can change the font by using a font style that is available on
<a href= "https://fonts.google.com">Google Fonts</a>
  
  ``` r

gg_col(a1, race, pct, "Indie Flower", add_labels = TRUE)
```

<img src="gg_col3.png" alt="drawing" width="600px"/> <!-- -->
  
  
  - let me know what you think on twitter
<a href="https://twitter.com/ryanburge">@ryanburge</a>
  