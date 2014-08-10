plot1 <- function() {
    ## Read input file
    fulldata<-read.table(unz("~/Learn/Data Science/JHU04 Exploratory Data Analysis/exdata-data-household_power_consumption.zip","household_power_consumption.txt"),header=TRUE,sep=';')
    colnames(fulldata)<-gsub("_",".",colnames(fulldata))
    Date<-as.Date(fulldata$Date,"%d/%m/%Y")
    data<-fulldata[Date>=as.Date('1/2/2007',"%d/%m/%Y") & Date<=as.Date('2/2/2007',"%d/%m/%Y"),]
    data$Time<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
    Global.active.power<-as.numeric(levels(data$Global.active.power))[data$Global.active.power]
    hist(Global.active.power,bg=NA,main="Global Active Power",xlab="Global Active Power(kilowatts)",col="red",cex.main=0.85,cex.axis=0.65,cex.lab=0.65,font.main=2,font.axis=2,font.lab=2)
    dev.copy(png,file='~/Learn/Data Science/JHU04 Exploratory Data Analysis/plot1.png')
    dev.off()
}
