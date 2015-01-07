
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
png('./ExData_Plotting1/plot3.png', width = 480, height = 480)

#creating the plot
plot(dateforgraph, dat$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = " ",
     col="black")
lines(dateforgraph, dat$Sub_metering_2, col = "red")
lines(dateforgraph, dat$Sub_metering_3, col = "blue")

#creating the legend on the top right
legend("topright","(x,y)", #places legend on top right
       c(colnames(dat)[7:9]), #defines names for the lines
      lty=c(1,1), #specifies lines
      col=c("black", "red", "blue") #specifies colours for lines
)

dev.off()