
###Matrix algebra

The data structure **array** is used in Julia for matrix algebra. Let's start
with constructing matrices and vectors.

####<font,color="blue">construct a matrix</font>


    X1=[1 2 1
       2 1 3]
    
    X2=[1 2 1; 2 1 3]




    2x3 Array{Int64,2}:
     1  2  1
     2  1  3




    println("The type of X1 is ",typeof(X1))
    println("The type of X2 is ",typeof(X2))

    The type of X1 is Array{Int64,2}
    The type of X2 is Array{Int64,2}


The **typeof( )** function is used to check the type of the matrix.

> Array{Int64,2}

This array has 2 dimension and the type of the elements contained in the array
is Int64.

####<font,color="blue">construct a vector</font>


    y=[1,2,3]




    3-element Array{Int64,1}:
     1
     2
     3




    println("The type of y is ",typeof(y))

    The type of y is Array{Int64,1}


A vector is a one-dimension array.

####<font,color="blue">construct a special matrix or vector</font>


    println("construct a matrix of 1s")
    println(ones(2,3))
    println("construct a matrix of 0s")
    println(zeros(2,3))
    println("construct a matrix of true")
    println(trues(2,3))
    println("construct a matrix with elements sampled from random normal")
    println(round(randn(2,3),2))

    construct a matrix of 1s
    [1.0 1.0 1.0
     1.0 1.0 1.0]
    construct a matrix of 0s
    [0.0 0.0 0.0
     0.0 0.0 0.0]
    construct a matrix of true
    Bool[true true true
         true true true]
    construct a matrix with elements sampled from random normal
    [-1.11 -0.04 0.81
     0.98 0.06 -1.87]


####<font,color="blue">Basic funtions for arrays</font>


    X=[1 2 1 2;1 3 1 2]




    2x4 Array{Int64,2}:
     1  2  1  2
     1  3  1  2




    println("The number of elements in X is ",length(X))
    println("The number of rows and columns in X is ",size(X))
    println("The number of columns in X is ",size(X,2))

    The number of elements in X is 8
    The number of rows and columns in X is (2,4)
    The number of columns in X is 4


####<font,color="blue">Learn other functions for array by an example</font>

<font,color="charcoal">1. declare an uninitilazed matrix $M$</font>


    M=Array(Float64,2,3)




    2x3 Array{Float64,2}:
     2.47033e-323  1.03754e-322  9.38725e-323
     1.08694e-322  4.94066e-323  8.89318e-323



<font,color="charcoal">2. fill $M$ with a value</font>


    fill!(M,3.0)
    M




    2x3 Array{Float64,2}:
     3.0  3.0  3.0
     3.0  3.0  3.0



<font,color="charcoal">3. construct a $3\times 3$ identity matrix</font>


    I=eye(3)




    3x3 Array{Float64,2}:
     1.0  0.0  0.0
     0.0  1.0  0.0
     0.0  0.0  1.0



<font,color="charcoal">4. concatenate $M$ and $I$ vertically</font>


    M2=vcat(M,I)




    5x3 Array{Float64,2}:
     3.0  3.0  3.0
     3.0  3.0  3.0
     1.0  0.0  0.0
     0.0  1.0  0.0
     0.0  0.0  1.0



<font,color="charcoal">5. reshape $M2$</font>


    M2=reshape(M2,3,5)




    3x5 Array{Float64,2}:
     3.0  0.0  3.0  0.0  0.0
     3.0  0.0  0.0  3.0  0.0
     1.0  3.0  1.0  3.0  1.0



<font,color="charcoal">6. copy $M2$ to $M3$</font>


    M3=copy(M2)




    3x5 Array{Float64,2}:
     3.0  0.0  3.0  0.0  0.0
     3.0  0.0  0.0  3.0  0.0
     1.0  3.0  1.0  3.0  1.0


