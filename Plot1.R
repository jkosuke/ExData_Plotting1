## Plot1 on household power consumption

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

# 2.png
library(png)
png("Plot1.png", width = 480, height = 480)

# 3.Making Plot1
hist(df$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     col = "red", 
     cex.lab = 0.8, 
     cex.axis = 0.8
     )

dev.off()
