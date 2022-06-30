 df= read.csv("/Users/zm/downloads/newyorkairbnbdata.csv")
 
rm(data)

df$driver_gender = as.factor(df$driver_gender)
df$violation = as.factor(df$violation)
df$driver_race = as.factor(df$driver_race)
df$stop_duration = as.factor(df$stop_duration)
df$stop_outcome = as.factor(df$stop_outcome)

head(df$stop_duration)

df$driver_age = as.numeric(df$driver_age)

library(dplyr)
df= df%>%select(-'name',-'id',-'host_name',-'last_review')

str(df)
summary(df)
sum (is.na(df))
colSums(is.na(df))
barplot(df$stop_duration)
unique(df$stop_duration)
levels(df$stop_duration)
unique(df$stop_outcome)
levels(df$stop_outcome)
hist(df$driver_age)



is.na(df$reviews_per_month)
is.na(df$is_arrested)
which(is.na(df$reviews_per_month))


my_imp = mice()

df[df == ''] = NA

imputed_data = mice(df, m=5, method = 'rf')
summary(imputed_data)

df$reviews_per_month[which(is.na(df$reviews_per_month))] = 0

df$driver_gender[which(is.na(df$driver_gender))] = 0
df$is_arrested[which(is.na(df$is_arrested))] = 'FALSE'
df$violation[which(is.na(df$violation))] = 'Speeding'
df$driver_race[which(is.na(df$driver_race))] = 'White'
df$stop_duration[which(is.na(df$stop_duration))] = '0-15 Min'
df$stop_outcome[which(is.na(df$stop_outcome))] = 'Citation'

df$driver_age[which(is.na(df$driver_age))] = '17'


df$stop_duration[df$stop_duration == '1'] = '0-15 Min'
df$stop_duration[df$stop_duration == '2'] = '0-15 Min'

write.csv(df, file ='/Users/zm/Documents/SEMESTER 2 MASTERS IN DATASCIENCE /ABAV - Advanced Business Analytics Visualization/Cleaned_Newyorkairbnbdata.csv')

df2= read.csv("/Users/zm/Documents/SEMESTER 2 MASTERS IN DATASCIENCE /ABAV - Advanced Business Analytics Visualization/Cleaned_Newyorkairbnbdata.csv.csv")

colSums(is.na(df2))
