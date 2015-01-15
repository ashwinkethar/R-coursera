myfunction <- function() {
  x <- rnorm(10)
  x
}

mymean <- function() {
  
  x <- rnorm(10)
  y <- mean(x)
  print(x)
  print(y)
  return(y)
}
