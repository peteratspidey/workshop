getwd()
# comment is written with starting with '#'

# variable = that can change its value


a=10 # assginment operator
# a is variable  
# 10 is constant/number/value (integer type)

a = 2.4
a
# 2.4 is float

a = 'Decode'
# this is the string and it is written in the quote or double quote
# meaning of double quote is "As it is"

print(a)

# Data Structure
# vector - 1D structure
# for creating a vector u need a "c" function
# "c" stands for combine
my_vec = c(10,2.4,"decode")
print(my_vec)

class_students = c("vivek", "jatin", "yash", "rits","palak","mohit")
# indexing and fetching elements of an array
print(class_students[2])
print(class_students[2:4])
# use of c function to print the different places of the array
print(class_students[c(1,3,5)])

print(class_students[c(2,4,6)])
# elements that not need to include in print
print(class_students[-4])

numerical_vector = c(22,44,66,88)
sum(numerical_vector)
log(numerical_vector)
min(numerical_vector)
max(numerical_vector)
sd(numerical_vector)
mean(numerical_vector)
median(numerical_vector)

# function
# set of instructions
# two types of function (A) library , (B) user defined
# every function has 2 things - definition , calling

# data frames
# it is 2D struture of rows and column
## it is a collection of vectors
class_students = c("vivek", "jatin", "yash", "rits","palak","mohit")
score_students = c(55,68,49,71,98,90)
qualification_students = c("PhD", "Masters","PhD","MPhil","MBA","MPhil")
student_record = data.frame("name"=class_students,"marks"=score_students,"degree"=qualification_students)
View(student_record)
