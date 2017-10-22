## Put comments here that give an overall description of what your
## functions do

## Make new cachable matrix and initialize

makeCacheMatrix <- function(x = matrix()) {

  #init

  inv <- NULL

  # get/set methods

  get <- function() x
  set <- function(y){
    x <<- y
    inv <<- NULL
  }

  # get/set inverse methods

  setI<- function(solveMatrix) i <<- solveMatrix
  getI<- function() inv
  list(set = set, get = get, setI = setI, getI = getI)
}


## Find the stored (cached) inverse and return
   Or calculate new one and save it if there is no values already calculated


cacheSolve <- function(x, ...) {

  # get inversed x

  inv <- x$getI()

  # check the cache before calculating

  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }

  # calculate and save the inverse

  data <- x$get()
  inv <- solve(data)
  x$setI(inv)
  inv
}
