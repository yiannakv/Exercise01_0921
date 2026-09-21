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

yrbss$Grade <- yrbss$grade
yrbss$Gender <- yrbss$gender

library(dplyr) #to modify the dataset 

#first we will check what variable types grade and gender are 
class(yrbss$grade)
unique(yrbss$grade) #to see what variables are listed 
class(yrbss$gender)
unique(yrbss$gender)

#they are both character vectors so we will update the following:
##grade is an ordinal 'factor' level variable' 
##gender is a factor variable as well


yrbss_1 <- yrbss %>% mutate(grade=factor(grade, levels=c("9","10","11","12","other"), ordered=TRUE))%>%
  arrange(grade)


#now if we explore the dataset we will see that grade is ordered. 

#next lets convert gender to a factor and modify the factor names
yrbss_1 <- yrbss_1 %>% mutate(gender=replace_values(gender,"female" ~ "Female","male"~ "Male"),
                              gender=factor(gender, levels=c("Male","Female")))

#double check this worked 
unique(yrbss_1$gender)



z <- summarizor(
  yrbss_1[c("grade", "gender")],
  overall_label = NULL
)
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

aggregate(physically_active_7d ~ grade + gender, data= yrbss_1, FUN=mean) |> 
  ggplot(aes(x=grade, y= physically_active_7d, group=gender, colour=gender)) + 
  geom_line()+labs(x="Grade", y="# of Days", 
                  title="Average Number of Days Physically Active in a Week")


# Create a plot that shows the relationship betwen physical activity and bmi
# among female students in grade 12 
# Ensure that the figure is clearly labeled and includes an appropriate legend



# Push your completed code to your GitHub repository
