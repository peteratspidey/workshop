# advanced concept in R language
## some shorcut keys 
- `ctrl` + `enter` to execute the code and create a next new line
- 
## to check the current working directory
```r
 get wd()
 ```
## plotting in R
```r
plot(1,2)
```
### for terminal 
```r
png("plot.png")
plot(1,2)
dev.off()
```

### saving files as png , pdf, svg
```r
png("plot.png")
pdf("myplot.pdf")
svg("myplot.svg")
```
### with parameters
```r
png("plot.png", width=800, height=600)
```
> this will create a png file and stores the plot into it

## for writing the comment use "#"
```r
  # this line is a comment 
```

## for assigning a variable use assignment operator
```r
a = 10
```
`a` is the variable and `10` is the constant
> if we assign new value to `a` it will change*

## assigning a string to a variable
```r
a = "this is a string"
```
> meaning of the double quote is as it is

## printing a variable
```r
print(a)
```

## data structure
*vector - 1D data structure*
> need a c() function
```r
 my_vector = c(10,21,"DECODE") 
class_students = c("avinash", "sam", "rudra", "matt", "phillip")
print(class_students[1]) 
print (class_students[c(1,3,5)])
```
> use of combine function

## ignoring the elements on basis of index
```r
print (class_students[-4])
```
*this will ignore 4th elemnt but print rest*

## other basics functions
```r
numerical_vec = c(22,44,66,88)
sum (numerical_vec)
log (numerical_vec)
min (numerical_vec)
max (numerical_vec)
mean (numerical_vec)
median (numerical_vec)
sd (numerical_vec)
```

## function
### set of instructions
* library
* user defined
### every function has two things
* definition
* calling

## data frame - 2D data structure 
`so it contains rows and columns `
*collection of vectors*

```r
class_students=c("Avinash","Rudra","Sam","Matt","Phillip","Mohamed","Fazdly","Alias","Suhaili","Lily")
score_students=c(55,68,49,71,98,90,95,93,97,91)
qualification_students=c("PhD","Master","PhD","MBA","PhD",'PhD','MD','PhD','MD','PhD') 

student_record = data.frame(class_students, score_students, qualification_students)
print(student_record) 

student_record = data.frame("name"= class_students,"marks" = score_students, "qualification" = qualification_students)
print(student_record) 
```
***view function is case sensitive so first letter is to be capital and will only work in Rstudio as View()***

