## The functions below will help in caching matrix inverse functions which could
## be potentially time consuming

## Cache the matrices so that they are available for future use in case they are
## needed again

makeCacheMatrix <- function(x = matrix()) {

        inverseMatrix <- NULL

## Function to set the matrix
        set <- function(y){
                x <<- y
                inverseMatrix <<- NULL
        }

## Function to return the matrix that was set earlier
        get <- function() x

## Function to set the inverse Matrix that is outside the scope of the local function
        setInverse <- function(solvedMatrix) inverseMatrix <<- solvedMatrix

## Function to return the Inverse of the matrix that was set earlier
        getInverse <- function() inverseMatrix

## Return all values that could be returned from the makeCacheMatrix Function
        list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)

}


## Access the inverse matrix from cache if available

cacheSolve <- function(x, ...) {

## Return a matrix that is the inverse of 'x'
        inverseMatrix <- x$getInverse()

## Check and Return the Matrix inverse if its not null
        if(!is.null(inverseMatrix)){
                message("Getting cached Matrix Inverse")
                return(inverseMatrix)
                }

#Get the matrix set by the makeCacheMatrix Function
        dataMatrix <- x$get()

## Use the Solve Function to find the inverse of the Matrix
        inverseMatrix <- solve(dataMatrix)

## Store the Inverse Matrix for future use
        x$setInverse(inverseMatrix)

## Return the Inverse Matrix
        inverseMatrix
}
