a <- 16
b <- 3
add <- a + b
sub = a - b
multi = a * b
division = a / b
Integer_Division = a %/% b
exponent = a ^ b
modulus = a %% b
print(paste("Addition of two numbers 16 and 3 is : ", add))
print(paste("Subtracting Number 3 from 16 is : ", sub))
print(paste("Multiplication of two numbers 16 and 3 is : ", multi))
print(paste("Division of two numbers 16 and 3 is : ", division))
print(paste("Integer Division of two numbers 16 and 3 is : ", Integer_Division))
print(paste("Exponent of two numbers 16 and 3 is : ", exponent))
print(paste("Modulus of two numbers 16 and 3 is : ", modulus))
x_vector <- seq(45,55, by = 1)
log(x_vector)
exp(x_vector)
sin(pi/2)
cos(pi)
tan(pi/3)
acos(-1)
atan(0.5)

sqrt(x_vector)
abs(x_vector)
assign("gfg", 20.12345)
print(gfg)
v <- 6.6:12.6
print(v)
x <- 1:15
cat("Original vector: ", x, "\n")
cat("First 5 values of vector: ", x[1:5], "\n")
cat("Without values present at index 1, 2 and 3: ",x[-c(1, 2, 3)], "\n")
friend_ages <- c(27, 25, 29, 26)
mean(friend_ages) # => 26.75
max(friend_ages) # => 29
friend_groups <- factor(c("grp1", "grp2", "grp1", "grp2"))
levels(friend_groups) # => "grp1", "grp2"
friend_ages <- c(27, 25, 29, 26)
tapply(friend_ages, friend_groups, mean)
mat1.data <- c(1,2,3,4,5,6,7,8,9)
mat1 <- matrix(mat1.data,nrow=3,ncol=3,byrow=TRUE)
mat1
mat3.data1 <- c(1,2,3)
mat3.data2 <- c(4,5,6)
mat3.data3 <- c(7,8,9)
mat3 <- cbind(mat3.data1,mat3.data2,mat3.data3)
mat3

mat4 <- rbind(mat3.data1,mat3.data2,mat3.data3)
mat4
mat5 <- c(2,3,5,9)
mat5
dim(mat5) <- c(2,2)
mat5
rnames <- c("row1","row2","row3")
cnames <- c("col1","col2","col3")
named_matrix <- matrix(mat1.data,nrow=3,byrow=TRUE,dimnames=list(rnames,cnames))
named_matrix
rownames(mat1) <- c("r1","r2","r3")
colnames(mat1) <- c("c1","c2","c3")
mat1
col1 <- c(5, 6, 7, 8, 9)
col2 <- c(2, 4, 5, 9, 8)
col3 <- c(7, 3, 4, 8, 7)
# Combine the vectors by column
my_data <- cbind(col1, col2, col3)
my_data
rownames(my_data) <- c("row1", "row2", "row3", "row4", "row5")
my_data
t(my_data)
matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE,dimnames = NULL)
mdat <- matrix(data = c(1,2,3, 11,12,13), nrow = 2, byrow = TRUE,dimnames = list(c("row1",
                                                                                   "row2"), c("C.1", "C.2", "C.3")))
mdat 

ncol(my_data)
nrow(my_data)
dim(my_data)
my_data[2, ]
my_data[, "col2"]
my_data*2
rowSums(my_data)
colSums(my_data)
friend_groups <- factor(c(1, 2, 1, 2))
friend_groups
is.factor(friend_groups)
is.factor(are_married)
as.factor(are_married)
summary(friend_groups)
L3 <- LETTERS[1:3]
fac <- sample(L3, 10, replace = TRUE)
(d <- data.frame(x = 1, y = 1:10, fac = fac))
## The "same" with automatic column names:
data.frame(1, 1:10, sample(L3, 10, replace = TRUE))
is.data.frame(d)
## do not convert to factor, using I() :
(dd <- cbind(d, char = I(letters[1:10])))
rbind(class = sapply(dd, class), mode = sapply(dd, mode))
stopifnot(1:10 == row.names(d)) # {coercion}
(d0 <- d[, FALSE])
(d.0 <- d[FALSE, ])
(d00 <- d0[FALSE, ])
my_family <- list(mother = "Veronique", father = "Michel",sisters = c("Alicia",
                                                                      "Monica"),sister_age = c(12, 22))
my_family
names(my_family)
length(my_family)
my_family[["father"]]
my_family$grand_father <- "John"
my_family$grand_mother <- "Mary"
my_family
help(mean)
help.start()
apropos("med")
help.search("mean")

