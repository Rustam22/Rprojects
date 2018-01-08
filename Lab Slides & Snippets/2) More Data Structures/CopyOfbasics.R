# *********************************************************************** #
#                ** Statistical Methods for Data Science I **             #
#                     ** Lab 02 - More Data Structures **                 #
# *********************************************************************** #

#' ---
#' title:  "Statistical Methods for Data Science I"
#' author: "Pierpaolo Brutti"
#' date:   "Lab 02 - More Data Structures"
#' ---

# More Data Structures

# Agenda ------------------------------------------------------------------

# - Arrays
# - Matrices
# - Lists
# - Dataframes
# - Structures of structures

# Vector structures, starting with arrays ---------------------------------

# Many data structures in R are made by adding bells and whistles to vectors, 
# so "vector structures"

# Most useful: **arrays**

x <- c(7, 8, 10, 45)
x.arr<-array(x, dim = c(2, 2))
x.arr


# `dim` says how many rows and columns; filled by columns
# Can have 3, 4,...,n dimensional arrays; `dim` is a length-n vector


dim(x.arr)
is.vector(x.arr)
is.array(x.arr)
typeof(x.arr)
str(x.arr)
attributes(x.arr)

# `typeof()` returns the type of the _elements_
# `str()` gives the **structure**: here, a numeric array, with two dimensions, 
# both indexed 1--2, and then the actual numbers


# Exercise: try all these with `x`





#--- Accessing and operating on arrays ---

# Can access a 2-D array either by pairs of indices or by the underlying vector:

x.arr[1, 2]
as.vector(x.arr)
x.arr[3]

# Omitting an index means "all of it":
x.arr[, 2]
x.arr[c(1:2), 2]


#--- Functions on arrays ---



# Using a vector-style function on a vector structure will go down to the 
# underlying vector, _unless_ the function is set up to handle arrays specially:
which(x.arr > 9)


#  Many functions _do_ preserve array structure:
y <- -x
y.arr <- array(y, dim=c(2,2))
y.arr + x.arr
y.arr



# Others specifically act on each row or column of the array separately:
rowSums(x.arr)



# Matrices ----------------------------------------------------------------

# In R, a matrix is a specialization of a 2D array
factory <- matrix(c(40, 1, 60, 3), nrow=2)
factory
is.array(factory)
is.matrix(factory)
# could also specify `ncol`, and/or `byrow=TRUE` to fill by rows.



# Element-wise operations with the usual arithmetic and comparison operators
# (e.g., `factory/3`)


# Compare whole matrices with `identical()` or `all.equal()`

#--- Matrix multiplication ---

#  Gets a special operator
six.sevens <- matrix(rep(7, 6), ncol = 3)
six.sevens
factory %*% six.sevens # [2x2] * [2x3]



# What happens if you try `six.sevens %*% factory`?

#--- Multiplying matrices and vectors ---

# Numeric vectors can act like proper vectors:
output <- c(10, 20)
factory %*% output
output %*% factory

# R silently casts the vector as either a row or a column matrix




#--- Matrix operators ---
t(factory)  # transpose
det(factory)
diag(factory)

# It can also _change_ the diagonal:
diag(factory) <- c(35, 4)
factory

# Re-set it for later:
diag(factory) <- c(40,3)

# Creating a diagonal or identity matrix
diag(c(3, 4))
diag(2)

# Inverting a matrix
solve(factory)
factory %*% solve(factory)


# Why's it called "solve" anyway?
# Solving the linear system $\mathbf{A}\vec{x} = \vec{b}$ for $\vec{x}$:


available <- c(1600,70)
solve(factory, available)
factory %*% solve(factory,available)



#--- Names in matrices ---
# We can name either rows or columns or both, with `rownames()` and `colnames()`
# These are just character vectors, and we use the same function to get and to set their values
# Names help us understand what we're working with
# Names can be used to coordinate different objects


