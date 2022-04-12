# Load the library
library(randomForest)
# Create random forest
# For classification
iris.rf <- randomForest(Species ~ .,
                        data = iris,
                        importance = TRUE,
                        proximity = TRUE)
# Print classification model
print(iris.rf)
# Output to be present
# As PNG file
png(file = "randomForestClassification.png")

# Plot the error vs
# The number of trees graph
plot(iris.rf)

# Saving the file
dev.off()
