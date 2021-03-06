## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# The following functions are used to create a special object that stores a matrix and caches its inverse. 
# The first function, makeCacheMatrix creates a special "matrix", 
# which is really a list containing a function to:
        
# 1.Set the value of the matrix

# 2.Get the value of the matrix

# 3. Set the value of the inverse

# 4. Get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
                i <- NULL
                set <- function(m) {
                        x <<- m
                        i <<- NULL
                }
                get <- function() x
                setinverse <- function(inverse) i <<- inverse
                getinverse <- function() i
                list(set = set,
                     get = get,
                     setinverse = setinverse,
                     getinverse = getinverse)

}



## Write a short comment describing this function

#This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
#If the inverse has already been calculated (and the matrix has not changed) 
#then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        i <- x$getinverse()
        if (!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinverse(i)
        i               ## Return a matrix that is the inverse of 'x'
}

M <- matrix(c(0,1,0,2,1,1,2,1,2),3,3)
MM<-makeCacheMatrix(M)
cacheSolve(MM)
