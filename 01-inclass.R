#--------------------------------------------------
# Week 1: In-class assignment
#--------------------------------------------------

# There is no one correct way to write the code to answer the questions
# But your code needs to 
# a. answer the question
# b. be fully reproducible

# For this assignment, we will use 
# the `yrbss` data 
# in the `openintro` package 

install.packages("openintro")
library(openintro)

# Other useful packages
install.packages("tidyverse")
library(tidyverse)

# Read the documentation for `yrbss` to learn about all the variables.
?yrbss

# The code below uses the `flextable` package to create a table of summary characteristics of
# Grade and Gender
# Modify the code below such that the grade shows in increasing order
# and all category labels start with a capital letter

install.packages("flextable")
library(flextable)

library(dplyr)
yrbss$Grade <- yrbss$grade
#--------------------------------------------------------------------------
class(yrbss$grade)
#assess the type of variable grade is. we see its character type. 

unique(yrbss$grade)
#this tells us the exact kinds of 'text' in written in the column 

yrbss_1 <- yrbss %>% mutate(grade=na_if(grade, "other"), #replaced "other" with NA 
                                grade=coalesce(grade, "0"), #swapped all NA for "0" as a text string 
                                grade=as.numeric(grade)) %>% arrange(grade) #convert to numeric and arrange


unique(yrbss_1$grade)

#lets try converting grade to an ordered factor 

yrbss_1$grade <- ordered(yrbss_1$grade, levels=1:5,labels=c("0","9","10","11","12"))
class(yrbss_1$grade)
yrbss_1 <- yrbss_1 %>% arrange(grade)

yrbss_1 <- yrbss %>% mutate(grade=na_if(grade, "other"), #replaced "other" with NA 
                            grade=coalesce(grade, "0"), #swapped all NA for "0" as a text string 
                            grade=as.factor(grade, ordered=TRUE, levels="0", "9", "10", "11", "12")) %>% arrange(grade) #convert to numeric and arrange


yrbss_1$grade <- ordered(yrbss_1$grade, levels="0","9", "10", "11", "12")


unique(yrbss_1$grade)


yrbss$Gender <- yrbss$gender

unique(yrbss_grade$gender)
class(yrbss_grade$gender)

#first i will recode the variable names, use replace value function to partially update an existing vector 
yrbss_grade1 <- yrbss_grade %>% mutate(gender=replace_values(gender,"female" ~ "Female","male"~ "Male"))

                                   

r

z <- summarizor( #this is to perform univariate statistical analysis by group and formats results tabularly 
  yrbss_grade1[c("grade", "gender")],
  overall_label = NULL
)
#summarizor (x, by = , overall_label = ) #x is the dataset[c(grade, gender column names)-, overall=label is default null]

ft_1 <- as_flextable(z) 
ft_1


# To understand the pattern of physical activity by grade and gender,
# 1) aggregate  `physically_active_7d` by calculating its mean within each grade and gender
# 2) create a plot showing the average number of physically active days
#      x-axis: grade
#      y-axis: Mean of `physcially_active_7d`
#      Distinguish gender using different colors, symbols, or lines
# *** I would use the following functions: aggregate(), ggplot(), geom_line() but there is 
# no one correct way to do this
# Ensure that the figure is clearly labeled and includes an appropriate legend

aggregate(xxx) |>
  ggplot(aes(xxx)) + 
  geom_line()
...


# Create a plot that shows the relationship betwen physical activity and bmi
# among female students in grade 12 
# Ensure that the figure is clearly labeled and includes an appropriate legend



# Push your completed code to your GitHub repository
