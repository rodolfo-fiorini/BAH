
setwd('/Users/rfiorini15/Documents/BAH/WilliamDFiles')

library(ggplot2)

ip.data <- read.csv("dtCLIPKey.csv", header = TRUE)

# Get rid of periods/ dots in IP Addresses #
ip.data$src_address <- as.numeric(gsub("[.]","", ip.data$src_address))

# Get rid of scientic notation
options(scipen = 999)

# Create histogram of ip_addresses with ggplot. This is with 30 bins. 
p <- ggplot(ip.data, aes(x=src_address)) + geom_histogram(bins = 100) 

p + theme(axis.text.x = element_blank()) + xlab("IP Address") + scale_y_continuous(name = "# of Occurrences") + ggtitle("Frequency of IP Address Occurrences") + theme(plot.title = element_text(hjust = 0.5)) 

ggsave("ip_address_frequency.png", dpi = 300, width = 4, height = 3)

# Find top 20 unique IP Addresses
ip_addresses <- ip.data$src_address
repetitions <- table(ip_addresses)
print(repetitions)
counts <- as.data.frame(repetitions)

# Return the indices of the rows in sorted order by frequency of IP Address
sorted_counts <- counts[order(-counts$Freq),]
top_20_in_freq <- head(sorted_counts, 20)

# Count the frequencies in whole data set and in top 20
# Sum of all counts is 1 M since that is how many rows we have 
sum_of_top_20 <- sum(top_20_in_freq$Freq) #returns 269972
# Frequency of top 20 is ~27%.

# Graph of IP Addresses sorted from most frequent to least frequent
p <- ggplot(top_20_in_freq, aes(x=ip_addresses, y=Freq)) + geom_bar(stat = "identity")
p + theme(axis.text.x = element_blank()) + xlab("IP Address") + scale_y_continuous(name = "# of Occurrences") + ggtitle("Frequency of IP Address Occurrences") + theme(plot.title = element_text(hjust = 0.5)) 

ggsave("top_20_ip_address_frequency.png", dpi = 300, width = 4, height = 3)

# The top 2 make up for ~10% of the frequencies
# The top 4 make up for ~13.6% of the frequencies






