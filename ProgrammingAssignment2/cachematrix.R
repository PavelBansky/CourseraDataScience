## Creates a matrix object that stores an input matrix
## M and can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  # inv caches the inverse. On initialization, no inverse has
  # been computed, and inv is initalized to NULL.
  inv <- NULL
  
  # set is to store a new matrix 
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  # get returns the matrix 
  get <- function() x
  
  # Store the cached inverse
  setinverse <- function(inverse) inv <<- inverse
  
  # Retrive the cached inverse
  getinverse <- function() inv
  
  # Return the object as list of methods
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Returns inverse of a matrix object. If the inverse exists from previous operation, 
## it will be taken from cache. Otherwie it is computed and cached

cacheSolve <- function(x, ...) {
  ## Return matrix representig inverse of 'x'
  
  # Get cached inverse
  m <- x$getinverse()
  
  # If it is not null, let's get the cached version
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  # Otherwise take it from x
  data <- x$get()
  
  
  m <- solve(data, ...)
  x$setinverse(m)
  
  return(m)
}
