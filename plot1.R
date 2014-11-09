#Working drive
setwd("C:/Users/cheaven88/Documents/Online Courses/Coursera/Exploratory Data Analysis/Course Project 1")
getwd()

#importing data
dat.import <- read.table("household_power_consumption.txt", 
                         sep = ";", 
                         na.strings = c("NA", "?"), 
                         header = TRUE, 
                         nrows=2075259)

dat <- subset(dat.import, 
              Date %in% c("1/2/2007", "2/2/2007"))

#using png function to save the plot
png('./ExData_Plotting1/plot1.png', width = 480, height = 480)

#getting the plot
hist(dat$Global_active_power, 
     xlab="Global Active Power (kilowatts)", 
     main = "Global Active Power", 
     col="red")

dev.off()
