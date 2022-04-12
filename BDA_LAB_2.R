
library(funModeling) 
library(tidyverse) 
library(Hmisc)
data=heart_disease %>% select(age, max_heart_rate, thal, has_heart_disease)
#b)	Display the structure of the data
head(heart_disease)
str(data)

#c)	Work with glimpse function.
glimpse(data)
#d)	Differentiate status and df_status
status(data)
df_status(heart_disease)
#e)	Find the frequency of data
freq(data)
#f)	Plot the loaded data
plot_num(data)
#g)	Display the data profiling
data_prof=profiling_num(data)

describe(data)
#h)	Remove variables with 60% of zero values
my_data_status=df_status(heart_disease, print_results = F)
vars_to_remove=filter(my_data_status, p_zeros > 60) %>% .$variable
vars_to_remove
#i)	Keep all columns except the ones present in 'vars_to_remove' vector
heart_disease_2=select(heart_disease, -one_of(vars_to_remove))
#j)	Ordering data by percentage of zeros
arrange(my_data_status, -p_zeros) %>% select(variable, q_zeros, p_zeros)
#k)	Get other common statistics: total rows, total columns and column names
nrow(heart_disease)
ncol(heart_disease)
colnames(heart_disease)
#l)	Find distribution for two variables
freq(data=heart_disease, input = c('thal','chest_pain'))
freq(data=heart_disease)
freq(data=heart_disease$thal, plot = FALSE, na.rm = TRUE)
freq(data=heart_disease, path_out='my_folder')
heart_disease_3=select(heart_disease, thal, chest_pain)
describe(heart_disease_3)
vars_to_profile=c("gini_index", "poverty_headcount_1.9")
data_subset=select(data_world_wide, one_of(vars_to_profile))
describe(data_subset)

library(ggplot2)
library(dplyr)
library(reshape2)
library(gridExtra)
options(scipen=999)
#n)	Perform correlation over the data f heart disease over has_heart_disease attribute
correlation_table(data=heart_disease, target="has_heart_disease")
anscombe_data = read.delim(file="https://goo.gl/mVLz5L", header = T)
anscombe_data
cor_1 = cor(anscombe_data$x1, anscombe_data$y1)
cor_2 = cor(anscombe_data$x2, anscombe_data$y2)
cor_3 = cor(anscombe_data$x3, anscombe_data$y3)
cor_4 = cor(anscombe_data$x4, anscombe_data$y4)
plot_anscombe <- function(x, y, value, type)
{
  # 'anscombe_data' is a global variable, this is 
  # a bad programming practice ;)
  p=ggplot(anscombe_data, aes_string(x,y)) + 
    geom_smooth(method='lm', fill=NA) + 
    geom_point(aes(colour=factor(1), 
                   fill = factor(1)), 
               shape=21, size = 2
    ) + 
    ylim(2, 13) + 
    xlim(4, 19) + 
    theme_minimal() + 
    theme(legend.position="none") + 
    annotate("text", 
             x = 12, 
             y =4.5, 
             label = 
               sprintf("%s: %s", 
                       type, 
                       round(value,2)
               )
    ) 
  
  return(p)
}


