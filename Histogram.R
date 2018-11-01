
setwd('/Users/rfiorini15/Documents/BAH/WilliamDFiles')
library(ggplot2)

ip.data <- read.csv("dtCLIPKey.csv")

data(ip.data, package='ggplot2')

print(nrow(ip.data))

print(summarize(ip.data))

ip_addresses <- select(ip.data, src_address)

plot(ip_addresses, main = "Count of Occurrences for each IP Address", xlab = "IP Addresses", ylab = "# Occurrences per IP Address")

ggplot(data = ip.data, aes(src_address), type = "histogram") 

