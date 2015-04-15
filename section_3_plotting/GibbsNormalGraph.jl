using Distributions

m=[0,0]
v=[1.0 0.6
   0.6 1.0]
	
	
nrow=100
ncol=2
ypair=Array(Float64,nrow,ncol);

y=Array(Float64,1,2)

s12 =sqrt( v[1,1] - v[1,2]*v[1,2]/v[2,2]);
s21 = sqrt(v[2,2] - v[1,2]*v[1,2]/v[1,1]);
for (iter in 1:100)
    m12 = m[1] + v[1,2]/v[2,2]*(y[2] - m[2]);
    y[1] = rand(Normal(m12,s12));
    m21 = m[2] + v[1,2]/v[1,1]*(y[1] - m[1]);
    y[2] = rand(Normal(m21,s21));    
    ypair[iter,:]=y
end

indexsort=sort(ypair[:,1],rev=true)
best=0.05*nrow
index=mean(indexsort[1:best])
println("Selection on $index superiority = ", index)


lower_1 = m[1]-3*v[1,1]
upper_1 = m[1]+3*v[1,1]
lower_2 = m[2]-3*v[2,2]
upper_2 = m[2]+3*v[2,2]


using Winston
p = FramedPlot(
         title="Bivariate Samples - Gibbs Sampling",
         xlabel="Trait 1",
         ylabel="Trait 2",
         xrange=(lower_1,upper_1),
         yrange=(lower_2,upper_2))

point1=Points(ypair[1,1],ypair[1,2],color="green")
point2=Points(ypair[1,1],ypair[1,2])
add(p,point1)

for iter=2:nrow
	readline(STDIN)
	point1=Points(ypair[iter-1,1],ypair[iter,2],color="green")
	add(p,point1,point2)
	display(p)	
	point1=Points(ypair[iter-1,1],ypair[iter,2]) #change to black
	
	readline(STDIN)
	point2=Points(ypair[iter,1],ypair[iter,2],color="green")
	add(p, point1,point2)
	display(p)	
	point2=Points(ypair[iter,1],ypair[iter,2]) #change to black
end






