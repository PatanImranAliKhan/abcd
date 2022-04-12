
library("ggplot2")
library("gganimate")
library("gapminder")
library("gifski")
gapminder<-read.csv("https://raw.githubusercontent.com/KLDataAnalytics/Big-Data-Analytics/master/Countries.csv") 
gapminder
str(gapminder)
head(gapminder) 
summary(gapminder) 
table(gapminder$continent) 
aggregate(count.fields(gapminder["continent"]))
plot(gdpPercap ~ lifeExp, gapminder, subset = country == "Cambodia" , type = "b") 
gapminder[gapminder[["country"]] == "Algeria" & gapminder[["year"]] == 2007, "lifeExp"] 
mean(gapminder[gapminder[["year"]] == 1992, "lifeExp"])
aggregate(gapminder$country, by=list(gapminder$continent), FUN=length)
mean(gapminder[gapminder[["year"]], "lifeExp"])
aggregate(lifeExp ~ country, gapminder, mean) 
ggplot(gapminder, aes(x = lifeExp)) + geom_histogram() 
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) + geom_point() 
cor(gapminder[["gdpPercap"]], gapminder[["lifeExp"]])
ggplot(gapminder, aes(x = factor(year), y = lifeExp)) + geom_point()
ggplot(gapminder, aes(x = factor(year), y = lifeExp)) + geom_boxplot()
ggplot(gapminder, aes(x = year, y = lifeExp)) + geom_smooth()
p <- ggplot(
  gapminder, 
  aes(x = gdpPercap, y=lifeExp, size = pop, colour = country)
) +
  geom_point(show.legend = FALSE, alpha = 0.7) +
  scale_color_viridis_d() +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(x = "GDP per capita", y = "Life expectancy")
p
p + transition_time(year) +
  labs(title = "Year: {frame_time}")
theme_set(theme_bw())
p + facet_wrap(~country) +
  transition_time(year) +
  labs(title = "Year: {frame_time}")

