# *********************************************************************** #
#                ** Statistical Methods for Data Science I **             #
#             ** Lab 01 - Basics of Data and Data Structures **           #
# *********************************************************************** #

#' ---
#' title:  "Statistical Methods for Data Science I"
#' author: "Pierpaolo Brutti"
#' date:   "Lab 01 - Basics of Data and Data Structures"
#' ---

#  Basics of Data and Data Structures

# Agenda ------------------------------------------------------------------

# - Built-in data types
# - Built-in functions and operators
# - First data structures: Vectors and arrays

# Why good statisticians learn to program ---------------------------------

x <- 0.1 + (0.2 + 0.3)
y <- (0.1 + 0.2) + 0.3
x
y
x == y


sprintf('%.17f', x)
sprintf('%.17f', y)

(0.5 - 0.3) == (0.3 - 0.1)
all.equal(0.5-0.3, 0.3-0.1)


# This looks like an integer
as.integer(7)

# To test for being a whole number, use `round()`:
round(7) == 7


# In general: be careful (...coercion...)
7 == as.integer(7)
7 == "7"
7 == as.character(7)
?identical
identical(7, as.integer(7))
identical(7, "7")

pi
cos(pi)



# Most variables are created with the **assignment operator**, `<-` or `=`  
approx.pi <- 22/7
approx.pi
diameter.in.cubits = 10
approx.pi*diameter.in.cubits



# The workspace -----------------------------------------------------------

# What names have you defined values for?
ls()
objects()

# Getting rid of variables:
rm("diameter.in.cubits")
ls()


# The search path
# Be careful to object **masking**!
search()


x <- c(7, 8, 10, 45)


# Group related data values into one object, a **data structure**
# A **vector** is a sequence of values, **all** of the same type
x <- c(7, 8, 10, 45)
x
x[1:3]
is.vector(x)


# `c()` function returns a vector containing all its arguments in order
# `x[1]` is the first element, `x[4]` is the 4th element  
# `x[-4]` is a vector containing all but the fourth element
head(x,2)
tail(x,1)


# `vector(length=6)` returns an empty vector of length 6; helpful for filling things up later
weekly.hours <- vector(length=5)
weekly.hours[5] <- 8





# Vector arithmetic -------------------------------------------------------

# Operators apply to vectors "pairwise" or "elementwise":
y <- c(-7, -8, -10, -45)
x + y
x * y

# Recycling
# Recycling repeat elements in shorter vector when combined with longer
x + c(-7,-8)
x^c(1,0,-1,0.5)

# Single numbers are vectors of length 1 for purposes of recycling:
2*x

# Can also do pairwise comparisons:
x > 9

# Note: returns Boolean vector
# Boolean operators work elementwise:
(x > 9) & (x < 20)

# Notice how to count here...
sum( (x > 9) & (x < 20) )

vector <- c(1, 2, 4, 8, 16)
sum((vector > 4) & (vector < 8))


vector1 <- c(1, 4, 8, 16)
vector2 <- c(1, 3, 9, 27)
vector1 + vector2
vector1 == vector2

identical(vector1, vector2)
identical(c(0, 1, 2, 3), c(0, 1.0, 2.0, 3))
all.equal(c(0, 1, 2, 3), c(0, 1.0, 2.0, 3))



# (Some-of-many) functions on vectors
# - `mean()`, `median()`, `sd()`, `var()`, `max()`, `min()`, `length()`, `sum()`: return single numbers
# - `sort()` returns a new vector
# - `rev()` returns a reversed version of a vector
# - `seq()` generates regular sequences (see also the colon operator `?":"`)
# - `rep()` repeat a value a number of times
# - `hist()` takes a vector of numbers and produces a histogram, a highly structured object, with the side-effect of making a plot
# - Similarly `ecdf()` produces a cumulative-density-function object
# - `summary()` gives a five-number summary of numerical vectors
#- `any()` and `all()` are useful on Boolean vectors


sort(vector1)
rev(vector1)
seq(vector1)
rep(vector1)
hist(vector1)
ecdf(vector1)
warnings()
summary(vector1)
any(vector1)
all(vector2)



# Addressing vectors ------------------------------------------------------
vector1
vector1[c(2, 4)]
vector1[c(-2, -3)]

vector1[vector1 > 9]
vector2[vector1 > 9]


places <- which(vector1 > 4)
vector2[places]

z <- c(1, 2, NA, 4, 5, NA)
z > 3
which(z > 3)



# `which()` is also quite useful in presence of `NA`
z <- c(1, 2, NA, 4, 5, NA)
z > 3
which(z > 3)


# Hence
{r}
z[z > 3]
z[which(z > 3)]



names(vector1) <- c("v1", "v2", "v3", "fred")
names(x)
vector1[c("fred", "v1")]



# Addressing vectors ------------------------------------------------------
x

# Vector of indices: *select*
x[c(2,4)]

# Vector of negative indices: *drop*
x[c(-1,-3)]

#...why that, and not  `8 10`?

# With boolean vector:
x[x > 9]
y[x > 9]

# `which()` turns a Boolean vector in vector of TRUE indices:
places <- which(x > 9)
places
y[places]

# `which()` is also quite useful in presence of `NA`
z <- c(1, 2, NA, 4, 5, NA)
z > 3
which(z > 3)

# Hence
{r}
z[z > 3]
z[which(z > 3)]

# Named components
# You can give names to elements or components of vectors
names(x) <- c("v1","v2","v3","fred")
names(x)
x[c("fred","v1")]

# note the labels in what R prints; not actually part of the value
# `names(x)` is just another vector (of characters):
names(y) <- names(x)
sort(names(x))
which(names(x)=="fred")
