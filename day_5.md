# day 5 of the R basics
```r
class_students=c("Avinash","Rudra","Sam","Matt","Phillip","Mohamed","Fazdly","Alias","Suhaili","Lily")
score_students=c(55,68,49,71,98,90,95,93,97,91)
qualification_students=c("PhD","Master","PhD","MBA","PhD",'PhD','MD','PhD','MD','PhD') 
student_record = data.frame(class_students, score_students, qualification_students) 
student_record = data.frame("name"= class_students,"marks" = score_students, "qualification" = qualification_students)
```

## to check the dimensions
`dim()` function is use to check the rows and columns

## to fetch the data of particular row and column
```r
print(student_record[1,2])
```
## for continous row and particular column or particular row and continous column
```r
print(student_record[1:3,2])
```
```r
print(student_record[1,1:2])
```
## read a csv file
```r
data_local = read.csv("filename.csv")
```
## fetch csv with column header
```r
name(data_local)
```
## accessing column in a table
```r
print(data_local$temperature)
mean(data_local$temperature)
```
*** $ sign is used to accesing element

## if and else conditions
example:-
```r
if(1==2){
print("hi")
}else {
print("bye")
}
```
```r
## concept of AND (&) OR (|) 
if ((1==2) & (1==3)){
print("true")
}else{
print("false")
}
```
## loop
* container
* iterator
example:-
```r
for (x in 1:10){
print(x)
}
```
```r
for ( i in 1:10){
print ("vivek")
}
```
## count the total elements the column and total sum of all  
```r
count= 0
sumt = 0
for (x in data_local$temperature){
sum = sum+x
count = count +1
}
avg = sum /count
print(avg)
```

## user defined function
* defining the function 
```r
avg_value = function (input_vector){
sum = 0
count = 0
for ( x in input_vector){
  sum = sum+x
  count = count +1
}
avg = sum / count
print(avg)
}
```
* calling the function
```r
avg_value(data_local$temperature)
```
```r
avg_value(data_local$humidity)
```
