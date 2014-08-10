plot2 <- function() {
    ## Read input file
    fulldata<-read.table(unz("~/Learn/Data Science/JHU04 Exploratory Data Analysis/exdata-data-household_power_consumption.zip","household_power_consumption.txt"),header=TRUE,sep=';')
    colnames(fulldata)<-gsub("_",".",colnames(fulldata))
    Date<-as.Date(fulldata$Date,"%d/%m/%Y")
    data<-fulldata[Date>=as.Date('1/2/2007',"%d/%m/%Y") & Date<=as.Date('2/2/2007',"%d/%m/%Y"),]
    data$Time<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
    Global.active.power<-as.numeric(levels(data$Global.active.power))[data$Global.active.power]
    plot(data$Time,Global.active.power,bg=NA,type='l',xlab="",ylab="Global Active Power(kilowatts)",cex.axis=0.7,cex.lab=0.65,font.axis=1,font.lab=1)
    dev.copy(png,file='~/Learn/Data Science/JHU04 Exploratory Data Analysis/plot2.png')
    dev.off()
}
