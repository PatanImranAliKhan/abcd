"""
  Create two 3*3 matrices with even and odd numbers respectively. Perform matrix operations
like addition, subtraction, multiplication and transpose between two matrices. And also find
inverse of each matrix after checking the determinant of the matrix.
(Hint: use generalized inverse of matrix in “MASS”)  
"""
library(matlib)
x = c(1:18)
even <- NULL
odd <- NULL
for(i in x) { if(i
                 %% 2 == 0) {
  even <- c(even, i)
}
  if(i %% 2 != 0) {
    odd <- c(odd, i)
  }
}
#Even matrix
even_matrix <- matrix(even, ncol=3, byrow=TRUE)
even_matrix
#Odd matrix
odd_matrix <- matrix(odd, ncol=3, byrow=TRUE)
odd_matrix
#Addition, Subtraction, division, and Multiplication of matrices
print(even_matrix + odd_matrix)
print(even_matrix - odd_matrix)
print(even_matrix * odd_matrix)
print(even_matrix / odd_matrix)
#Transpose of matrices print(t(even_matrix))
print(t(odd_matrix))
#Det of a matrix
print(det(even_matrix))
print(det(odd_matrix))
print(odd_matrix)
library(MASS)
print(ginv(odd_matrix))



#Sum of N Natural Numbers
SumofN <- function(N)
{
  if (N <= 1)
    return(N)
  else
    return( N +SumofN (N-1))
}
SumofN(5)
# Fibonacci Series of first 20 numbers
cat("Enter an integer or whole number : \n")
nterms <- as.integer(readline(prompt = ""))
n1 = 0
n2 = 1
count = 2
# check if the number of terms is valid
if(nterms <= 0) {
  print("Plese enter a positive integer")
} else {
  if(nterms == 1) {
    print("Fibonacci sequence:")
    print(n1)
  } else {
    print("Fibonacci sequence:")
    print(n1)
    print(n2)
    while(count < nterms) {
      nth = n1 + n2
      print(nth)
      # update values
      n1 = n2
      n2 = nth
      count = count + 1
    }
  }
}

#Write an R program to arrange 5,4,12,13,3,8,88 in ascending order using Quick Sort Algorithm.
quickSort <- function(arr) {
  
  # Pick a number at random
  random_index <- sample(seq_along(arr), 1);
  pivot <- arr[random_index]
  arr <- arr[-random_index]
  
  # Create array for left and right values.
  left <- c()
  right <- c()
  
  # Move all smaller and equal values to the
  # left and bigger values to the right.
  # compare element with pivot
  left<-arr[which(arr <= pivot)]
  right<-arr[which(arr > pivot)]
  
  if (length(left) > 1)
  {
    left <- quickSort(left)
  }
  if (length(right) > 1)
  {
    right <- quickSort(right)
  }
  
  # Return the sorted values.
  return(c(left, pivot, right))
}

# take sample array
arr <- c(5,4,12,13,3,8,88)

# call quickSort function
result <- quickSort(arr)

# print result
result
