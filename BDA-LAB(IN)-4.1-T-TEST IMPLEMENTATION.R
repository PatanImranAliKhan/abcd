x <- rnorm(10, mean=100, sd=5)
y <- rnorm(20, mean=105, sd=5)
#t-test
t.test(x, y, var.equal=TRUE)
#Welch's t-test
t.test(x, y, var.equal=FALSE)
#Wilcoxon rank sum test
wilcox.test(x, y, conf.int = TRUE)
