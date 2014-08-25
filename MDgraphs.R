# R script for MD graphs

# install ggplot2 if you don't have it yet.

install.packages("ggplot2")

#load ggplot2 package

library(ggplot2)

# import txt (first open in Excel to give header and correct configuration. 
# Header should read: "X.Diff","Observed","Low.bound","Up.bound","Model_Freq.".

data  <- read.table("data.txt", header=TRUE)

#check data file

head("data")

#give headers in case you didn't in Excel
names(data) <- c("X.Diff","Observed","Low.bound","Up.bound","Model_Freq.")

#define individual plots 
MD <-ggplot(MD, aes(x=X.Diff,y=Observed)) + geom_bar(stat="identity", width=0.6, fill="#808080") 
+ geom_line (aes(y=Model_Freq.), size = 1) + ggtitle ("Population_name") + xlab("Pairwise differences") + ylab("Frequency") 
+ theme_bw() + theme(panel.border = element_blank() , axis.line = element_line (colour="black")) 
+ theme (panel.grid.major = element_blank(), panel.grid.minor = element_blank())

#to plot multiple graphs install gridExtra

install.packages("gridExtra")

#load gridExtra

library(gridExtra)

# arrange plots in grid (the order of the plots will be Row1, Column1, Row2, Clolumn 2, etc...)

grid.arrange(MD1, MD2, … , ncol=2)

#to save as pdf

pdf("Figure.pdf")
grid.arrange (MD1, MD2, … , ncol=2)
dev.off()
