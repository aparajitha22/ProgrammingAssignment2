## makeCacheMatrix - creates a special matrix that can cache its inverse
## cacheSolve - Computes the inverse of the special matrix returned by makeCacheMatrix.If the inverse is already computed and the matrix has not changed, then cacheSolve retrieves the inverse from the cache

## Creates a special matrix

makeCacheMatrix <- function(x = matrix()) {
 m <- NULL

## changes the matrix stored in the main function makeCacheMatrix and sets a new value

  sets <- function(y)
  {
    x <<- as.matrix(y)
    m <<- NULL
  }

## gets the matrix value stored in the main function makeCacheMatrix

  gets <- function() x
  
## stores the value of the input in a variable m into the main function makeCacheMatrix

  setinv <- function(inverse) m<<- as.matrix(inverse)

## Returns the value of the matrix  from setmean function
  
  getinv <- function() m

## Stores all the 4 function in a list so that when makeCacheMatrix is assigned to an object, the object has all the 4 functions.
  
  list(sets=sets, gets=gets, setinv=setinv, getinv= getinv)
  
}


## Calculates the inverse of the matrix returned by the above function

cacheSolve <- function(x, ...) {
## Verify if the value of m is stored previously and if yes returns the value.
  m <- x$getinv()
  if(!is.null(m))
  {
    message("getting cached data")
    return(as.matrix(m))
  }

## dat stores the matrix from makeCacheMatrix and inverse of the matrix is calculated.
  dat<-  x$gets()
 m <- solve(dat)
  x$setinv(m)
  m  
}
