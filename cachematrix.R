## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

  ## This function generates an object that can inverse the input matrix provided

makeCacheMatrix <- function(x = matrix()){
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function() {x}
  setInverse <- function(inverse) {inv <<- inverse}
  getInverse <- function() {inv}
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}




## Write a short comment describing this function

  ##This function retrieves the cached inverse of the inverted matrix on makeCacheMatrix function so we can save resources of re-computation

cacheSolve <- function(x, ...){
  inv <- x$getInverse()
  if(!is.null(inv)){
    message("cached data obtained: ")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
}


pmatrix <- makeCacheMatrix((matrix()))

pmatrix <- makeCacheMatrix(matrix(1:4, nrow = 2, ncol=2))

pmatrix$get()

pmatrix$getInverse()

cacheSolve(pmatrix)

