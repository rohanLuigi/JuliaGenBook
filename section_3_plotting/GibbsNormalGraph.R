m = array(0,2);
m[1] = 0;
m[2] = 0;
v = matrix(0.0,2,2);
v [1,1] = 1.0;
v [1,2] = 0.6;   # Note I changed this 
v [2,1] = 0.6;
v [2,2] = 1.0;

#m=[0,0]
#v=[1.0 0.6
#	0.6 1.0]
	
	




y = array(0,2);
ypair = matrix(0,nrow=100000,ncol=2)

s1.2 =sqrt( v[1,1] - v[1,2]*v[1,2]/v[2,2]);
s2.1 = sqrt(v[2,2] - v[1,2]*v[1,2]/v[1,1]);
for (iter in 1:100000){
    m1.2 = m[1] + v[1,2]/v[2,2]*(y[2] - m[2]);
    y[1] = rnorm(1,m1.2,s1.2);
    m2.1 = m[2] + v[1,2]/v[1,1]*(y[1] - m[1]);
    y[2] = rnorm(1,m2.1,s2.1);    
    ypair[iter,]=y
}

indexsort=sort(ypair[,1],decreasing=TRUE)
best=0.05*100000
index=mean(indexsort[1:best])
cat ("Selection on $index superiority = ", index)

meetboth=ypair[(ypair[,2]>-1) & (ypair[,2]<1),]
bothsort=sort(meetboth[,1],decreasing=TRUE)
both=mean(bothsort[1:best])
cat ("Selection on conformation and $index superiority = ", both)

lower_1 = m[1]-3*v[1,1]
upper_1 = m[1]+3*v[1,1]
lower_2 = m[2]-3*v[2,2]
upper_2 = m[2]+3*v[2,2]
plot(c(lower_1,upper_1),c(lower_2,upper_2),type="n",xlab="Trait 1",ylab="Trait 2")

for (iter in 1:10000){
	points (ypair[iter,1],ypair[iter,2])
	scan(file="")	
}

plot(c(lower_1,upper_1),c(lower_2,upper_2),type="n",title="Bivariate Samples", xlab="Trait 1",ylab="Trait 2")

for (iter in 1:10000){
	points (ypair[iter,1],ypair[iter,2])
	scan(file="")	
}

plot(c(lower_1,upper_1),c(lower_2,upper_2),type="n",title="Bivariate Samples - Gibbs Sampling", xlab="Trait 1",ylab="Trait 2")

	points (ypair[1,1],ypair[1,2])

for (iter in 2:10000){
	scan(file="")		
	points (ypair[iter-1,1],ypair[iter,2])
	scan(file="")	
	points (ypair[iter,1],ypair[iter,2])
}

