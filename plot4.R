#Working drive
setwd("C:/Users/cheaven88/Documents/Online Courses/Coursera/Exploratory Data Analysis/Course Project 1")
getwd()

#importing data
dat.import <- read.table("household_power_consumption.txt", sep = ";", na.strings = c("NA", "?"), header = TRUE, nrows=2075259)
dat <- subset(dat.import, Date %in% c("1/2/2007", "2/2/2007"))

#Converting dates from d/m/yyyy to d-m-yyyy format for concatenation
DateFormat <- as.Date(dat$Date, format = "%d/%m/%Y")
#Putting date and time values in one vector
concatdate <- paste(DateFormat,dat$Time,sep=' ')
#Extracting time out of concatenated vector so it can be used by the graph
dateforgraph <- strptime(concatdate,"%Y-%m-%d %H:%M:%S")

#using png function to save the plot
png('./ExData_Plotting1/plot4.png', width = 480, height = 480)

par(mfrow=c(2,2))
#Plot 1
plot(dateforgraph, dat$Global_active_power,
     type = "l",
     ylab = "Global Active Power",
     xlab = " ")

#Plot 2
plot(dateforgraph, dat$Voltage,
     type = "l",
     ylab = "Voltage",
     xlab = "datetime")

#Plot 3
plot(dateforgraph, dat$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = " ",
     col="black")
lines(dateforgraph, dat$Sub_metering_2, col = "red")
lines(dateforgraph, dat$Sub_metering_3, col = "blue")

#creating the legend on the top right with no border
legend("topright","(x,y)", #places legend on top right
       c(colnames(dat)[7:9]), #defines names for the lines
       lty=c(1,1), #specifies lines
       col=c("black", "red", "blue"), #specifies colours for lines
       bty = "n" #removes box around the border
      )

#Plot 4
plot(dateforgraph, dat$Global_reactive_power,
     type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime")

dev.off()
