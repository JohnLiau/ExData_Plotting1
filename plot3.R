plot3 <- function() {
    ## Read input file
    fulldata<-read.table(unz("~/Learn/Data Science/JHU04 Exploratory Data Analysis/exdata-data-household_power_consumption.zip","household_power_consumption.txt"),header=TRUE,sep=';')
    colnames(fulldata)<-gsub("_",".",colnames(fulldata))
    Date<-as.Date(fulldata$Date,"%d/%m/%Y")
    data<-fulldata[Date>=as.Date('1/2/2007',"%d/%m/%Y") & Date<=as.Date('2/2/2007',"%d/%m/%Y"),]
    data$Time<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
    Global.active.power<-as.numeric(levels(data$Global.active.power))[data$Global.active.power]
    with(data,plot(Time,Sub.metering.1,bg=NA,type='n',col='black',xlab="",ylab="Energy sub metering",cex.axis=0.7,cex.lab=0.65,font.axis=1,font.lab=1))
    with(subset(data,TRUE),points(Time,Sub.metering.1,bg=NA,type='l',col='black',xlab="",ylab="Energy sub metering",cex.axis=0.7,cex.lab=0.65,font.axis=1,font.lab=1))
    with(subset(data,TRUE),points(Time,Sub.metering.2,bg=NA,type='l',col='red',xlab="",ylab="Energy sub metering",cex.axis=0.7,cex.lab=0.65,font.axis=1,font.lab=1))
    with(subset(data,TRUE),points(Time,Sub.metering.3,bg=NA,type='l',col='blue',xlab="",ylab="Energy sub metering",cex.axis=0.7,cex.lab=0.65,font.axis=1,font.lab=1))
    legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.55)
    dev.copy(png,file='~/Learn/Data Science/JHU04 Exploratory Data Analysis/plot3.png')
    dev.off()
}
