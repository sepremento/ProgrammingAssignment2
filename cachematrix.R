## This is an overall similar to the example makeVector() and cachemean() functions
## I managed to get inverted matrices.

## This function creates an object with four functions and two variables to store values.

makeCacheMatrix <- function(x = matrix()) {
  mx_inv <- NULL
  set <- function(y){
    x <<- y
    mx_inv <<- NULL
  }
  get <- function() x
  setinv <- function(solve) mx_inv <<- solve
  getinv <- function() mx_inv
  list(set = set, get = get,setinv = setinv,getinv = getinv)
}


## This function makes the inverted matrix if it is new and gets cached matrix if it's not new.

cacheSolve <- function(x, ...) {
  mx_inv <- x$getinv()
  if(!is.null(mx_inv)) {
    message("getting cached inverse matrix")
    return(mx_inv)
  }
  data <- x$get()
  mx_inv <- solve(data)
  x$setinv(mx_inv)
  mx_inv
        ## Return a matrix that is the inverse of 'x'
}
