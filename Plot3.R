## Plot3 on household power consumption

# 1.Loading the data
skip <- grep("1/2/2007", 
             readLines("household_power_consumption.txt"))[1] - 2
nrows <- grep("3/2/2007", 
              readLines("household_power_consumption.txt"))[1] - skip - 2

header <- read.table("household_power_consumption.txt", 
                     nrows = 1, 
                     colClasses="character", 
                     header = FALSE, 
                     sep = ";"
)
df <- read.table("household_power_consumption.txt", 
                 skip = skip, 
                 nrows = nrows, 
                 header = TRUE, 
                 sep = ";", 
                 stringsAsFactors=F
)
colnames(df) <- header

df$DateTime <- strptime(paste(df$Date, df$Time), 
                        format="%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME","us")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$weekdays <- weekdays(df$Date, abbreviate = TRUE)

# 2.png
library(png)
png("Plot3.png", width = 480, height = 480)

# 3.Making Plot3
plot(df$DateTime, df$Sub_metering_1, 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering", 
     cex.lab = 0.8, 
     cex.axis = 0.8
     )
lines(df$DateTime, df$Sub_metering_2, 
      type = "l", 
      col = "red"
      )
lines(df$DateTime, df$Sub_metering_3, 
      type = "l", 
      col = "blue"
      )
legend("topright", 
       lty=1, 
       col=c("black","red","blue"), 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       cex = 0.75)

dev.off()
