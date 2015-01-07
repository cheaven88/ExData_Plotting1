
#importing data
datimport <- read.table("household_power_consumption.txt", sep = ";", na.strings = c("NA", "?"), header = TRUE, nrows=2075259)
dat <- subset(datimport, Date %in% c("1/2/2007", "2/2/2007"))

#Converting dates from d/m/yyyy to d-m-yyyy format for concatenation
DateFormat <- as.Date(dat$Date, format = "%d/%m/%Y")
#Putting date and time values in one vector
concatdate <- paste(DateFormat,dat$Time,sep=' ')
#Extracting time out of concatenated vector so it can be used by the graph
dateforgraph <- strptime(concatdate,"%Y-%m-%d %H:%M:%S")

#using png function to save the plot
png('./ExData_Plotting1/plot2.png', width = 480, height = 480)

#getting the plot
plot(dateforgraph, dat$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = " ")

dev.off()



